#!/bin/sh

TARGET_DIR="$HOME/.vim"
if [ ! -d $TARGET_DIR ]
then
    mkdir -p $TARGET_DIR
fi

### pathogen.vim
cd $HOME/.vim
mkdir bundle
mkdir autoload
git init
git submodule add git://github.com/tpope/vim-pathogen.git bundle/vim-pathogen
ln -s $HOME/.vim/bundle/vim-pathogen/autoload/pathogen.vim $HOME/.vim/autoload/

### vimshell.vim
cd $HOME/.vim
git submodule add git://github.com/Shougo/vimproc.git bundle/vimproc.vim
git submodule add git://github.com/Shougo/vimshell.git bundle/vimshell.vim

cd $HOME/.vim/bundle/vimproc.vim
make -f make_gcc.mak

# copy to runtime.... ??
# say different words in English/Japanese
# vimproc.txt:  After compile, you copy autoload/* files to your |$VIMRUNTIME|.
# vimproc.jat: コンパイルが通ったら、autoload/にあるファイルやディレクトリを.vimのautoloadディレクトリにコピーする。
# /usr/local/share/vim/vim73/ <- $VIMRUNTIME

cp -r autoload/* $HOME/.vim/autoload/


### surround.vim
cd $HOME/.vim
wget http://vim.sourceforge.net/scripts/download_script.php?src_id=12566 -O surround.vim.zip
mkdir -p bundle/surround.vim
mv surround.vim.zip bundle/surround.vim
cd bundle/surround.vim && unzip surround.vim.zip

### Align.vim
cd $HOME/.vim
git submodule add git://github.com/tsaleh/vim-align.git bundle/align.git

### rails.vim
cd $HOME/.vim
git submodule add git://github.com/tpope/vim-rails.git bundle/rails.git
