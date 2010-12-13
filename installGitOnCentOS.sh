#!/bin/sh

cd /usr/local/src
wget http://kernel.org/pub/software/scm/git/git-1.7.3.tar.bz2
#replace latest version here
tar xvjf git-1.7.3.tar.bz2
cd git-1.7.3
yum -y install zlib-devel
./configure --prefix=/usr/local/
make
make install
git config --global user.name "takuyahashimoto"
git config --global user.email takuya21hashimoto@gmail.com
