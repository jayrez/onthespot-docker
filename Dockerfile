FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN git clone https://github.com/justin025/onthespot.git .
RUN pip install --no-cache-dir .

# Create these at root level to match the volume mapping
RUN mkdir /config /downloads

# The app uses 5000 by default
EXPOSE 5000

# Force it to listen on 0.0.0.0 so we can access it from outside
CMD ["python3", "-m", "onthespot.web", "--host", "0.0.0.0"]