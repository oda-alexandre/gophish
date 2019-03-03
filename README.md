# GOPHISH

[![dockeri.co](https://dockeri.co/image/alexandreoda/gophish)](https://hub.docker.com/r/alexandreoda/gophish)


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [Configuration](#CONFIGURATION)
- [License](#LICENSE)


## BADGES

[![version](https://images.microbadger.com/badges/version/alexandreoda/gophish.svg)](https://microbadger.com/images/alexandreoda/gophish)
[![size](https://images.microbadger.com/badges/image/alexandreoda/gophish.svg)](https://microbadger.com/images/alexandreoda/gophish")
[![build](https://img.shields.io/docker/build/alexandreoda/gophish.svg)](https://hub.docker.com/r/alexandreoda/gophish)
[![automated](https://img.shields.io/docker/automated/alexandreoda/gophish.svg)](https://hub.docker.com/r/alexandreoda/gophish)


## INTRODUCTION

Ce repository contient le fichier Dockerfile de

- [gophish](https://gophish.io/)

Mis à jour automatiquement dans le [docker hub public](https://hub.docker.com/r/alexandreoda/gophish/).


## PREREQUIS

Installer [docker](https://www.docker.com)


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
