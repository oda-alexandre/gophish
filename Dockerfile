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

RUN sed -i "s|127.0.0.1|0.0.0.0|g" config.json && \
chmod +x gophish

RUN apt-get --purge autoremove -y \
wget \
unzip

RUN useradd -d /home/gophish -m gophish && \
passwd -d gophish && \
adduser gophish sudo

USER gophish

EXPOSE 3333 80

ENTRYPOINT sudo ./gophish
