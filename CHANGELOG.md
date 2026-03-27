# Changelog

All notable changes to this project will be documented in this file.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [0.1.0] - 2026-03-27

### Added

- `mdfy-t1.sh` — PDF to Markdown via MarkItDown (Microsoft)
- `mdfy-t2.sh` — PDF to Markdown via Docling (IBM) with embedded media stripped and replaced by a placeholder
- `install.sh` — one-command setup: creates virtualenv, installs dependencies, copies scripts to `~/bin/`
- Finder Quick Action support via Automator (see `docs/quick-actions.md`)
- Overridable environment variables: `MDFY_TOOLS_VENV`, `MARKITDOWN_BIN`, `DOCLING_BIN`, `PYTHON_BIN`
- Documentation: installation guide and Quick Action setup guide
