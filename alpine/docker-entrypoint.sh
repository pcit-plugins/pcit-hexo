#!/bin/sh

START=`date "+%F %T"`

if [ $1 = "sh" ];then
  sh
  exit 0
fi

rm -rf node_modules public
cp -a . ../hexo/
cd ../hexo
tar -zxvf node_modules.tar.gz > /dev/null 2>&1
# echo "registry=https://registry.npm.taobao.org" > /root/.npmrc
echo $PWD

main(){
  ./node_modules/hexo/bin/hexo version
  ./node_modules/hexo/bin/hexo g
  cp -a public ../hexo-src/
  case $1 in
    deploy )
      ./node_modules/hexo/bin/hexo d
      ;;
    server )
      ./node_modules/hexo/bin/hexo server
      ;;
  esac
  echo $START
  date "+%F %T"
}

main $1 $2 $3
