#!/bin/sh

#run as hash -- because create new file/dirs
if [ "`whoami`" != "hash" ]; then
  echo "ERROR: should run as hash"
  exit 1
fi

sudo yum -y install zlib-devel

mkdir -p /home/hash/work/src
cd /home/hash/work/src
sudo wget http://kernel.org/pub/software/scm/git/git-1.7.3.tar.bz2
sudo tar xvjf git-1.7.3.tar.bz2

cd git-1.7.3

sudo ./configure --prefix=/usr/local
sudo make
sudo make install
