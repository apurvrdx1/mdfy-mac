# mdfy-mac

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
![macOS](https://img.shields.io/badge/macOS-13%2B-lightgrey)

macOS Finder Quick Actions for converting PDFs into LLM-friendly Markdown.

Right-click any PDF in Finder → choose **mdfy-t1** or **mdfy-t2** → get a clean `.md` file next to the original.

---

## Why

Uploading raw PDFs to LLMs is wasteful. Embedded images, base64 data blobs, and binary noise inflate token counts without adding value. mdfy-mac converts PDFs to clean Markdown you can paste directly into Claude, ChatGPT, or any other LLM — without reformatting, without extra tooling.

---

## t1 vs t2

| | mdfy-t1 | mdfy-t2 |
|---|---|---|
| **Engine** | [MarkItDown](https://github.com/microsoft/markitdown) (Microsoft) | [Docling](https://github.com/DS4SD/docling) (IBM) |
| **Speed** | Fast | Slower (ML models on first run) |
| **Media stripping** | No | Yes — base64 image data replaced with placeholder |
| **Best for** | Text-heavy docs, quick conversion | PDFs with embedded images, LLM upload |
| **Output suffix** | `--t1.md` | `--t2.md` |

**Use t1** when you want a fast, faithful conversion. **Use t2** when the PDF has images or charts and you need a lean, LLM-ready file.

t2 replaces all embedded media payloads with:
```
[Embedded media omitted from source PDF]
```

---

## Output naming

`report.pdf` → `report--t1.md` or `report--t2.md`, created next to the original file.

---

## Requirements

- macOS 13 or later
- Python 3.11+
- Xcode Command Line Tools (`xcode-select --install`)

---

## Quick start

```bash
git clone https://github.com/apurvray/mdfy-mac.git
cd mdfy-mac
./install.sh
```

`install.sh` will:
1. Create a Python virtualenv at `~/pdf-md-tools/.venv`
2. Install MarkItDown and Docling into it
3. Copy the scripts to `~/bin/` and make them executable

Then wire them into Finder — see [docs/quick-actions.md](docs/quick-actions.md).

For a full walkthrough including troubleshooting, see [docs/install-macos.md](docs/install-macos.md).

---

## Terminal usage

```bash
# Convert one file
mdfy-t1.sh ~/Documents/report.pdf

# Convert multiple files
mdfy-t2.sh ~/Downloads/*.pdf
```

---

## Finder Quick Actions

Once installed, right-click any PDF in Finder and choose **mdfy-t1** or **mdfy-t2** from the Quick Actions menu. The converted `.md` file appears next to the original.

Setup takes about 5 minutes in Automator. Full instructions: [docs/quick-actions.md](docs/quick-actions.md).

---

## Environment variables

Override any default path without editing the scripts:

| Variable | Default | Purpose |
|---|---|---|
| `MDFY_TOOLS_VENV` | `~/pdf-md-tools/.venv` | Shared virtualenv root |
| `MARKITDOWN_BIN` | `$MDFY_TOOLS_VENV/bin/markitdown` | MarkItDown binary |
| `DOCLING_BIN` | `$MDFY_TOOLS_VENV/bin/docling` | Docling binary |
| `PYTHON_BIN` | `$MDFY_TOOLS_VENV/bin/python3` | Python used for media stripping in t2 |

Set these in `~/.zshrc` or at the top of your Automator Quick Action script.

---

## Known limitations

- **MarkItDown ffmpeg warning** — You may see a warning about ffmpeg not being found. This is harmless for PDF conversion; ffmpeg is only needed for audio/video files.
- **Docling first run** — Docling downloads ML models on first use. Expect 1–3 minutes the first time. Subsequent runs are fast.
- **Docling output directory** — Docling writes output to a directory, not a file. mdfy-t2 handles this transparently via a temp directory.
- **Multi-file output naming** — Output files take the base name of the input PDF. If you convert two PDFs with the same name from different folders at the same time, they will not conflict (each goes next to its source).

---

## Support

If this project saved you time or tokens, you can support its continued development here:

<a href="https://buymeacoffee.com/apurvrdx" target="_blank">
  <img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174">
</a>

---

## License

MIT — see [LICENSE](LICENSE).

Copyright (c) 2026 [Apurv Ray](https://www.apurvray.com)
