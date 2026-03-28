# mdfy-mac Benchmark Results

## Token Efficiency

| PDF | PDF size | Raw tokens | t1 tokens | t1 reduction | t2 tokens | t2 reduction |
|-----|----------|------------|-----------|--------------|-----------|--------------|
| 1-academic-twocolumn | 164KB | 12,540 | 12,251 | +2.3% | 12,090 | +3.6% |
| 2-apple-annual-report | 941KB | 109,451 | 108,076 | +1.3% | 121,749 | -11.2% |
| 3-rpi5-product-brief | 1081KB | 1,548 | 1,525 | +1.5% | 1,464 | +5.4% |
| 4-stripe-payment-methods-guide | 601KB | 12,163 | 11,887 | +2.3% | 12,283 | -1.0% |
| 5-neurips2024-slides | 2551KB | 999 | 994 | +0.5% | 1,379 | -38.0% |
| 6-cooley-saas-agreement | 345KB | 21,745 | 21,376 | +1.7% | 21,359 | +1.8% |
| 7-nasa-spinoff-2024 | 21037KB | 3,078 | 3,031 | +1.5% | 4,300 | -39.7% |

## Conversion Time (seconds)

| PDF | PDF size | raw extract | t1 (MarkItDown) | t2 (Docling) | t2 / t1 ratio |
|-----|----------|-------------|-----------------|--------------|---------------|
| 1-academic-twocolumn | 164KB | 0s | 3s | 17s | 5.7x |
| 2-apple-annual-report | 941KB | 7s | 17s | 78s | 4.6x |
| 3-rpi5-product-brief | 1081KB | 0s | 3s | 14s | 4.7x |
| 4-stripe-payment-methods-guide | 601KB | 2s | 3s | 43s | 14.3x |
| 5-neurips2024-slides | 2551KB | 0s | 1s | 30s | 30.0x |
| 6-cooley-saas-agreement | 345KB | 1s | 4s | 15s | 3.8x |
| 7-nasa-spinoff-2024 | 21037KB | 2s | 3s | 60s | 20.0x |

## Structure Preservation (t1 vs t2)

| PDF | t1 headings | t2 headings | t1 tables | t2 tables | t1 lists | t2 lists |
|-----|-------------|-------------|-----------|-----------|----------|----------|
| 1-academic-twocolumn | 0 | 14 | 0 | 0 | 0 | 63 |
| 2-apple-annual-report | 0 | 312 | 0 | 645 | 7 | 188 |
| 3-rpi5-product-brief | 0 | 8 | 0 | 0 | 0 | 25 |
| 4-stripe-payment-methods-guide | 0 | 185 | 0 | 98 | 0 | 4 |
| 5-neurips2024-slides | 1 | 20 | 0 | 0 | 0 | 15 |
| 6-cooley-saas-agreement | 0 | 16 | 0 | 0 | 0 | 104 |
| 7-nasa-spinoff-2024 | 0 | 26 | 0 | 41 | 0 | 3 |

## Noise & t2 Media Stripping

| PDF | raw artifact lines | t1 artifact lines | t2 artifact lines | t2 media placeholders | t2 data URIs remaining |
|-----|-------------------|-------------------|-------------------|-----------------------|------------------------|
| 1-academic-twocolumn | 0 | 0 | 0 | 0 | 0 |
| 2-apple-annual-report | 0 | 0 | 0 | 4 | 0 |
| 3-rpi5-product-brief | 0 | 0 | 0 | 5 | 0 |
| 4-stripe-payment-methods-guide | 0 | 0 | 0 | 27 | 0 |
| 5-neurips2024-slides | 0 | 0 | 0 | 20 | 0 |
| 6-cooley-saas-agreement | 0 | 0 | 0 | 22 | 0 |
| 7-nasa-spinoff-2024 | 0 | 0 | 0 | 45 | 0 |
