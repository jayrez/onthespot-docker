FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN git clone https://github.com/justin025/onthespot.git .
RUN pip install --no-cache-dir -r requirements.txt

# Updated to 8083
EXPOSE 8083

# Force the Python script to use 8083
CMD ["python3", "onthespot.py", "--web", "--host", "0.0.0.0", "--port", "8083"]