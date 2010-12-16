#!/bin/sh

#just update
sudo yum -y update

# needed for youseikouza
sudo yum -y install telnet-server
sudo yum -y install postfix
sudo yum -y install dovecot
sudo yum -y install cyrus-imapd
sudo yum -y install vsftpd

sudo yum -y install samba-client
sudo yum -y install bind
