#!/bin/sh

### check run as root
if [ "`whoami`" != "root" ]; then
echo "ERROR: should run as root"
  exit 1
fi

### install yums
yum -y install gcc make zlib-devel wget


#-----------------------------------
# first install eventlog
#-----------------------------------
cd ~ && mkdir -p work/src && cd ~/work/src
wget http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/3.3.3/source/eventlog_0.2.12.tar.gz
tar xvzf eventlog_0.2.12.tar.gz
cd eventlog-0.2.12/
./configure && make && make install


#-----------------------------------
# install syslog-ng
#-----------------------------------
yum -y install glib2-devel
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

cd ~ && mkdir -p work/src && cd ~/work/src
wget http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/3.3.3/source/syslog-ng_3.3.3.tar.gz
tar xvzf syslog-ng_3.3.3.tar.gz
cd syslog-ng-3.3.3/
./configure && make && make install

# register syslog-ng as a service
#-----------------------------------
cd /root/work/src/syslog-ng-3.3.3
cp contrib/fedora-packaging/syslog-ng.init /etc/rc.d/init.d/syslog-ng
chmod 755 /etc/init.d/syslog-ng
chkconfig --add syslog-ng
chkconfig syslog-ng on
service syslog-ng start
