#!/bin/sh

START=`date "+%F %T"`

if [ $1 = "sh" ];then sh; exit 0; fi

if [ $1 = "version" ];then
  cd ../hexo
  tar -zxvf node_modules.tar.gz > /dev/null 2>&1
  exec ./node_modules/hexo/bin/hexo version
fi

git config -g user.name ${GIT_USERNAME:-none}

git config -g user.email ${GIT_USEREMAIL:-none@none.com}

rm -rf public
cp -a source themes _config.yml ../hexo/
cd ../hexo
tar -zxvf node_modules.tar.gz > /dev/null 2>&1

# echo "registry=https://registry.npm.taobao.org" > /root/.npmrc

main(){
  ./node_modules/hexo/bin/hexo version
  ./node_modules/hexo/bin/hexo g
  cp -a public ../hexo-src/
  case $1 in
    deploy )
      ./node_modules/hexo/bin/hexo d
      ;;
    server )
      exec ./node_modules/hexo/bin/hexo server
      ;;
  esac
  echo $START
  date "+%F %T"
}

main $@
