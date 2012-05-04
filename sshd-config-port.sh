#!/bin/sh

# 0. confirm that first this script is executed as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi

# if the number of arguments != 1
if [ $# -ne 1 ]; then
    echo "need to define new port"
    exit 1
fi

cp -p /etc/ssh/sshd_config /etc/ssh/sshd_config.original
sed "/Port 22/a Port ${1}" /etc/ssh/sshd_config.original > /etc/ssh/sshd_config
systemctl restart sshd.service
# old RedHat => /etc/rc.d/init.d/sshd restart

# TODO: iptables script
