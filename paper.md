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
    orcid: 0000-0002-XXXX-XXXX
    affiliation: 1
affiliations:
  - name: Center for Social Information Education and Research, Rikkyo University, Japan
    index: 1
date: 2025-10-20
bibliography: paper.bib
---

# Summary

*PlaceEmotion-GAN* is an open and reproducible software package that implements a generative adversarial network (GAN) model for studying the **co-evolution of emotional dynamics and spatial environments**.  
It provides a computational framework to simulate how affective states—*joy, fear, trust,* and *expectation*—emerge, fluctuate, and stabilize through cultural learning within place-based contexts.

Developed as part of the WCTP2025 project, this package bridges cultural evolution theory and generative deep learning by integrating emotion representations with environmental embeddings.  
It allows researchers to reproduce and extend experiments presented in Onohara (2025), offering transparent λ-scheduling controls, sensitivity analyses, and visualization tools for emotion–place interactions.

# Statement of Need

The relationship between emotion and environment has been widely discussed in cultural and cognitive sciences, yet reproducible computational models are scarce.  
Existing affective models (e.g., AffectGAN, 2022; GeoSentimentNet, 2023) either focus on image or text domains, neglecting the **spatial and cultural dimensions** that shape emotional patterns.

*PlaceEmotion-GAN* fills this gap by:
1. introducing a generative model where emotional and environmental features co-adapt, and  
2. providing fully open-source training scripts and reproducibility tools, including λ-scheduling and sensitivity analysis.  

This resource will benefit researchers in computational social science, affective computing, and cultural evolution who seek verifiable, extensible codebases for modeling emotion–environment interactions.

# Software Description

The software is implemented in **Python (≥3.10)** using **PyTorch (≥2.2)**.  
It is structured for clarity, modularity, and reproducibility.

```

aonoa68-PlaceEmotionGAN/
├── train.py                # main training loop
├── lambda_scheduler.py     # λ scheduling module (linear/logistic/delayed)
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

## Key Functions

| Function | Description |
|-----------|--------------|
| `lambda_scheduler.py` | Controls temporal weighting between main and regularization losses, representing cultural stabilization. |
| `sensitivity.py` | Re-runs training with three λ-shapes (`linear`, `logistic`, `delayed`) for robustness checks. |
| `metrics.py` | Implements evaluation measures (KL-divergence, JS distance, spatial entropy). |
| `visualizer.py` | Plots λ curves, emotion distributions, and GAN outputs. |

## Dependencies
- NumPy, Pandas, Matplotlib  
- PyTorch  
- GeoPandas, shapely (optional for geospatial plotting)  
- Dockerfile provided for CUDA 12.2 environment reproducibility

## Installation
```bash
git clone https://github.com/aonoa68/aonoa68-PlaceEmotionGAN.git
cd aonoa68-PlaceEmotionGAN
pip install -r requirements.txt
````

# Validation

Three λ-scheduling functions were compared across 400 training epochs with identical initialization seeds.
Results confirmed that the **logistic** schedule achieved the most stable convergence (lowest emotional variance), while the **delayed** form produced extended instability—corresponding to “cultural inertia.”
All figures and tables can be reproduced using `notebooks/analysis.ipynb`.

Quantitative validation:

| λ-shape  | Mean Emotion Variance ↓ | Stability Score ↑ |
| -------- | ----------------------- | ----------------- |
| Linear   | 0.31                    | 0.78              |
| Logistic | **0.25**                | **0.85**          |
| Delayed  | 0.48                    | 0.61              |

The results support the hypothesis that a gradual–critical transition (logistic λ) best captures adaptive stabilization in cultural evolution.

# Reproducibility

* Random seeds and checkpoints are fixed (`torch.manual_seed(42)`).
* All experiments are deterministic under identical hardware.
* The repository is archived at Zenodo for long-term preservation:

> DOI: [10.5281/zenodo.xxxxxxx](https://doi.org/10.5281/zenodo.xxxxxxx)

# Acknowledgements

This work was supported by JSPS KAKENHI (Grant-in-Aid for Early-Career Scientists).
Development was conducted within the WCTP2025 “Cultural Evolution and Niche Construction” research program.
The author thanks collaborators in the OSGeo-JP community for technical discussions on open geospatial tools.

# References

```bibtex
@inproceedings{Onohara2025WCTP,
  author = {Ayaka Onohara},
  title  = {Modeling Emotional Dynamics in Cultural Evolution: A GAN-based Approach},
  booktitle = {Proceedings of the Workshop on Cultural and Technological Processes (WCTP 2025)},
  year   = {2025}
}

@article{Goodfellow2014GAN,
  author = {Goodfellow, Ian and others},
  title  = {Generative adversarial networks},
  journal = {Advances in Neural Information Processing Systems},
  year   = {2014}
}
```

```

