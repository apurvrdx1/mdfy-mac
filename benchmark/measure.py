#!/usr/bin/env python3
"""
benchmark/measure.py — Compute metrics across raw/t1/t2 outputs for all test PDFs.

Metrics per PDF:
  - File sizes (bytes, chars)
  - Token count estimate (chars / 4)
  - Token reduction % vs raw
  - Structure score: heading count, table count, list item count
  - Noise: artifact lines (encoding junk), avg line length
  - t2-specific: media placeholder count (proxy for stripped bytes)

Outputs: benchmark/results/metrics.json + benchmark/results/summary.md
"""

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).parent.parent
OUT  = REPO / "test-outputs"
RESULTS = REPO / "benchmark" / "results"
TIMING_FILE = RESULTS / "timing.json"

ARTIFACT_RE = re.compile(r'[\x00-\x08\x0b\x0c\x0e-\x1f\x7f-\x9f]|â€|Ã\xa0')
HEADING_RE  = re.compile(r'^#{1,6}\s+\S', re.MULTILINE)
TABLE_RE    = re.compile(r'^\|.+\|', re.MULTILINE)
LIST_RE     = re.compile(r'^[\s]*[-*+]\s+\S', re.MULTILINE)
MEDIA_PH_RE = re.compile(r'\[Embedded media omitted from source PDF\]')
DATA_URI_RE = re.compile(r'data:[a-z]+/[a-z+]+;base64,', re.IGNORECASE)


def token_count(text: str) -> int:
    """Rough estimate: 1 token ≈ 4 characters (OpenAI/Anthropic rule of thumb)."""
    return len(text) // 4


def structure_score(text: str) -> dict:
    return {
        "headings":   len(HEADING_RE.findall(text)),
        "tables":     len(TABLE_RE.findall(text)),
        "list_items": len(LIST_RE.findall(text)),
    }


def noise_score(text: str) -> dict:
    lines = text.splitlines()
    artifact_lines = sum(1 for l in lines if ARTIFACT_RE.search(l))
    non_empty = [l for l in lines if l.strip()]
    avg_len = sum(len(l) for l in non_empty) / max(len(non_empty), 1)
    return {
        "artifact_lines": artifact_lines,
        "avg_line_length": round(avg_len, 1),
        "total_lines": len(lines),
    }


def analyze(path: Path) -> dict:
    if not path.exists():
        return {"error": "missing"}
    text = path.read_text(encoding="utf-8", errors="ignore")
    return {
        "bytes": path.stat().st_size,
        "chars": len(text),
        "tokens": token_count(text),
        "structure": structure_score(text),
        "noise": noise_score(text),
        "data_uris_remaining": len(DATA_URI_RE.findall(text)),
    }


def analyze_t2(path: Path) -> dict:
    result = analyze(path)
    if "error" not in result:
        text = path.read_text(encoding="utf-8", errors="ignore")
        result["media_placeholders"] = len(MEDIA_PH_RE.findall(text))
    return result


def load_timing() -> dict:
    if not TIMING_FILE.exists():
        return {}
    try:
        entries = json.loads(TIMING_FILE.read_text())
        return {e["pdf"]: e for e in entries}
    except (json.JSONDecodeError, KeyError):
        return {}


def fmt(val) -> str:
    return f"{val:,}" if isinstance(val, int) else str(val)


def pct_reduction(raw_tokens: int, converted_tokens: int) -> str:
    if raw_tokens == 0:
        return "n/a"
    r = (1 - converted_tokens / raw_tokens) * 100
    return f"{r:+.1f}%"


def main():
    timing = load_timing()
    pdfs = sorted(p.stem.replace("--raw", "") for p in (OUT / "raw").glob("*--raw.txt"))

    all_results = []

    for name in pdfs:
        raw  = analyze(OUT / "raw"  / f"{name}--raw.txt")
        t1   = analyze(OUT / "t1"   / f"{name}--t1.md")
        t2   = analyze_t2(OUT / "t2" / f"{name}--t2.md")
        t    = timing.get(name, {})

        raw_tok = raw.get("tokens", 0)

        entry = {
            "pdf": name,
            "pdf_bytes": t.get("pdf_bytes"),
            "timing": {
                "raw_secs": t.get("raw_secs"),
                "t1_secs":  t.get("t1_secs"),
                "t2_secs":  t.get("t2_secs"),
            },
            "raw": raw,
            "t1": {**t1, "token_reduction_vs_raw": pct_reduction(raw_tok, t1.get("tokens", 0))},
            "t2": {**t2, "token_reduction_vs_raw": pct_reduction(raw_tok, t2.get("tokens", 0))},
        }
        all_results.append(entry)

    # ── write JSON ─────────────────────────────────────────────────────────────
    out_json = RESULTS / "metrics.json"
    out_json.write_text(json.dumps(all_results, indent=2))
    print(f"✓ metrics.json written")

    # ── write markdown summary table ───────────────────────────────────────────
    lines = [
        "# mdfy-mac Benchmark Results\n",
        "## Token Efficiency\n",
        "| PDF | PDF size | Raw tokens | t1 tokens | t1 reduction | t2 tokens | t2 reduction |",
        "|-----|----------|------------|-----------|--------------|-----------|--------------|",
    ]
    for e in all_results:
        pdf_kb = f"{e['pdf_bytes']//1024}KB" if e["pdf_bytes"] else "?"
        lines.append(
            f"| {e['pdf']} | {pdf_kb} "
            f"| {fmt(e['raw'].get('tokens','?'))} "
            f"| {fmt(e['t1'].get('tokens','?'))} | {e['t1'].get('token_reduction_vs_raw','?')} "
            f"| {fmt(e['t2'].get('tokens','?'))} | {e['t2'].get('token_reduction_vs_raw','?')} |"
        )

    lines += [
        "\n## Conversion Time (seconds)\n",
        "| PDF | PDF size | raw extract | t1 (MarkItDown) | t2 (Docling) | t2 / t1 ratio |",
        "|-----|----------|-------------|-----------------|--------------|---------------|",
    ]
    for e in all_results:
        pdf_kb = f"{e['pdf_bytes']//1024}KB" if e["pdf_bytes"] else "?"
        t1s = e["timing"].get("t1_secs") or 0
        t2s = e["timing"].get("t2_secs") or 0
        ratio = f"{t2s/t1s:.1f}x" if t1s else "?"
        lines.append(
            f"| {e['pdf']} | {pdf_kb} "
            f"| {e['timing'].get('raw_secs','?')}s "
            f"| {t1s}s "
            f"| {t2s}s "
            f"| {ratio} |"
        )

    lines += [
        "\n## Structure Preservation (t1 vs t2)\n",
        "| PDF | t1 headings | t2 headings | t1 tables | t2 tables | t1 lists | t2 lists |",
        "|-----|-------------|-------------|-----------|-----------|----------|----------|",
    ]
    for e in all_results:
        t1s = e["t1"].get("structure", {})
        t2s = e["t2"].get("structure", {})
        lines.append(
            f"| {e['pdf']} "
            f"| {t1s.get('headings','?')} | {t2s.get('headings','?')} "
            f"| {t1s.get('tables','?')} | {t2s.get('tables','?')} "
            f"| {t1s.get('list_items','?')} | {t2s.get('list_items','?')} |"
        )

    lines += [
        "\n## Noise & t2 Media Stripping\n",
        "| PDF | raw artifact lines | t1 artifact lines | t2 artifact lines | t2 media placeholders | t2 data URIs remaining |",
        "|-----|-------------------|-------------------|-------------------|-----------------------|------------------------|",
    ]
    for e in all_results:
        lines.append(
            f"| {e['pdf']} "
            f"| {e['raw'].get('noise',{}).get('artifact_lines','?')} "
            f"| {e['t1'].get('noise',{}).get('artifact_lines','?')} "
            f"| {e['t2'].get('noise',{}).get('artifact_lines','?')} "
            f"| {e['t2'].get('media_placeholders','?')} "
            f"| {e['t2'].get('data_uris_remaining','?')} |"
        )

    out_md = RESULTS / "summary.md"
    out_md.write_text("\n".join(lines) + "\n")
    print(f"✓ summary.md written")
    print(f"\nResults in: {RESULTS}/")


if __name__ == "__main__":
    main()
