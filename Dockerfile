FROM debian:stretch-slim

LABEL authors https://www.oda-alexandre.com/

ENV USER gophish
ENV VERSION v0.5.0
ENV DEBIAN_FRONTEND noninteractive

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m' && \
apt update && apt install --no-install-recommends -y \
ca-certificates \
wget \
unzip \
sudo

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR /opt/gophish

RUN echo -e '\033[36;1m ******* INSTALL APP ******** \033[0m' && \
wget https://github.com/gophish/gophish/releases/download/${VERSION}/gophish-${VERSION}-linux-64bit.zip && \
unzip gophish-${VERSION}-linux-64bit.zip && \
rm -f gophish-${VERSION}-linux-64bit.zip && \
sed -i 's|127.0.0.1|0.0.0.0|g' config.json && \
chmod +x gophish

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m' && \
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* CLEANING ******** \033[0m' && \
sudo apt-get --purge autoremove -y \
wget \
unzip && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* OPENING PORTS ******** \033[0m'
EXPOSE 3333 80

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
ENTRYPOINT sudo ./gophish \