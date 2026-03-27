# Finder Quick Actions Setup

This guide walks you through wiring `mdfy-t1` and `mdfy-t2` into macOS Finder as right-click Quick Actions.

Once set up, you can select one or more PDFs in Finder, right-click, and choose **mdfy-t1** or **mdfy-t2** from the Quick Actions menu. The converted Markdown file appears next to the original PDF.

---

## Prerequisites

Make sure you've completed [install-macos.md](install-macos.md) and confirmed the scripts work from Terminal before proceeding.

---

## How Quick Actions work

Quick Actions are Automator workflows stored in `~/Library/Services/`. When you right-click a file in Finder, macOS checks that folder for workflows that accept the file type you clicked on.

We'll create one workflow for each script. The workflow does one thing: run the shell script, passing the selected files as arguments.

---

## Step-by-step: Create the mdfy-t1 Quick Action

### 1. Open Automator

Launch **Automator** from Applications or Spotlight (`Cmd+Space` → type "Automator").

### 2. Create a new document

Choose **File → New** (or `Cmd+N`). When prompted, select **Quick Action** as the document type. Click **Choose**.

### 3. Configure the workflow input

At the top of the workflow panel, set:

- **Workflow receives current** → `files or folders`
- **in** → `Finder`
- Leave "Image" and "Color" at their defaults

### 4. Add a Run Shell Script action

In the search bar on the left, type **Run Shell Script**. Double-click it (or drag it into the workflow area on the right).

### 5. Configure the action

In the Run Shell Script action box:

- **Shell** → `/bin/zsh`
- **Pass input** → `as arguments`

Replace the default script content with:

```bash
$HOME/bin/mdfy-t1.sh "$@"
```

If your scripts are in a different location, use that path instead.

**If you have a non-standard venv location**, add the env var before the script call:

```bash
export MDFY_TOOLS_VENV="$HOME/pdf-md-tools/.venv"
$HOME/bin/mdfy-t1.sh "$@"
```

### 6. Save the workflow

Choose **File → Save** (`Cmd+S`). Name it exactly:

```
mdfy-t1
```

Automator will save it to `~/Library/Services/mdfy-t1.workflow` automatically.

---

## Step-by-step: Create the mdfy-t2 Quick Action

Repeat the same steps, but in step 5 use:

```bash
$HOME/bin/mdfy-t2.sh "$@"
```

And save as:

```
mdfy-t2
```

---

## Test the Quick Actions

1. Open Finder and navigate to any PDF file.
2. Right-click (or Control-click) the file.
3. Look for **Quick Actions** in the context menu. You should see **mdfy-t1** and **mdfy-t2**.
4. Click one. After a moment, a `.md` file should appear next to the PDF.

---

## If the Quick Actions don't appear in the menu

**Refresh the services cache:**

```bash
/System/Library/CoreServices/pbs -update
killall cfprefsd
killall Finder
```

Wait a few seconds, then try right-clicking a PDF again.

**Check Finder settings:**

On macOS Ventura and later:
- Open **System Settings → Privacy & Security → Extensions → Finder Extensions**
- Make sure your Quick Actions are enabled

On macOS Monterey and earlier:
- Open **System Preferences → Extensions → Finder**
- Check the boxes next to mdfy-t1 and mdfy-t2

**Confirm the workflow files exist:**

```bash
ls ~/Library/Services/
```

You should see `mdfy-t1.workflow` and `mdfy-t2.workflow`.

---

## Why Automator has a different PATH than Terminal

Automator Quick Actions run with a minimal PATH (`/usr/bin:/bin:/usr/sbin:/sbin`). Binaries installed in your virtualenv — or anywhere under `$HOME` — are not on this PATH.

The mdfy scripts avoid this by using absolute paths to all binaries (resolved from `MDFY_TOOLS_VENV` at runtime). As long as the virtualenv is at the default location (`~/pdf-md-tools/.venv`) or you've set the env var override in the Automator script, this is handled for you automatically.

---

## Editing an existing Quick Action

To modify a Quick Action after saving:

1. Open Automator
2. File → Open → navigate to `~/Library/Services/`
3. Select the `.workflow` file and open it
4. Make your changes and save

---

## Removing a Quick Action

Delete the workflow file:

```bash
rm -rf ~/Library/Services/mdfy-t1.workflow
rm -rf ~/Library/Services/mdfy-t2.workflow
```

Then refresh the cache:

```bash
killall cfprefsd && killall Finder
```
