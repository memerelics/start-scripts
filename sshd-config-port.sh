#!/bin/sh

# if the number of arguments != 1
if [ $# -ne 1 ]; then
    echo "need to define new port"
    exit 1
fi

sudo cp -p /etc/ssh/sshd_config /etc/ssh/sshd_config.original
sudo sed "/Port 22/a Port ${1}" /etc/ssh/sshd_config.original > /etc/ssh/sshd_config
sudo /etc/rc.d/init.d/sshd restart
