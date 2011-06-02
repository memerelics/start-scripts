#!/bin/sh
# confirm that this script is executed as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi


############################
#    install Latest Ruby   #
############################
### check the latest version at http://www.ruby-lang.org/ja/downloads/ 

VERSION='1.9.2-p180'

mkdir -p /root/work/src
cd /root/work/src
### for stable version
# wget http://core.ring.gr.jp/archives/lang/ruby/ruby-1.9-stable.tar.gz
### for latest version
wget http://core.ring.gr.jp/archives/lang/ruby/ruby-$VERSION.tar.gz
tar zxvf ruby-$VERSION.tar.gz
cd ruby-$VERSION

./configure --prefix=/usr/local
#./configure --prefix=/opt/local
make && make install



############################
#    install Ruby Gems     #
############################
### check the latest version at http://rubyforge.org/projects/rubygems/
### GEM_VERSION='1.8.5' link is dynamic for each ver?

mkdir -p /root/work/src
cd /root/work/src
wget http://rubyforge.org/frs/download.php/74954/rubygems-1.8.5.tgz
tar zxvf rubygems-1.8.5.tgz
cd rubygems-1.8.5
ruby setup.rb


############################
#       install Others     #
############################
### notice that these pachages are not the latest version.

yum -y install rdoc
yum -y install ruby-devel

### enable openssl -- following install ERROR... when make
# yum -y install openssl-devel
# cd /root/work/src/ruby-$VERSION/ext/openssl
# ruby extconf.rb
# make
# make install
