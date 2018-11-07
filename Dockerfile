FROM debian:buster-slim

MAINTAINER https://oda-alexandre.github.io

RUN apt-get update
RUN apt-get install --no-install-recommends -y ca-certificates wget unzip sudo

WORKDIR /opt/gophish

RUN wget https://github.com/gophish/gophish/releases/download/v0.5.0/gophish-v0.5.0-linux-64bit.zip
RUN unzip gophish-v0.5.0-linux-64bit.zip
RUN rm -f gophish-v0.5.0-linux-64bit.zip

RUN sed -i "s|127.0.0.1|0.0.0.0|g" config.json
RUN chmod +x gophish

RUN apt-get --purge autoremove -y wget unzip

RUN useradd -d /home/gophish -m gophish
RUN passwd -d gophish
RUN adduser gophish sudo

USER gophish

EXPOSE 3333 80

ENTRYPOINT sudo ./gophish
