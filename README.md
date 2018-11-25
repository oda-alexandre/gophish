# GOPHISH

![gophish](https://raw.githubusercontent.com/oda-alexandre/gophish/master/img/logo-gophish.png) ![docker](https://raw.githubusercontent.com/oda-alexandre/gophish/master/img/logo-docker.png)


## INDEX

- [Build Docker](#BUILD)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [Configuration](#CONFIGURATION)
- [License](#LICENSE)


## BUILD DOCKER

[![gophish docker build](https://img.shields.io/docker/build/alexandreoda/gophish.svg)](https://hub.docker.com/r/alexandreoda/gophish)


## INTRODUCTION

Ce repository contient le fichier Dockerfile de [Gophish](https://gophish.io/) pour [Docker](https://www.docker.com), mis à jour automatiquement dans le [Docker Hub](https://hub.docker.com/r/alexandreoda/gophish/) public.


## PREREQUIS

Installer [Docker](https://www.docker.com)


## INSTALLATION

```
docker run -d --name gophish -p 127.0.0.1:3333:3333 -p 80:80 alexandreoda/gophish
```

lien vers Gophish https://127.0.0.1:3333/login

ID        = admin

PASSWORD  = gophish


## CONFIGURATION

Pour creer une clef ssh pour la connexion TLS

```
sudo openssl req -newkey rsa:2048 -nodes -keyout gophish.key -x509 -days 365 -out gophish.crt
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/gophish/blob/master/LICENSE)
