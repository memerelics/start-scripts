#!/bin/sh

#run as root

useradd hash
passwd hash
usermod -G wheel hash
visudo
# remove comment of wheel group
# and may need to Path to /usr/sbin
