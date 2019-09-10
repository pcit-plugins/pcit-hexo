FROM node:alpine

LABEL maintainer="khs1994@khs1994.com"

ENV TZ=Asia/Shanghai

ENV GIT_USERNAME \
    GIT_USEREMAIL

WORKDIR /srv/hexo

COPY package.json package.json

RUN apk add --no-cache \
         tzdata \
         git \
         openssh-client \
         openssl \
      && npm install \
      && mkdir -p ~/.ssh \
      && echo -e "StrictHostKeyChecking no\nUserKnownHostsFile /dev/null" > ~/.ssh/config \
      && tar -zcvf node_modules.tar.gz node_modules > /dev/null 2>&1 \
      && rm -rf node_modules /root/.npm /tmp/*

VOLUME /srv/hexo-src

EXPOSE 4000

WORKDIR /srv/hexo-src

COPY docker-entrypoint.sh /usr/local/bin

ENTRYPOINT ["docker-entrypoint.sh"]

CMD build
