#!/bin/sh

pwd
cd /usr/local/src
pwd
sudo wget http://kernel.org/pub/software/scm/git/git-1.7.3.tar.bz2

sudo tar xvjf git-1.7.3.tar.bz2
cd git-1.7.3
pwd
sudo yum -y install zlib-devel
sudo ./configure --prefix=/usr/local/
sudo make
sudo make install
git config --global user.name "takuyahashimoto"
git config --global user.email takuya21hashimoto@gmail.com
