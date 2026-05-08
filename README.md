## 🧬 PlaceEmotion-GAN

*A reproducible implementation of a GAN-based model for emotional dynamics in cultural evolution*

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.17401003.svg)](https://doi.org/10.5281/zenodo.17401003)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![HuggingFace Space](https://img.shields.io/badge/Demo-HuggingFace-blue)](https://huggingface.co/spaces/ayaka68/placeemotion-gan)

---

### 🔍 Overview

**PlaceEmotion-GAN** is a reproducible research codebase for modeling the *co-evolution of emotional dynamics and spatial environments*.
Developed as part of the **WCTP 2025** project, this repository provides a full implementation of the GAN-based cultural evolution framework introduced in Onohara (2025).

The model simulates how affective states — *joy, fear, trust, and expectation* — emerge and stabilize through interactions between emotional agents and environmental cues (“places”).

---

### 🎯 Key Features

| Feature                      | Description                                                                                |
| ---------------------------- | ------------------------------------------------------------------------------------------ |
| **λ-scheduling control**     | Adjustable temporal weighting of cultural stabilization (`linear`, `logistic`, `delayed`). |
| **Sensitivity analysis**     | Built-in pipeline to test robustness across λ-shape conditions.                            |
| **Reproducibility**          | Fixed seeds, deterministic PyTorch backend, and Docker environment.                        |
| **Visualization**            | Emotion distributions, λ curves, latent-space projections.                                 |
| **Geospatial compatibility** | Optional GeoPandas layer for mapping emotion-place associations.                           |

---

### 🧩 Repository Structure

```
PlaceEmotionGAN/
├── lambda_scheduler.py # λ scheduling (linear / logistic / delayed)
├── losses.py # Loss formulation (1−λ)adv − λβ*reward
├── train.py # Main training simulation loop
├── sensitivity.py # Sensitivity analysis (linear/logistic/delayed)
├── requirements.txt
├── Dockerfile
├── paper.md
└── paper.bib
```

---

### 🚀 Installation

```bash
git clone https://github.com/aonoa68/aonoa68-PlaceEmotionGAN.git
cd aonoa68-PlaceEmotionGAN
pip install -r requirements.txt
```

Or use Docker:

```bash
docker build -t placeemotion-gan .
docker run -it placeemotion-gan bash
```

---

### 🧠 Usage Examples

#### 1️⃣ Basic training

```bash
python train.py --lambda-kind linear
```

#### 2️⃣ Sensitivity analysis (3 λ-shapes)

```bash
python sensitivity.py --total-steps 400 --reach-portion 0.30
```

#### 3️⃣ Logistic λ re-training

```bash
python train.py --lambda-kind logistic --lambda-sharpness 12.0
```

Outputs (CSV, PNG) are saved in `results/lambda_logs/`.

---

### 📊 Example Results

| λ-shape  | Cultural stability | Emotional variance (↓ better) | Notes                 |
| -------- | ------------------ | ----------------------------- | --------------------- |
| Linear   | Moderate           | 0.31                          | smooth convergence    |
| Logistic | High               | **0.25**                      | fastest stabilization |
| Delayed  | Low                | 0.48                          | long unstable phase   |

---

### 🧬 Conceptual Diagram

```
Environment (Place) ─┬─> Generator (G)──┐
Emotion vector ──────┘                 │→ Discriminator (D) ─→ λ(t)
                                       ↑
                         λ-scheduling (cultural stabilization process)
```

---

### 🧪 Reproducibility Notes

* Fixed seeds: `torch.manual_seed(42); np.random.seed(42)`
* Common initial checkpoint across λ conditions
* Evaluation metrics: KL-divergence, Jensen–Shannon distance, spatial emotion entropy
* Notebook `analysis.ipynb` reproduces all figures used in the JOSS paper

---

### 📘 Reference

Onohara, A. (2025). *Modeling Emotional Dynamics in Cultural Evolution: A GAN-based Approach.*
Proceedings of the Workshop on Computation: Theory and Practice (WCTP 2025).

---

### 🤝 Citation

If you use this code, please cite:

```bibtex
@article{Onohara2025PlaceEmotionGAN,
  author  = {Ayaka Onohara},
  title   = {PlaceEmotion-GAN: A reproducible implementation of a GAN-based model for emotional dynamics in cultural evolution},
  journal = {Journal of Open Source Software},
  year    = {2025},
  doi     = {10.5281/zenodo.17401002}
}
```

---

### 💬 Acknowledgements

This project was supported by JSPS KAKENHI (Grant-in-Aid for Early-Career Scientists)
and developed within the WCTP2025 “Cultural Evolution and Niche Construction” framework.

---

### 🪴 License

This repository is released under the [MIT License](LICENSE).

---

### 🌐 Related Resources

* Demo: [Hugging Face Space](https://huggingface.co/spaces/ayaka68/placeemotion-gan)
* Project overview: [https://aonoa68.github.io/aonoa68-PlaceEmotionGAN/](https://aonoa68.github.io/aonoa68-PlaceEmotionGAN/)
* Paper: [WCTP2025 Proceedings (Atlantis Press)](http://www.lambda.cs.titech.ac.jp/wctp/wctp2025/)

---
