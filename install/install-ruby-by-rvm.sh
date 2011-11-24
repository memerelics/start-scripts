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
rvm install 1.9.2-p290
echo "rvm use 1.9.2-p290" >> ~/.bashrc
source ~/.bashrc

echo " ---------- Ruby Version ------------ "
ruby --version
echo " ------------------------------------ "

# gem
gem install bundler --no-rdoc --no-ri
