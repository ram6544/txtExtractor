FROM python:3.9.7-slim-buster

WORKDIR /app
COPY . .

RUN apt-get update && apt-get install -y \
    gcc \
    libffi-dev \
    ffmpeg \
    aria2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "main.py"]
