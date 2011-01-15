#!/bin/sh

# run as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi

# yum update
yum -y update
yum -y upgrade

# create user "hash"
useradd hash
passwd hash
usermod -G wheel hash
visudo

# remove comment of wheel group
# and may need to Path to /usr/sbin


### run as hash -- because create new file/dirs ###
su hash
### run as hash ###

sudo yum -y install zlib-devel

mkdir -p /home/hash/work/src
cd /home/hash/work/src
sudo wget http://kernel.org/pub/software/scm/git/git-1.7.3.tar.bz2
sudo tar xvjf git-1.7.3.tar.bz2

cd git-1.7.3

sudo ./configure --prefix=/usr/local
sudo make
sudo make install
