#!/bin/sh

# confirm that first this script is executed as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi

############################
#    install Latest Ruby   #
############################
# check the latest version at http://www.ruby-lang.org/ja/downloads/ 

# mkdir -p /root/work/src
cd /root/work/src
# wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p136.tar.gz
tar zxvf ruby-1.9.2-p136.tar.gz
cd ruby-1.9.2-p136
./configure --prefix=/usr/local
make && make install

############################
#    install Ruby Gems     #
############################
# check the latest version at http://rubyforge.org/projects/rubygems/
# mkdir -p /root/work/src
cd /root/work/src
wget http://rubyforge.org/frs/download.php/73882/rubygems-1.4.2.tgz
tar zxvf rubygems-1.4.2.tgz
cd rubygems-1.4.2
ruby setup.rb

############################
#       install RDocs      #
############################
yum -y install rdoc

