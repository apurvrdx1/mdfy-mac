#!/bin/zsh
# benchmark/run.sh — Run all 3 conversion methods on test PDFs and record timing
# Outputs: test-outputs/{raw,t1,t2}/*.{txt,md} + benchmark/results/timing.json

set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PDF_DIR="$REPO_DIR/test-pdfs"
OUT_DIR="$REPO_DIR/test-outputs"
RESULTS_DIR="$REPO_DIR/benchmark/results"

SCRIPTS_DIR="$REPO_DIR/scripts"
VENV="$HOME/pdf-md-tools/.venv"
PYTHON_BIN="$VENV/bin/python3"
MARKITDOWN_BIN="$VENV/bin/markitdown"

mkdir -p "$OUT_DIR/raw" "$OUT_DIR/t1" "$OUT_DIR/t2" "$RESULTS_DIR"

TIMING_FILE="$RESULTS_DIR/timing.json"
echo "[" > "$TIMING_FILE"
FIRST=1

for PDF in "$PDF_DIR"/*.pdf; do
  [[ -f "$PDF" ]] || continue
  NAME="$(basename "$PDF" .pdf)"
  PDF_BYTES="$(wc -c < "$PDF" | tr -d ' ')"

  echo "\n=== $NAME ($(( PDF_BYTES / 1024 ))KB) ==="

  # ── raw extraction (pdfminer) ──────────────────────────────────────────────
  RAW_OUT="$OUT_DIR/raw/${NAME}--raw.txt"
  echo "  [raw] extracting..."
  RAW_START=$SECONDS
  $PYTHON_BIN - "$PDF" "$RAW_OUT" <<'PY'
import sys
from pdfminer.high_level import extract_text
text = extract_text(sys.argv[1])
with open(sys.argv[2], 'w', encoding='utf-8') as f:
    f.write(text)
PY
  RAW_SECS=$(( SECONDS - RAW_START ))
  echo "  [raw] done in ${RAW_SECS}s"

  # ── t1 (MarkItDown) ────────────────────────────────────────────────────────
  T1_OUT="$OUT_DIR/t1/${NAME}--t1.md"
  echo "  [t1]  converting..."
  T1_START=$SECONDS
  "$MARKITDOWN_BIN" "$PDF" -o "$T1_OUT"
  T1_SECS=$(( SECONDS - T1_START ))
  echo "  [t1]  done in ${T1_SECS}s"

  # ── t2 (Docling + media strip) ─────────────────────────────────────────────
  T2_OUT="$OUT_DIR/t2/${NAME}--t2.md"
  echo "  [t2]  converting (Docling — slow for large PDFs)..."
  T2_START=$SECONDS
  WORK_DIR="$(mktemp -d)"
  trap 'rm -rf "$WORK_DIR"' EXIT INT TERM

  MDFY_TOOLS_VENV="$VENV" \
  DOCLING_BIN="$VENV/bin/docling" \
  PYTHON_BIN="$PYTHON_BIN" \
    zsh "$SCRIPTS_DIR/mdfy-t2.sh" "$PDF"

  # mdfy-t2 writes output next to input — move to our output dir
  SRC="$PDF_DIR/${NAME}--t2.md"
  [[ -f "$SRC" ]] && mv "$SRC" "$T2_OUT"

  rm -rf "$WORK_DIR"
  T2_SECS=$(( SECONDS - T2_START ))
  echo "  [t2]  done in ${T2_SECS}s"

  # ── write timing entry ─────────────────────────────────────────────────────
  [[ $FIRST -eq 0 ]] && echo "," >> "$TIMING_FILE"
  FIRST=0

  cat >> "$TIMING_FILE" <<JSON
  {
    "pdf": "$NAME",
    "pdf_bytes": $PDF_BYTES,
    "raw_secs": $RAW_SECS,
    "t1_secs": $T1_SECS,
    "t2_secs": $T2_SECS
  }
JSON

done

echo "]" >> "$TIMING_FILE"
echo "\n✓ Done. Timing saved to $TIMING_FILE"
