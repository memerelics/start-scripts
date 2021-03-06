#!/bin/sh
# this start-script should be run just for initial OS setup
# here OS = CentOS 5, or Fedora
# contains 3 parts. You may need to run them by hand.
#   1. yum update
#   2. create user "hash"
#   3. download init scripts via HTTP

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
# <==> do same thing with sed
sed -i 's/# %wheel/%wheel/g' /etc/sudoers

### 3. switch user to hash ###
# FYI : I could not yum install via Sakura VPS console.
#       But temprary I allow root ssh login and yum install via Mac terminal, it works well.
yum -y install wget
wget --no-check-certificate https://github.com/memerelics/start-scripts/raw/master/2_setup-git.sh

## after that, not tested yet ##
chown hash:hash 2_setup-git.sh
mv 2_setup-git.sh /home/hash

echo <<EOT
to make it easy to login as hash...
$ vim ~/.ssh/authorized_keys
 >>> put your *.pub key inside this file. <<<

$ chmod 600 ~/.ssh/authorized_keys

...and run sshd-config-port.sh to change ssh port from 22 to more secure port
EOT

echo "-------------"
echo <<EOT
TODO: SELINUX=disabled
# vim /etc/selinux/config

TODO: change iptables settings
iptables -L
EOT
