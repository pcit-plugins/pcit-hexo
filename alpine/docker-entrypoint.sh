#!/bin/sh

START=`date "+%F %T"`

if [ $1 = "sh" ];then sh; exit 0; fi

if [ $1 = "version" ];then
  cd /srv/hexo
  tar -zxvf node_modules.tar.gz > /dev/null 2>&1
  exec npx hexo version
fi

set -x

git config --global user.name ${GIT_USERNAME:-ci}
git config --global user.email ${GIT_USEREMAIL:-ci@khs1994.com}
git config --global core.sshCommand 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

WORKDIR=$PWD

rm -rf public
cp -a source themes _config.yml /srv/hexo/
cd /srv/hexo
tar -zxvf node_modules.tar.gz > /dev/null 2>&1

# echo "registry=https://registry.npm.taobao.org" > /root/.npmrc

main(){
  npx hexo version
  npx hexo g
  cp -a public $WORKDIR
  case $1 in
    deploy )
      npx hexo d
      ;;
    server )
      exec npx hexo server
      ;;
  esac
  echo $START
  date "+%F %T"
}

main $@
