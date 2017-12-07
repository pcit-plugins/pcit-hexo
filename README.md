# Hexo Docker

[![GitHub stars](https://img.shields.io/github/stars/khs1994-docker/hexo.svg?style=social&label=Stars)](https://github.com/khs1994-docker/hexo) [![Docker Stars](https://img.shields.io/docker/stars/khs1994/hexo.svg)](https://store.docker.com/community/images/khs1994/hexo/) [![Docker Pulls](https://img.shields.io/docker/pulls/khs1994/hexo.svg)](https://store.docker.com/community/images/khs1994/hexo/)

# Supported tags and respective `Dockerfile` links

* [`latest` (*alpine/Dockerfile*)](https://github.com/khs1994-docker/hexo/tree/master/alpine/Dockerfile)

# Usage

进入 hexo 源文件夹

## Build

```bash
$ docker run -it --rm \
     -v $PWD:/srv/hexo-src \
     khs1994/hexo
```

## Server

```bash
$ docker run -it --rm \
     -v $PWD:/srv/hexo-src \
     khs1994/hexo \
     server
```

## Deploy

```bash
$ docker run -it --rm \
     -v $PWD:/srv/hexo-src \
     -v ~/.ssh:/root/.ssh \
     -v ~/.gitconfig:/root/.gitconfig \
     khs1994/hexo \
     deploy
```
