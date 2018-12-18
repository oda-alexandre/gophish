FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

# INSTALLATION DES PREREQUIS
RUN apt-get update && apt-get install --no-install-recommends -y \
ca-certificates \
wget \
unzip \
sudo

# SELECTION DE L'ESPACE DE TRAVAIL
WORKDIR /opt/gophish

# INSTALLATION DE L'APPLICATION
RUN wget https://github.com/gophish/gophish/releases/download/v0.5.0/gophish-v0.5.0-linux-64bit.zip && \
unzip gophish-v0.5.0-linux-64bit.zip && \
rm -f gophish-v0.5.0-linux-64bit.zip && \
sed -i 's|127.0.0.1|0.0.0.0|g' config.json && \
chmod +x gophish

# AJOUT UTILISATEUR
RUN useradd -d /home/gophish -m gophish && \
passwd -d gophish && \
adduser gophish sudo

# SELECTION UTILISATEUR
USER gophish

# NETTOYAGE
RUN sudo apt-get --purge autoremove -y \
wget \
unzip && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

# EXPOSITION PORT
EXPOSE 3333 80

# COMMANDE AU DEMARRAGE DU CONTENEUR
ENTRYPOINT sudo ./gophish
