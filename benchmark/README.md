# mdfy-mac Benchmark

Measured across 7 representative PDFs covering academic, financial, technical, slide deck, legal, and magazine formats. Each PDF was processed three ways: raw text extraction (pdfminer baseline), mdfy-t1 (MarkItDown), and mdfy-t2 (Docling + media strip).

## Test suite

| # | PDF | Type | Size |
|---|-----|------|------|
| 1 | academic-twocolumn | Academic paper, two-column layout | 165KB |
| 2 | apple-annual-report | Financial report with dense tables | 941KB |
| 3 | rpi5-product-brief | Technical product brief | 1.1MB |
| 4 | stripe-payment-methods-guide | Developer guide, structured sections | 601KB |
| 5 | neurips2024-slides | Slide deck, image-heavy | 2.5MB |
| 6 | cooley-saas-agreement | Legal contract, dense prose | 345KB |
| 7 | nasa-spinoff-2024 | Magazine, mixed images and text | 21MB |

---

## Conversion time

t1 (MarkItDown) is consistently fast. t2 (Docling) uses ML models and is slower — the ratio varies by content type, not file size. Image-heavy and slide deck formats take the longest relative to t1.

| PDF | PDF size | raw extract | t1 | t2 | t2 / t1 |
|-----|----------|-------------|----|----|----------|
| academic-twocolumn | 165KB | <1s | 3s | 17s | 5.7x |
| apple-annual-report | 941KB | 7s | 17s | 78s | 4.6x |
| rpi5-product-brief | 1.1MB | <1s | 3s | 14s | 4.7x |
| stripe-payment-methods-guide | 601KB | 2s | 3s | 43s | 14.3x |
| neurips2024-slides | 2.5MB | <1s | 1s | 30s | 30.0x |
| cooley-saas-agreement | 345KB | 1s | 4s | 15s | 3.8x |
| nasa-spinoff-2024 | 21MB | 2s | 3s | 60s | 20.0x |

**When to use t1:** You need a conversion in under 5 seconds and the document is text-dominant (reports, contracts, articles).

**When to use t2:** The PDF has images, charts, or slide layouts, or you need structured markdown for RAG/LLM ingestion and can wait.

---

## Structure preservation

t1 extracts text only — it produces no markdown headings, no tables, and no lists on any tested PDF. t2 reconstructs full document structure using Docling's layout analysis.

| PDF | t1 headings | t2 headings | t1 tables | t2 tables | t1 lists | t2 lists |
|-----|-------------|-------------|-----------|-----------|----------|----------|
| academic-twocolumn | 0 | 14 | 0 | 0 | 0 | 63 |
| apple-annual-report | 0 | 312 | 0 | 645 | 7 | 188 |
| rpi5-product-brief | 0 | 8 | 0 | 0 | 0 | 25 |
| stripe-payment-methods-guide | 0 | 185 | 0 | 98 | 0 | 4 |
| neurips2024-slides | 1 | 20 | 0 | 0 | 0 | 15 |
| cooley-saas-agreement | 0 | 16 | 0 | 0 | 0 | 104 |
| nasa-spinoff-2024 | 0 | 26 | 0 | 41 | 0 | 3 |

The Apple annual report result is the clearest illustration: t1 produces a flat text dump while t2 extracts 312 headings, 645 tables, and 188 list items from the same PDF. For any downstream use that depends on document structure — RAG chunking, section summarization, table extraction — t1 output is not usable.

---

## Token count

Token counts are estimated at 1 token ≈ 4 characters, consistent with OpenAI and Anthropic guidance.

| PDF | Raw tokens | t1 tokens | t1 vs raw | t2 tokens | t2 vs raw |
|-----|------------|-----------|-----------|-----------|-----------|
| academic-twocolumn | 12,540 | 12,251 | −2.3% | 12,090 | −3.6% |
| apple-annual-report | 109,451 | 108,076 | −1.3% | 121,749 | +11.2% |
| rpi5-product-brief | 1,548 | 1,525 | −1.5% | 1,464 | −5.4% |
| stripe-payment-methods-guide | 12,163 | 11,887 | −2.3% | 12,283 | +1.0% |
| neurips2024-slides | 999 | 994 | −0.5% | 1,379 | +38.0% |
| cooley-saas-agreement | 21,745 | 21,376 | −1.7% | 21,359 | −1.8% |
| nasa-spinoff-2024 | 3,078 | 3,031 | −1.5% | 4,300 | +39.7% |

**t1 vs raw:** Essentially identical. t1 is a cleaner text extraction, not a compression tool.

**t2 vs raw:** Varies significantly by document type. Text-dominant PDFs (legal, academic, product brief) see modest savings. Image-heavy and slide PDFs (NASA, NeurIPS) show token increases of 38–40% because Docling reconstructs structure — headings, tables, lists — that was not present in the raw text dump. Those added tokens represent real document content, not noise.

---

## Media stripping (t2)

t2 removes all embedded base64 image payloads and replaces them with a single-line placeholder. This is the primary token efficiency mechanism for PDFs with embedded media.

| PDF | Placeholders inserted | Data URIs remaining |
|-----|----------------------|---------------------|
| academic-twocolumn | 0 | 0 |
| apple-annual-report | 4 | 0 |
| rpi5-product-brief | 5 | 0 |
| stripe-payment-methods-guide | 27 | 0 |
| neurips2024-slides | 20 | 0 |
| cooley-saas-agreement | 22 | 0 |
| nasa-spinoff-2024 | 45 | 0 |

Zero data URIs remaining across all 7 PDFs confirms the stripping is complete. The NASA magazine and Stripe guide had the highest embedded media density.

---

## Per-PDF notes

**academic-twocolumn** — Two-column academic paper. Raw and t1 output are nearly identical flat text. t2 correctly identifies 14 section headings and 63 structured list items, recovering the paper's logical hierarchy despite the complex two-column layout.

**apple-annual-report** — Dense financial report. t2 extracts 645 tables and 312 headings — the difference between a document an LLM can reason about versus a 109K-token wall of numbers. Token count is 11% higher with t2 due to table markdown syntax overhead, which is expected and acceptable.

**rpi5-product-brief** — Image-heavy product brief (1.1MB PDF, only 1.5KB of extractable text). Raw and t1 nearly identical. t2 strips 5 embedded images and adds proper heading hierarchy.

**stripe-payment-methods-guide** — Developer reference guide. t2 recovers 185 headings and 98 tables — the guide's entire section and reference table structure — at essentially the same token cost as raw. 27 media placeholders stripped.

**neurips2024-slides** — Slide deck. Raw text extraction yields almost nothing useful (999 tokens from a 2.5MB file). t2 recovers 20 slide headings, 15 list items, and correctly identifies 20 image placeholders. Token count is 38% higher than raw because t2 is recovering content that pdfminer missed entirely.

**cooley-saas-agreement** — Legal contract, minimal images. All three methods produce similar token counts. t2 adds value through structure: 16 headings and 104 list items correctly segment the contract clauses. t2 is the right format for any downstream clause extraction or legal QA task.

**nasa-spinoff-2024** — 21MB magazine-style PDF. The largest file in the suite. Raw and t1 extract only 3KB of text from 21MB. t2 recovers 26 headings, 41 tables, and strips 45 media placeholders. The 40% token increase reflects meaningful content recovery, not bloat.

---

## How to re-run

```bash
# From repo root — runs all 3 methods on all PDFs with timing
zsh benchmark/run.sh

# Compute metrics from existing outputs
python3 benchmark/measure.py

# Results written to:
# benchmark/results/timing.json
# benchmark/results/metrics.json
# benchmark/results/summary.md
```

Test PDFs are in `test-pdfs/`. Converted outputs are in `test-outputs/{raw,t1,t2}/`.
