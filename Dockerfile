FROM python:3.11-slim

ARG ONTHESPOT_REPO=https://github.com/jayrez/onthespot-dockerized.git
ARG ONTHESPOT_BRANCH=search-filter-fix

ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    git \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN git clone --depth 1 --branch "${ONTHESPOT_BRANCH}" "${ONTHESPOT_REPO}" .

RUN pip install --upgrade pip \
    && pip install .

# Create these at root level to match the volume mapping
RUN mkdir /config /downloads

# The app uses 5000 by default
EXPOSE 5000

# Force it to listen on 0.0.0.0 so we can access it from outside
CMD ["python3", "-m", "onthespot.web", "--host", "0.0.0.0"]
