#!/bin/sh
# confirm that this script is executed as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi


############################
#       install GCC        #
############################
yum -y install glibc glibc.i386

### yum -y install gcc* ### work in this command, but too many.
yum -y install gcc-c++

#############################
##      install Mecab       #
#############################
mkdir -p /root/work/src
cd /root/work/src
wget http://downloads.sourceforge.net/project/mecab/mecab/0.98/mecab-0.98.tar.gz
tar zxvf mecab-0.98.tar.gz
cd mecab-0.98
./configure
make
make install


#############################
## install MeCab-IPA Dict  ##
#############################
mkdir -p /root/work/src
cd /root/work/src
wget http://downloads.sourceforge.net/project/mecab/mecab-ipadic/2.7.0-20070801/mecab-ipadic-2.70-20070801.tar.gz
tar zxvf mecab-ipadic-2.7.0-20070801.tar.gz
cd mecab-ipadic-2.7.0-20070801

### default charset is EUC ###
./configure --with-charset=utf8
make
make install


#############################
##   install MeCab-Ruby    ##
#############################
mkdir -p /root/work/src
cd /root/work/src
wget http://downloads.sourceforge.net/project/mecab/mecab-ruby/0.98/mecab-ruby-0.98.tar.gz
tar zxvf mecab-ruby-0.98.tar.gz
cd mecab-ruby-0.98
ruby extconf.rb
make
make install
