#!/bin/sh

#run as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi


### needed for youseikouza
#yum -y install telnet-server
#yum -y install postfix
#yum -y install dovecot
#yum -y install cyrus-imapd
#yum -y install vsftpd

#yum -y install samba-client
#yum -y install bind
#yum -y install bind-chroot
#yum -y install caching-nameserver
