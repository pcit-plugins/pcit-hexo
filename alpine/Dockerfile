FROM node:9-alpine

ENV TZ=Asia/Shanghai

COPY docker-entrypoint.sh /usr/local/bin

WORKDIR /srv/hexo

COPY package.json package.json

RUN apk add --no-cache \
         tzdata \
         git \
         openssh \
         openssl \
      && npm install \
      && mkdir -p ~/.ssh \
      && echo -e "StrictHostKeyChecking no\nUserKnownHostsFile /dev/null" > ~/.ssh/config \
      && tar -zcvf node_modules.tar.gz node_modules > /dev/null 2>&1 \
      && rm -rf node_modules /root/.npm /tmp/*

VOLUME /srv/hexo-src

EXPOSE 4000

WORKDIR /srv/hexo-src

ENTRYPOINT ["docker-entrypoint.sh"]

CMD build
