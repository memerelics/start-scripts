#!/bin/sh

#just update
sudo yum -y update

sudo yum -y install telnet-server
yum -y install postfix
yum -y install dovecot
yum -y install cyrus-imapd
yum -y install vsftpd

