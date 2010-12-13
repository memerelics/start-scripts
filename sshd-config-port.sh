#!/bin/sh

sudo cp -p /etc/ssh/sshd_config /etc/ssh/sshd_config.original
sudo sed "/Port 22/a Port 15535" /etc/ssh/sshd_config.original > /etc/ssh/sshd_config
sudo /etc/rc.d/init.d/sshd restart
