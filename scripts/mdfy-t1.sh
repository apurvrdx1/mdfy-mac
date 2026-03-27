#!/bin/zsh
# mdfy-t1 — PDF to Markdown using MarkItDown
# https://github.com/apurvray/mdfy-mac  |  MIT License  |  Apurv Ray — www.apurvray.com
set -euo pipefail

MDFY_TOOLS_VENV="${MDFY_TOOLS_VENV:-$HOME/pdf-md-tools/.venv}"
MARKITDOWN_BIN="${MARKITDOWN_BIN:-$MDFY_TOOLS_VENV/bin/markitdown}"

if [[ ! -x "$MARKITDOWN_BIN" ]]; then
  osascript -e "display alert \"MarkItDown not found\" message \"Expected: $MARKITDOWN_BIN\n\nRun install.sh or set MARKITDOWN_BIN to override.\nSee: https://github.com/apurvray/mdfy-mac\""
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
  OUT_MD="$DIR/${BASE}--t1.md"

  "$MARKITDOWN_BIN" "$PDF" -o "$OUT_MD"
done

osascript -e 'display notification "mdfy-t1 finished" with title "PDF to Markdown"'
