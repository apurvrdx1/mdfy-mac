# Installation — macOS

This guide covers everything from prerequisites to testing your first conversion.

---

## Prerequisites

**Xcode Command Line Tools**

Required for Python and git. If you haven't installed them:

```bash
xcode-select --install
```

**Python 3.11 or later**

Check what you have:

```bash
python3 --version
```

If you need to install or upgrade, the recommended option is Homebrew:

```bash
brew install python@3.11
```

Or download directly from [python.org](https://www.python.org/downloads/macos/).

---

## Option 1: Automated install (recommended)

Clone the repo and run the installer:

```bash
git clone https://github.com/apurvray/mdfy-mac.git
cd mdfy-mac
./install.sh
```

This will:
1. Check your Python version
2. Create a virtualenv at `~/pdf-md-tools/.venv`
3. Install MarkItDown and Docling into the virtualenv
4. Copy `mdfy-t1.sh` and `mdfy-t2.sh` to `~/bin/` and make them executable

**Note:** Docling downloads ML models on first package install. This can take 1–3 minutes depending on your connection.

---

## Option 2: Manual install

If you prefer to set things up by hand:

### 1. Create the shared virtualenv

```bash
mkdir -p ~/pdf-md-tools
python3 -m venv ~/pdf-md-tools/.venv
```

### 2. Install dependencies

```bash
~/pdf-md-tools/.venv/bin/pip install --upgrade pip
~/pdf-md-tools/.venv/bin/pip install markitdown docling
```

### 3. Copy the scripts

```bash
mkdir -p ~/bin
cp scripts/mdfy-t1.sh ~/bin/
cp scripts/mdfy-t2.sh ~/bin/
chmod +x ~/bin/mdfy-t1.sh ~/bin/mdfy-t2.sh
```

### 4. Add `~/bin` to your PATH

If it isn't already, add this to your `~/.zshrc`:

```bash
export PATH="$HOME/bin:$PATH"
```

Then reload:

```bash
source ~/.zshrc
```

---

## Test the installation

```bash
# Verify the binaries are reachable
~/pdf-md-tools/.venv/bin/markitdown --help
~/pdf-md-tools/.venv/bin/docling --help

# Convert a PDF with each tool
mdfy-t1.sh ~/Downloads/some-document.pdf
mdfy-t2.sh ~/Downloads/some-document.pdf
```

You should see `some-document--t1.md` and `some-document--t2.md` appear next to the original.

---

## Uninstall

Remove the scripts:

```bash
rm ~/bin/mdfy-t1.sh ~/bin/mdfy-t2.sh
```

Remove the virtualenv and its packages:

```bash
rm -rf ~/pdf-md-tools/.venv
```

If you no longer need the directory:

```bash
rm -rf ~/pdf-md-tools
```

---

## Customization

You can override any default path using environment variables. Set them in `~/.zshrc`:

```bash
export MDFY_TOOLS_VENV="$HOME/my-tools/.venv"   # custom venv location
export MARKITDOWN_BIN="/opt/homebrew/bin/markitdown"  # custom binary
export DOCLING_BIN="/opt/homebrew/bin/docling"
export PYTHON_BIN="$HOME/my-tools/.venv/bin/python3"
```

The same variables work inside Automator Quick Action scripts (see [quick-actions.md](quick-actions.md)).

---

## Troubleshooting

### "MarkItDown not found" alert in Finder

The script cannot find the `markitdown` binary at the expected path. Check:

```bash
ls ~/pdf-md-tools/.venv/bin/markitdown
```

If it's missing, reinstall:

```bash
~/pdf-md-tools/.venv/bin/pip install markitdown
```

If your venv is in a different location, set `MARKITDOWN_BIN` or `MDFY_TOOLS_VENV` in the Automator Quick Action script (see [quick-actions.md](quick-actions.md)).

### "Docling not found" alert in Finder

Same resolution as above, replacing `markitdown` with `docling`:

```bash
ls ~/pdf-md-tools/.venv/bin/docling
~/pdf-md-tools/.venv/bin/pip install docling
```

### MarkItDown ffmpeg warning

You may see a message like:

```
WARNING: ffmpeg not found. Audio conversion will not work.
```

This is harmless for PDF conversion. ffmpeg is only used for audio and video files. You can safely ignore it.

### Docling is slow the first time

Docling downloads layout and OCR models on its first run (not on install). The first conversion can take a few minutes while models are cached locally. All subsequent conversions are fast.

### Script works in Terminal but not in Finder

Automator Quick Actions run in a restricted environment with a minimal `PATH` (`/usr/bin:/bin:/usr/sbin:/sbin`). The scripts avoid this by using absolute paths to all binaries. If you see errors in Finder but not Terminal, verify your env var configuration in the Quick Action script — see [quick-actions.md](quick-actions.md).

### Output file not appearing

Check that the input file is actually a `.pdf` (or `.PDF`). The scripts skip files that don't have a PDF extension.

If the conversion ran but produced no output, run the script from Terminal with a specific file and look for error output:

```bash
~/bin/mdfy-t2.sh ~/Downloads/problem-file.pdf
```
