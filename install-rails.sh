#!/bin/sh
# confirm that this script is executed as root
if [ "`whoami`" != "root" ]; then
  echo "ERROR: should run as root"
  exit 1
fi
if [ -z "`which gem`" ]; then
echo "ERROR: Please install RubyGems first"
  exit 1
fi

gem update --system
gem install rails --include-dependencies

yum -y install sqlite-devel

### root? hash?
gem install sqlite3
