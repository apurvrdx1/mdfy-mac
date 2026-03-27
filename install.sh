#!/usr/bin/env bash
# install.sh — Set up mdfy-mac on macOS
# https://github.com/apurvray/mdfy-mac  |  MIT License  |  Apurv Ray — www.apurvray.com
set -euo pipefail

MDFY_TOOLS_VENV="${MDFY_TOOLS_VENV:-$HOME/pdf-md-tools/.venv}"
SCRIPTS_DIR="${SCRIPTS_DIR:-$HOME/bin}"

# --- helpers ---

info() { printf "  \033[0;34m▸\033[0m %s\n" "$*"; }
ok()   { printf "  \033[0;32m✓\033[0m %s\n" "$*"; }
warn() { printf "  \033[0;33m!\033[0m %s\n" "$*"; }
die()  { printf "\n\033[0;31merror:\033[0m %s\n\n" "$*" >&2; exit 1; }

printf "\n\033[1mmdfy-mac installer\033[0m\n\n"

# --- python check ---

command -v python3 &>/dev/null || die "python3 not found. Install Python 3.11+ from python.org or via Homebrew: brew install python@3.11"

PYTHON_MAJOR=$(python3 -c "import sys; print(sys.version_info.major)")
PYTHON_MINOR=$(python3 -c "import sys; print(sys.version_info.minor)")

if [[ "$PYTHON_MAJOR" -lt 3 || ( "$PYTHON_MAJOR" -eq 3 && "$PYTHON_MINOR" -lt 11 ) ]]; then
  die "Python 3.11+ required (found $PYTHON_MAJOR.$PYTHON_MINOR). Install via Homebrew: brew install python@3.11"
fi

ok "Python $PYTHON_MAJOR.$PYTHON_MINOR found"

# --- virtualenv ---

if [[ -d "$MDFY_TOOLS_VENV" ]]; then
  ok "Virtualenv already exists at $MDFY_TOOLS_VENV"
else
  info "Creating virtualenv at $MDFY_TOOLS_VENV"
  mkdir -p "$(dirname "$MDFY_TOOLS_VENV")"
  python3 -m venv "$MDFY_TOOLS_VENV"
  ok "Virtualenv created"
fi

# --- dependencies ---

info "Installing Python dependencies (markitdown + docling)"
warn "First-time Docling setup downloads ML models — this can take 1–3 minutes"
"$MDFY_TOOLS_VENV/bin/pip" install --quiet --upgrade pip
"$MDFY_TOOLS_VENV/bin/pip" install --quiet -r "$(dirname "${BASH_SOURCE[0]}")/requirements.txt"
ok "Dependencies installed"

# --- scripts ---

mkdir -p "$SCRIPTS_DIR"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for script in mdfy-t1.sh mdfy-t2.sh; do
  cp "$REPO_DIR/scripts/$script" "$SCRIPTS_DIR/$script"
  chmod +x "$SCRIPTS_DIR/$script"
  ok "Installed $SCRIPTS_DIR/$script"
done

# --- path check ---

printf "\n"
if ! printf '%s\n' "${PATH//:/$'\n'}" | grep -qx "$SCRIPTS_DIR"; then
  warn "$SCRIPTS_DIR is not in your PATH"
  warn "Add this to your ~/.zshrc and restart Terminal:"
  warn "  export PATH=\"\$HOME/bin:\$PATH\""
fi

# --- done ---

printf "\n\033[1mDone!\033[0m Scripts installed to %s\n\n" "$SCRIPTS_DIR"
printf "Test from Terminal:\n"
printf "  mdfy-t1.sh /path/to/file.pdf\n"
printf "  mdfy-t2.sh /path/to/file.pdf\n\n"
printf "Next: wire the scripts into Finder Quick Actions\n"
printf "  See docs/quick-actions.md\n\n"
