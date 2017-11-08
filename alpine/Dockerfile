FROM node:9-alpine

ENV TZ=Asia/Shanghai

COPY docker-entrypoint.sh /usr/local/bin

COPY .ssh /root/.ssh

WORKDIR /tmp/hexo

COPY package.json package.json

RUN apk add --no-cache \
         tzdata \
         git \
      && npm install \
      && tar -zcvf node_modules.tar.gz node_modules > /dev/null 2>&1 \
      && rm -rf package.json node_modules /root/.npm

VOLUME /tmp/hexo-src

EXPOSE 4000

WORKDIR /tmp/hexo-src

ENTRYPOINT ["docker-entrypoint.sh"]

CMD build
