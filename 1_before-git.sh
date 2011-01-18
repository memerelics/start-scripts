#!/bin/sh
# this start-script should be run just for initial OS setup
# here OS = CentOS 5
# contains 3 parts.
#   1. yum update
#   2. create user "hash"
#   3. switch user to hash

# 0. confirm that first this script is executed as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi

##### 1. yum update #####
yum -y update
yum -y upgrade

##### 2. create user "hash" #####
useradd hash
passwd hash
usermod -G wheel hash
# visudo
# [edit] remove comment of wheel group
# [edit] and may need to Path to /usr/sbin
sed -i 's/# %wheel\tALL=(ALL)\tALL/%wheel\tALL=(ALL)\tALL/g' /etc/sudoers

### 3. switch user to hash ###
scp takuyahashimoto@112.78.112.93:/home/takuyahashimoto/git/start-scripts/2_*.sh /home/hash
chown hash:hash /home/hash/*
su hash
