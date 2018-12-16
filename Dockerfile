FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

RUN apt-get update && apt-get install --no-install-recommends -y \
ca-certificates \
wget \
unzip \
sudo

WORKDIR /opt/gophish

RUN wget https://github.com/gophish/gophish/releases/download/v0.5.0/gophish-v0.5.0-linux-64bit.zip && \
unzip gophish-v0.5.0-linux-64bit.zip && \
rm -f gophish-v0.5.0-linux-64bit.zip

RUN sed -i 's|127.0.0.1|0.0.0.0|g' config.json && \
chmod +x gophish

RUN useradd -d /home/gophish -m gophish && \
passwd -d gophish && \
adduser gophish sudo

USER gophish

RUN sudo apt-get --purge autoremove -y \
wget \
unzip && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

EXPOSE 3333 80

ENTRYPOINT sudo ./gophish
