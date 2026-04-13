FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    git \
    wget \
    pv \
    jq \
    ffmpeg \
    mediainfo \
    neofetch \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /bot && chmod 777 /bot
WORKDIR /bot

COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["bash", "run.sh"]
