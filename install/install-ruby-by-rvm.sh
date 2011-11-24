#!/usr/bash

# when .bashrc exists, rvm-installer automatically add source rvm script into it.
if [ ! -e $HOME/.bashrc ]; then
  touch $HOME/.bashrc
fi

curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer > tmp-rvm-installer
bash tmp-rvm-installer
rm tmp-rvm-installer

# source to make rvm command available
source ~/.bashrc

# install ruby and use it
rvm pkg install zlib
rvm install 1.9.2-p290 --with-zlib-dir=$rvm_usr_path
echo "rvm 1.9.2-p290" >> ~/.bashrc
source ~/.bashrc

echo " ---------- Ruby Version ------------ "
ruby --version
echo " ------------------------------------ "


# gem

cat <<_EOF_ > ~/.gemrc
---
:verbose: true
:update_sources: true
:sources:
- http://rubygems.org
gem: --no-ri --no-rdoc
_EOF_

gem install bundler --no-rdoc --no-ri

