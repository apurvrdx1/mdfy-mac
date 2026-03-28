NeurIPS 2024 LLM-Merging

A Model Merging Method

## NeurIPS 2024 LLM-Merging

## A Model Merging Method

abc team

Hao Mo

Jisheng Fang

Qiang Gao asdfqwer2015@163.com sunshineinautumn@163.com gq15035177217@gmail.com

asdfqwer2015@163.com

[Embedded media omitted from source PDF]

Jisheng Fang asdfqwer2015@163.com

[Embedded media omitted from source PDF]

Hao Mo sunshineinautumn@163.com

[Embedded media omitted from source PDF]

Qiang Gao gq15035177217@gmail.com

[Embedded media omitted from source PDF]

NEURAL INFORMATION

PROCESSING SYSTEMS

[Embedded media omitted from source PDF]

01 Introduction

02 Model Selection

03 Model Merging

04 Conclusions and Outlook

05 Q&amp;A

[Embedded media omitted from source PDF]

Competition Goal

## Competition Goal

Training high-performing large language models (LLMs) from scratch is a notoriously expensive and difficult task, costing hundreds of millions of dollars in compute alone. These pretrained LLMs, however, can cheaply and easily be adapted to new tasks via fine-tuning, leading to a proliferation of models that suit specific use cases. Recent work has shown that specialized fine-tuned models can be rapidly merged to combine capabilities and generalize to new skills.

[Embedded media omitted from source PDF]

Current Methods

## Current Methods

· Model Stacking

- Parameter Averaging
- Model Stacking
- Model Routing
- MoE-based merging
- Model Zipping

[Embedded media omitted from source PDF]

Base Model Selection

## Base Model Selection

· broad knowledge

· skilled at summarizing

- meta-llama/Meta-Llama-3-8B-Instruct
- broad knowledge
- skilled at summarizing
- ecologically rich
- microsoft/Phi-3-small-8k-instruct
- small and fast
- skilled at reasoning

[Embedded media omitted from source PDF]

Base Model Selection

· Task types by knowledge area

## Base Model Selection

usage and accuracy by Im-evaluation-harness and

- Task types by knowledge area
- assessing each fine-tuned model's GPU memory usage and accuracy by lm-evaluation-harness and custom datasets

[Embedded media omitted from source PDF]

Model Merging

[Embedded media omitted from source PDF]

## Weights Merging

Lower VRAM requirements to support a greater number of models

## Router

Determine model selection based on sample analysis

## Staged Response

Harness the distinct advantages of multiple base models

Weights Merging

1. Compresses weights for layers (excluding the Im\_head and embedding layers)

## Weights Merging

3. Connects parameter averaging and model routing

1. Compresses weights for layers (excluding the lm\_head and embedding layers)
2. Applies RSVD
3. Connects parameter averaging and model routing

[Embedded media omitted from source PDF]

Weights Merging

Algorithm: Weight compression for a layer in models

Input:

## Weights Merging

Output:

Wavg

W; =

2. Wav

Algorithm: Weight compression for a layer in models Input:

<!-- formula-not-decoded -->

Output:

<!-- formula-not-decoded -->

W௔௩௚

𝑐𝑜𝑚𝑝𝑟𝑒𝑠𝑠𝑒𝑑\_𝑑𝑖𝑓𝑓 = {𝑈 ଵ , 𝑈 ଶ , … , 𝑈 ே , 𝑉 ଵ , 𝑉 ଶ , … , 𝑉 ே}

1. For each weight matrix 𝑊௜   ∈  𝑊 :

<!-- formula-not-decoded -->

<!-- formula-not-decoded -->

- # Normalize weight matrix 𝑊௜ .
2. 𝑊௔௩ = ଵ ே ∑ 𝑊 ෡ ௜
3. For each normalized weight matrix 𝑊 ෡ ௜ :

<!-- formula-not-decoded -->

4. Return 𝑠𝑐𝑎𝑙𝑒𝑠, 𝑤 ௔௩௚ , 𝑐𝑜𝑚𝑝𝑟𝑒𝑠𝑠𝑒𝑑\_𝑑𝑖𝑓𝑓

Algorithm: Inference for Compressed Model Layer

Input:

x

bias # Uncompressed bias scales = {scale,, scalez, ..., scalen}

Waug

Algorithm: Inference for Compressed Model Layer Input:

Output:

𝑥

𝑏𝑖𝑎𝑠

# Uncompressed bias

𝑠𝑐𝑎𝑙𝑒𝑠  = {𝑠𝑐𝑎𝑙𝑒 ଵ , 𝑠𝑐𝑎𝑙𝑒 ଶ , … , 𝑠𝑐𝑎𝑙𝑒ே}

W௔௩௚

<!-- formula-not-decoded -->

Output:

<!-- formula-not-decoded -->

1. 𝑦௜ =  𝑙𝑖𝑛𝑒𝑎𝑟(𝑥, 𝑤 ௔௩௚ ) +  𝑙𝑖𝑛𝑒𝑎𝑟(𝑙𝑖𝑛𝑒𝑎𝑟(𝑥, 𝑉 ௜ ), 𝑈 ௜ ) ∗  𝑠𝑐𝑎𝑙𝑒 ௜

2. If bias is not null:

<!-- formula-not-decoded -->

3. Return y  # Return the final output.

[Embedded media omitted from source PDF]

Weights Merging

1. 95% compression rate

## Weights Merging

1. 95% compression rate
2. Phi3-Small and three fully fine-tuned Llama3 8B models

[Embedded media omitted from source PDF]

Router

1. Embedding based

## Router

3. Alignment

1. Embedding based
2. LLM instead of PLM
3. Alignment

[Embedded media omitted from source PDF]

Router

Alignment

## Router

Let's think about what task these questions belong to. These questions belong to the

Alignment '''{input} Let's think about what task these questions belong to. These questions belong to the field of'''

[Embedded media omitted from source PDF]

Staged Response

Accuracy and Clarity

## Staged Response

Thinker: Phi3-small, guided COT

Accuracy and Clarity

2-agents, model stacking

Thinker: Phi3-small, guided COT

Formatter: llama3 8B

[Embedded media omitted from source PDF]

Conclusions and Outlook

We ultimately achieved first place with a score of 0.46

## Conclusions and Outlook

Overview

Datal

Code Models

Discussion

Leaderboard

Rules

Team

Submissions

## We ultimately achieved first place with a score of 0.46

#

1

2

3

score of 0.50

[Embedded media omitted from source PDF]

The Method with second version of Staged Response gets a higher score of 0.50

Late Submission

...

[Embedded media omitted from source PDF]

NEURAL INFORMATION

PROCESSING SYSTEMS

Jisheng Fang asdfqwer2015@163.com

Hao Mo sunshineinautumn@163.com

## Q&amp;A

If you have any questions, please feel free to email us.

Jisheng Fang asdfqwer2015@163.com Hao Mo sunshineinautumn@163.com Qiang Gao gq15035177217@gmail.com

[Embedded media omitted from source PDF]
