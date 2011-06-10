#!/bin/sh

### check httpd is already running
if [ "`pgrep httpd`" = "" ]; then
  echo "httpd should be running before installing nagios"
  exit 1
fi

### check run as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi


### install required yums
yum -y install gd-devel


############################
#    create user nagios    #
############################
if [ "`cat /etc/passwd | grep nagios`" != "" ]; then
echo "user nagios is already exist\n"
else
echo "create new user nagios"
useradd -d /usr/local/nagios/ -M nagios
fi


############################
#      install nagiosa     #
############################
mkdir -p /root/work/src
cd /root/work/src
wget http://jaist.dl.sourceforge.net/sourceforge/nagios/nagios-3.2.3.tar.gz
tar xvzf nagios-3.2.3.tar.gz
cd nagios-3.2.3
./configure && make all && make fullinstall && make install-config


############################
#  start nagios & httpd    #
############################
/etc/init.d/nagios start
/etc/init.d/httpd restart

############################
#  nagios web Basic user   #
############################
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

############################
# install nagios-plugins   #
############################
cd /root/work/src
wget http://sourceforge.net/projects/nagiosplug/files/nagiosplug/1.4.15/nagios-plugins-1.4.15.tar.gz
tar xvzf nagios-plugins-1.4.15.tar.gz
cd nagios-plugins-1.4.15
./configure && make && make install



