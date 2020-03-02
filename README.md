# GOPHISH

![logo](https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904449/0_G63TdmdAOJr5zdWM.png)

## INDEX

- [GOPHISH](#gophish)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
  - [LICENSE](#license)

## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/gophish/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/gophish/commits/master)

## INTRODUCTION

Docker image of :

- [gophish](https://gophish.io/)

Continuous integration on :

- [gitlab](https://gitlab.com/oda-alexandre/gophish/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/gophish/).

## PREREQUISITES

Use [docker](https://www.docker.com)

## INSTALL

```docker run -d --rm --name gophish -p 127.0.0.1:3333:3333 -p 80:80 alexandreoda/gophish```

link to Gophish <https://127.0.0.1:3333/login>

ID        = admin

PASSWORD  = gophish

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/gophish/blob/master/LICENSE)
