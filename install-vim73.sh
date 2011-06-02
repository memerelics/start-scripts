#!/bin/sh

### confirm that following part is executed as hash ###
if [ "`whoami`" != "hash" ]; then
  echo "ERROR: should run as hash"
  exit 1
fi

### install required yums
sudo yum -y install patch
sudo yum -y install ncurses-devel
sudo yum -y install libselinux-devel # for selinux 


mkdir -p /home/hash/work/src

### KEEP cd 
cd /home/hash/work/src
echo "cd /home/hash/work/src\n"

wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
tar jxfv vim-7.3.tar.bz2

mkdir vim73/patches
cd vim73/patches

seq -f http://ftp.vim.org/pub/vim/patches/7.3/7.3.%03g 206 | xargs wget > /dev/null 2>&1
## replace 206 => newest patch version

cd /home/hash/work/src/vim73
cat patches/7.3.* | patch -p0

sudo ./configure --prefix=/usr/local --enable-multibyte --with-features=huge --enable-rubyinterp
sudo make
sudo make install

### ERROR
#  make[1]: *** [objects/os_unix.o] Error 1
# => added [sudo yum -y install libselinux-devel]

# TODO: automatically install must-plugins
# surround.vim, Align.vim, auto_wc.vim, renamer.vim, fugitive.vim

