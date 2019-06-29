# IMAGE TO USE
FROM debian:stretch-slim

# MAINTAINER
MAINTAINER https://www.oda-alexandre.com/

# VARIABLES
ENV USER gophish
ENV VERSION v0.5.0
ENV PORTS 3333 80
ENV DEBIAN_FRONTEND noninteractive

# INSTALL PACKAGES
RUN apt-get update && apt-get install --no-install-recommends -y \
ca-certificates \
wget \
unzip \
sudo

# SELECT WORKING SPACE
WORKDIR /opt/gophish

# INSTALL APP
RUN wget https://github.com/gophish/gophish/releases/download/${VERSION}/gophish-${VERSION}-linux-64bit.zip && \
unzip gophish-${VERSION}-linux-64bit.zip && \
rm -f gophish-${VERSION}-linux-64bit.zip && \
sed -i 's|127.0.0.1|0.0.0.0|g' config.json && \
chmod +x gophish && \

# ADD USER
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

# SELECT USER
USER ${USER}

# CLEANING
RUN sudo apt-get --purge autoremove -y \
wget \
unzip && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

# OPENING PORTS
EXPOSE ${PORTS}

# START THE CONTAINER
ENTRYPOINT sudo ./gophish \
