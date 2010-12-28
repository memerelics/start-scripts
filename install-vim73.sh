sudo yum -y install patch
sudo yum -y install ncurses-devel

mkdir -p /home/hash/work/src

### KEEP cd 
cd /home/hash/work/src
echo "cd /home/hash/work/src\n"

wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
tar jxfv vim-7.3.tar.bz2

mkdir vim73/patches
cd vim73/patches

seq -f http://ftp.vim.org/pub/vim/patches/7.3/7.3.%03g 89 | xargs wget
## replace 89 => newest patch version
cd ..
cat patches/7.3.* | patch -p0

## KEEP cd 
cd /home/hash/work/src/vim73

sudo ./configure --prefix=/usr/local --enable-multibyte --with-features=huge
sudo make
sudo make install
