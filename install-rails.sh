#!/bin/sh
# confirm that this script is executed as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi

#if [ "`gem -v`" != "1.3.7" ]; then
#exit 1
#fi

gem update --system
gem install rails --include-dependencies

