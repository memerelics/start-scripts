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
visudo

### 3. switch user to hash ###
scp takuyahashimoto@112.78.112.93:/home/takuyahashimoto/git/start-scripts/1_before_git_hash.sh /home/hash
su hash
