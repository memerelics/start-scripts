bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
rvm install ruby-1.9.2
rvm use 1.9.2
rvm info
which ruby
cat ~/.bashrc | grep rvm
