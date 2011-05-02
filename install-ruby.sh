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

mkdir -p /root/work/src
cd /root/work/src
### for stable version
# wget http://core.ring.gr.jp/archives/lang/ruby/ruby-1.9-stable.tar.gz
### for latest version
wget http://core.ring.gr.jp/archives/lang/ruby/ruby-1.9.2-p180.tar.gz
tar zxvf ruby-1.9.2-p180.tar.gz
cd ruby-1.9.2-p180
#./configure --prefix=/usr/local
./configure --prefix=/opt/local
make && make install


############################
#    install Ruby Gems     #
############################
### check the latest version at http://rubyforge.org/projects/rubygems/

mkdir -p /root/work/src
cd /root/work/src
wget http://rubyforge.org/frs/download.php/73882/rubygems-1.4.2.tgz
tar zxvf rubygems-1.4.2.tgz
cd rubygems-1.4.2
ruby setup.rb


############################
#       install Others     #
############################
### notice that these pachages are not the latest version.

yum -y install rdoc
yum -y install ruby-devel
