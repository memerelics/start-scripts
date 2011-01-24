#!/bin/sh

# confirm that first this script is executed as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi

rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi
cd /etc/yum.repos.d
wget http://rpms.famillecollet.com/remi-enterprise.repo

### USAGE ###
# yum -y --enablerepo=remi install ...
