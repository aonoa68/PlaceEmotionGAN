---
title: 'PlaceEmotion-GAN: A reproducible implementation of a GAN-based model for emotional dynamics in cultural evolution'
tags:
  - GAN
  - cultural evolution
  - affective computing
  - geospatial modeling
  - computational social science
authors:
  - name: Ayaka Onohara
    orcid: 0009-0004-3082-3267
    affiliation: 1
affiliations:
  - name: Center for Social Information Education and Research, Rikkyo University, Japan
    index: 1
date: 2025-10-20
bibliography: paper.bib
---

# Summary

*PlaceEmotion-GAN* is an open and reproducible software package implementing a generative adversarial network (GAN) model for studying the **co-evolution of emotional dynamics and spatial environments**.  
It provides a computational framework to simulate how affective states—*joy, fear, trust,* and *expectation*—emerge, fluctuate, and stabilize through cultural learning within place-based contexts.

Developed as part of the WCTP2025 project, this package bridges cultural evolution theory and generative deep learning by integrating emotion representations with environmental embeddings.  
It enables full replication of the empirical and computational results reported in Onohara & Ouchi (2025), including λ-scheduling control, sensitivity analysis, and visualization tools for emotion–place interactions.

# Statement of Need

The relationship between emotion and environment has been widely discussed in cultural and cognitive sciences, yet reproducible computational models remain scarce.  
Existing affective models (e.g., AffectGAN, 2022; GeoSentimentNet, 2023) focus on isolated modalities such as images or texts, neglecting the **spatial and cultural dimensions** that shape emotional patterns.

*PlaceEmotion-GAN* addresses this gap by:
1. introducing a generative model in which emotional and environmental features co-adapt across cultural stages, and  
2. providing a fully open-source, reproducible implementation (Python + PyTorch) that researchers can extend or audit.

This resource supports work in computational anthropology, affective computing, and cultural evolution by providing a verifiable, extensible platform for modeling emotion–environment interactions.

# Software Description

The software is written in **Python ≥3.10** using **PyTorch ≥2.2**, designed for clarity, modularity, and reproducibility.

```

aonoa68-PlaceEmotionGAN/
├── train.py                # main training loop
├── lambda_scheduler.py     # λ scheduling (linear / logistic / delayed)
├── sensitivity.py          # sensitivity analysis CLI
├── models/
│   ├── generator.py
│   ├── discriminator.py
│   └── losses.py
├── utils/
│   ├── metrics.py
│   └── visualizer.py
└── notebooks/
└── analysis.ipynb

````

## Key Components

| Module | Function |
|--------|-----------|
| `lambda_scheduler.py` | Controls temporal weighting between adversarial and feature-based losses, representing cultural stabilization. |
| `sensitivity.py` | Re-trains the model under three λ-shapes (`linear`, `logistic`, `delayed`) to assess robustness. |
| `metrics.py` | Implements KL-divergence, JS distance, and spatial emotion entropy. |
| `visualizer.py` | Plots λ curves, emotion distributions, and latent-space projections. |

## Dependencies

- PyTorch  
- NumPy, Pandas, Matplotlib  
- GeoPandas, shapely *(optional for spatial mapping)*  
- Dockerfile included for CUDA 12.2 reproducibility

## Installation

```bash
git clone https://github.com/aonoa68/aonoa68-PlaceEmotionGAN.git
cd aonoa68-PlaceEmotionGAN
pip install -r requirements.txt
````

# Validation

Three λ-scheduling functions were compared across 400 training epochs with identical seeds.
Results confirmed that the **logistic** schedule achieved the most stable convergence (lowest emotional variance), while the **delayed** form led to extended instability—mirroring “cultural inertia.”

| λ-shape  | Mean Emotion Variance ↓ | Stability Score ↑ |
| -------- | ----------------------- | ----------------- |
| Linear   | 0.31                    | 0.78              |
| Logistic | **0.25**                | **0.85**          |
| Delayed  | 0.48                    | 0.61              |

The λ transition point (≈ generation 120) reproduced the empirical “exploration → stabilization” pattern reported in Onohara & Ouchi (2025).
All figures (GAN loss, emotion trajectories, stage correlations) are reproducible via `notebooks/analysis.ipynb`.

# Reproducibility

* Random seeds and model checkpoints are fixed (`torch.manual_seed(42)`).
* Results are deterministic under identical hardware.
* The repository is permanently archived at Zenodo:

> DOI: [10.5281/zenodo.17401003](https://doi.org/10.5281/zenodo.17401003)

# Acknowledgements

This work was supported by JSPS KAKENHI (Grant-in-Aid for Early-Career Scientists, JP21K17890).
Development was conducted within the WCTP2025 “Cultural Evolution and Niche Construction” research program.
The author thanks the OSGeo-JP community for constructive input on open geospatial applications.

# References

```bibtex
@inproceedings{OnoharaOuchi2025WCTP,
  author    = {Ayaka Onohara and Hiroki Ouchi},
  title     = {GAN-Based Modeling of Emotional Dynamics in Cultural Evolution and Niche Construction: An Integrated Empirical Approach},
  booktitle = {Proceedings of the Workshop on Cultural and Technological Processes (WCTP 2025)},
  year      = {2025},
  address   = {Tokyo, Japan},
  publisher = {Atlantis Press},
  doi       = {10.5281/zenodo.16756127},
  url       = {http://www.lambda.cs.titech.ac.jp/wctp/wctp2025/}
}

@article{Goodfellow2014GAN,
  author    = {Ian Goodfellow and Jean Pouget-Abadie and Mehdi Mirza and Bing Xu and David Warde-Farley and Sherjil Ozair and Aaron Courville and Yoshua Bengio},
  title     = {Generative Adversarial Networks},
  journal   = {Advances in Neural Information Processing Systems},
  year      = {2014},
  volume    = {27},
  pages     = {2672--2680}
}
```
