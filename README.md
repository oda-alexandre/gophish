# GOPHISH

<img src="https://getgophish.com/blog/images/gophish_purple_logo.png" />


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [License](#LICENSE)


## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/gophish/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/gophish/commits/master)


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


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/gophish/blob/master/LICENSE)
