#!/bin/sh

### check run as root
if [ "`whoami`" != "root" ]; then
echo "ERROR: should run as root"
  exit 1
fi

### install yums
yum -y install gcc make zlib-devel

cd ~ && mkdir -p work/src && cd work/src

### first install eventlog
wget http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/3.3.3/source/eventlog_0.2.12.tar.gz
tar xvzf eventlog_0.2.12.tar.gz
cd eventlog-0.2.12/
./configure && make && make install
cd ..


### install syslog-ng

 libglib2.0-dev

wget http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/3.3.3/source/syslog-ng_3.3.3.tar.gz
tar xvzf syslog-ng_3.3.3.tar.gz
cd syslog-ng-3.3.3/
./configure && make && make install


