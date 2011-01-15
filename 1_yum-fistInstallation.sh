#!/bin/sh

#run as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi

#just update
yum -y update
yum -y upgrade

### needed for youseikouza
#sudo yum -y install telnet-server
#sudo yum -y install postfix
#sudo yum -y install dovecot
#sudo yum -y install cyrus-imapd
#sudo yum -y install vsftpd

#sudo yum -y install samba-client
#sudo yum -y install bind
#sudo yum -y install bind-chroot
#sudo yum -y install caching-nameserver
