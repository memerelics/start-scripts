#!/bin/sh

### confirm that following part is executed as hash ###
if [ "`whoami`" != "hash" ]; then
  echo "ERROR: should run as hash"
  exit 1
fi

sudo yum -y install zsh
echo "installed dir is ==> `which zsh`"
chsh
zsh
