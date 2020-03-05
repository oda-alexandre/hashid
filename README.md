# HASHID

## INDEX

- [HASHID](#hashid)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
    - [DOCKER RUN](#docker-run)
    - [DOCKER COMPOSE](#docker-compose)
  - [LICENSE](#license)

## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/hashid/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/hashid/commits/master)

## INTRODUCTION

Docker image of :

- [hashid](https://tools.kali.org/password-attacks/hash-identifier)

Continuous integration on :

- [gitlab pipelines](https://gitlab.com/oda-alexandre/hashid/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/hashid)

## PREREQUISITES

Use [docker](https://www.docker.com)

## INSTALL

### DOCKER RUN

```\
docker run -ti --rm \
--name hashid \
-v ${HOME}:/home/hashid \
alexandreoda/hashid
```

### DOCKER COMPOSE

```yml
version: "3.7"

services:
  hashid:
    container_name: hashid
    image: alexandreoda/hashid
    restart: no
    network_mode: none
    privileged: false
    volumes:
      - "${HOME}:/home/hashid"
```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/hashid/blob/master/LICENSE)
