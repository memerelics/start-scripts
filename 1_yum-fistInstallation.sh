#!/bin/sh

# run as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi

# yum update
yum -y update
yum -y upgrade

# create user "hash"
useradd hash
passwd hash
usermod -G wheel hash
visudo
# remove comment of wheel group
# and may need to Path to /usr/sbin
