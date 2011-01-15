#!/bin/sh

#run as hash
if [ "`whoami`" != "hash" ]; then
  echo "ERROR: should run as hash"
  exit 1
fi

git config --global user.name "takuyahashimoto"
git config --global user.email takuya21hashimoto@gmail.com

cd /home/hash
mkdir git

### clone start-scripts
cd /home/hash/git
git clone ssh://takuyahashimoto@112.78.112.93:22/home/takuyahashimoto/git/start-scripts
cd start-scripts
git remote add sakura ssh://takuyahashimoto@112.78.112.93:22/home/takuyahashimoto/git/start-scripts

### clone config
cd /home/hash/git
git clone ssh://takuyahashimoto@112.78.112.93:22/home/takuyahashimoto/git/config
cd config
git remote add sakura ssh://takuyahashimoto@112.78.112.93:22/home/takuyahashimoto/git/config
