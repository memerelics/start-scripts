#!/bin/sh
# this start-script should be run 
# after 1st script.

### confirm that following part is executed as hash ###
if [ "`whoami`" != "hash" ]; then
  echo "ERROR: should run as hash"
  exit 1
fi

##### 3. install git #####
sudo yum -y install zlib-devel
sudo yum -y install gcc
sudo yum -y install perl
sudo yum -y install perl-ExtUtils-MakeMaker


mkdir -p /home/hash/work/src
cd /home/hash/work/src
sudo wget http://kernel.org/pub/software/scm/git/git-1.7.3.tar.bz2
sudo tar xvjf git-1.7.3.tar.bz2

cd git-1.7.3

sudo ./configure --prefix=/usr/local
sudo make
sudo make install

##### 5. setup git #####

#run as hash
if [ "`whoami`" != "hash" ]; then
  echo "ERROR: should run as hash"
  exit 1
fi

git config --global user.name "takuyahashimoto"
git config --global user.email takuya21hashimoto@gmail.com

cd /home/hash
mkdir git

### clone config
cd /home/hash/git
git clone --origin github git@github.com:takuyahashimoto/config.git
echo "git clone --origin github git://github.com/takuyahashimoto/config.git"

### clone start-scripts
cd /home/hash/git
git clone --origin github git@github.com:takuyahashimoto/start-scripts.git
echo "git clone --origin github git://github.com/takuyahashimoto/start-scripts.git"
echo " now, you can run rest of start-scripts"
# if already puclic key on github is updated...
# git clone git@github.com:takuyahashimoto/config.git 

echo "///////////////////////////////////////"
echo "please run setup-github.sh to push to github"
