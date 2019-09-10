# Hexo Docker

[![GitHub stars](https://img.shields.io/github/stars/khs1994-docker/hexo.svg?style=social&label=Stars)](https://github.com/khs1994-docker/hexo) [![Docker Stars](https://img.shields.io/docker/stars/khs1994/hexo.svg)](https://hub.docker.com/r/khs1994/hexo) [![Docker Pulls](https://img.shields.io/docker/pulls/khs1994/hexo.svg)](https://hub.docker.com/r/khs1994/hexo)

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
     -e GIT_USERNAME=username \
     -e GIT_USEREMAIL=username@domain.com \
     khs1994/hexo \
     deploy
```

## [GitHub Actions](https://help.github.com/en/categories/automating-your-workflow-with-github-actions)

```yaml
- name: SSH settings
  uses: Homebrew/actions/git-ssh@master
  with:
    git_user: username
    git_email: username@example.org
    key_name: key_rsa
    key: ${{ secrets.SSH_KEY }}
- name: Hexo Build
  uses: docker://khs1994/hexo
- name: Hexo Deploy
  if: github.event_name == 'push'
  run: |
    docker run -it --rm \
       -v $PWD:/srv/hexo-src \
       -v ~/.ssh:/root/.ssh \
       -e GIT_USERNAME=username \
       -e GIT_USEREMAIL=username@domain.com \
       khs1994/hexo \
       deploy
```

# Who use this image ?

* [KhsCI](https://github.com/khs1994-php/khsci/blob/master/yml_examples/hexo.yml)
