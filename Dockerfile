# ===== PlaceEmotion-GAN (simulation version) Dockerfile =====
# Purpose: Provide a fully reproducible environment for JOSS reviewers
# Base: Python 3.11 slim CPU image (~150MB total size)

FROM python:3.11-slim

# --- System setup (UTF-8, timezone, locale) ---
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TZ=Asia/Tokyo \
    PYTHONUNBUFFERED=1

WORKDIR /app

# --- Install system dependencies for matplotlib (fonts, PNG backends) ---
RUN apt-get update && apt-get install -y --no-install-recommends \
        libfreetype6 libpng16-16 libxrender1 libxext6 libxft2 fonts-dejavu-core \
    && rm -rf /var/lib/apt/lists/*

# --- Copy project files ---
COPY . /app

# --- Install Python requirements ---
RUN pip install --no-cache-dir -r requirements.txt

# --- Default command: run sensitivity analysis ---
CMD ["python", "sensitivity.py"]
