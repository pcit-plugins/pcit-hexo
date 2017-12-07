# Hexo Docker

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
