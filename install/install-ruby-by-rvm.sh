#!/usr/bash

# when .bashrc exists, rvm-installer automatically add source rvm script into it.
if [ ! -e $HOME/.bashrc ]; then
  touch $HOME/.bashrc
fi

# insatll rvm with ruby
curl -L https://get.rvm.io | bash -s stable

# source to make rvm command available
source /home/hash/.rvm/scripts/rvm
echo "source /home/hash/.rvm/scripts/rvm" >> ~/.bashrc

## install ruby and use it
# rvm pkg install zlib
# rvm install 1.9.2-p290 --with-zlib-dir=$rvm_usr_path
# echo "rvm 1.9.2-p290" >> ~/.bashrc
# source ~/.bashrc

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

# install required gems. for example...
# gem install bundler --no-rdoc --no-ri
# gem install unicorn --no-rdoc --no-ri
