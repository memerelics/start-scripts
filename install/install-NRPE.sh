#!/bin/sh
############################
#         NOTICE
# this script should be run in remote -- "target" servers.
############################

### check run as root
if [ "`whoami`" != "root" ]; then
echo "ERROR: should run as root"
  exit 1
fi

### install yums
yum -y install xinetd
yum -y install openssl-devel


############################
#     prepare base user    #
############################
### prepare directory
mkdir /usr/local/nagios

### create user nagios
if [ "`cat /etc/passwd | grep nagios`" != "" ]; then
echo "user nagios is already exist\n"
else
echo "create new user nagios"
useradd -d /usr/local/nagios/ -M nagios
# make sure path is no problem. maybe need "su -"
fi

### change owner:group
chown nagios:nagios /usr/local/nagios/

############################
#       install NRPE       #
############################
mkdir -p /root/work/src
cd /root/work/src
wget http://jaist.dl.sourceforge.net/sourceforge/nagios/nrpe-2.12.tar.gz
tar zxvf nrpe-2.12.tar.gz
cd nrpe-2.12
./configure && make nrpe && make install-daemon && make install-daemon-config && make install-xinetd

############################
# install nagios-plugins #
############################
cd /root/work/src
wget http://sourceforge.net/projects/nagiosplug/files/nagiosplug/1.4.15/nagios-plugins-1.4.15.tar.gz
tar xvzf nagios-plugins-1.4.15.tar.gz
cd nagios-plugins-1.4.15
./configure && make && make install

