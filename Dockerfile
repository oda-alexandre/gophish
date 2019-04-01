FROM debian:stretch-slim

MAINTAINER http://www.oda-alexandre.com/

# VARIABLES
ENV USER gophish
ENV VERSION v0.5.0
ENV PORTS 3333 80
ENV DEBIAN_FRONTEND noninteractive

# INSTALLATION DES PREREQUIS
RUN apt-get update && apt-get install --no-install-recommends -y \
ca-certificates \
wget \
unzip \
sudo

# SELECTION DE L'ESPACE DE TRAVAIL
WORKDIR /opt/gophish

# INSTALLATION DE L'APPLICATION
RUN wget https://github.com/gophish/gophish/releases/download/${VERSION}/gophish-${VERSION}-linux-64bit.zip && \
unzip gophish-${VERSION}-linux-64bit.zip && \
rm -f gophish-${VERSION}-linux-64bit.zip && \
sed -i 's|127.0.0.1|0.0.0.0|g' config.json && \
chmod +x gophish && \

# AJOUT UTILISATEUR
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

# SELECTION UTILISATEUR
USER ${USER}

# NETTOYAGE
RUN sudo apt-get --purge autoremove -y \
wget \
unzip && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

# OUVERTURE DE PORTS
EXPOSE ${PORTS}

# COMMANDE AU DEMARRAGE DU CONTENEUR
ENTRYPOINT sudo ./gophish
