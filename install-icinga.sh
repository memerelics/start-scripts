#!/bin/sh
# basically based on 
# http://docs.icinga.org/latest/en/quickstart-icinga.html

### check httpd is already running
if [ "`pgrep httpd`" = "" ]; then
  echo "httpd should be running before installing nagios"
  exit 1
fi

# confirm that first this script is executed as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi

############################
## install required yums  ##
############################
yum -y install gcc glibc glibc-common gd gd-devel
yum -y install libjpeg libjpeg-devel libpng libpng-devel
yum -y install net-snmp net-snmp-devel

### if also install IDOUtils
yum -y install libdbi 

############################
#      install icinga      #
############################
mkdir -p /root/work/src
cd /root/work/src
wget http://sourceforge.net/projects/icinga/files/icinga/1.2.1/icinga-1.2.1.tar.gz
tar zvxf icinga-1.2.1.tar.gz
cd icinga-1.2.1

# ref: http://d.hatena.ne.jp/dharry/20100923/1285187469
