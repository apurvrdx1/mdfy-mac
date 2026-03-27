#!/bin/zsh
# mdfy-t2 — PDF to Markdown using Docling, embedded media stripped
# https://github.com/apurvray/mdfy-mac  |  MIT License  |  Apurv Ray — www.apurvray.com
set -euo pipefail

MDFY_TOOLS_VENV="${MDFY_TOOLS_VENV:-$HOME/pdf-md-tools/.venv}"
DOCLING_BIN="${DOCLING_BIN:-$MDFY_TOOLS_VENV/bin/docling}"
PYTHON_BIN="${PYTHON_BIN:-$MDFY_TOOLS_VENV/bin/python3}"
PLACEHOLDER="[Embedded media omitted from source PDF]"

if [[ ! -x "$DOCLING_BIN" ]]; then
  osascript -e "display alert \"Docling not found\" message \"Expected: $DOCLING_BIN\n\nRun install.sh or set DOCLING_BIN to override.\nSee: https://github.com/apurvray/mdfy-mac\""
  exit 1
fi

for PDF in "$@"; do
  [[ -f "$PDF" ]] || continue

  EXT="${PDF##*.}"
  if [[ "${EXT:l}" != "pdf" ]]; then
    continue
  fi

  DIR="$(dirname "$PDF")"
  BASE="$(basename "$PDF" .pdf)"
  BASE="${BASE%.PDF}"
  OUT_MD="$DIR/${BASE}--t2.md"

  WORK_DIR="$(mktemp -d)"
  trap 'rm -rf "$WORK_DIR"' EXIT INT TERM

  "$DOCLING_BIN" "$PDF" --from pdf --to md --output "$WORK_DIR"

  MD_FOUND="$(find "$WORK_DIR" -type f -name '*.md' | head -n 1)"

  if [[ -n "${MD_FOUND:-}" ]]; then
    cp "$MD_FOUND" "$OUT_MD"

    "$PYTHON_BIN" - "$OUT_MD" "$PLACEHOLDER" <<'PY'
import pathlib, re, sys

path = pathlib.Path(sys.argv[1])
placeholder = sys.argv[2]
text = path.read_text(encoding="utf-8", errors="ignore")

patterns = [
    r'!\[[^\]]*\]\(data:[^)]+\)',
    r'\[[^\]]*Image[^\]]*\]\(data:[^)]+\)',
    r'<img\b[^>]*src=["\']data:[^"\']+["\'][^>]*>',
    r'\[[^\]]+\]:\s*data:[^\s]+'
]

for pat in patterns:
    text = re.sub(pat, f'\n\n{placeholder}\n\n', text, flags=re.IGNORECASE | re.DOTALL)

text = re.sub(r'\n{3,}', '\n\n', text)
text = re.sub(
    rf'({re.escape(placeholder)}\s*){{2,}}',
    f'{placeholder}\n\n',
    text,
    flags=re.IGNORECASE
)

path.write_text(text.strip() + "\n", encoding="utf-8")
PY

  else
    osascript -e "display alert \"Docling produced no output\" message \"No .md file found for: $(basename "$PDF")\n\nVerify Docling works: $DOCLING_BIN --help\""
  fi

  rm -rf "$WORK_DIR"
done

osascript -e 'display notification "mdfy-t2 finished" with title "PDF to Markdown"'
