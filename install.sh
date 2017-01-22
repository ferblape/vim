#!/bin/bash

cd $HOME &&
rm -rf .vim/
rm .vimrc
rm .gvimrc
git clone git://github.com/ferblape/vim.git .vim
ln -s .vim/vimrc .vimrc
ln -s .vim/gvimrc .gvimrc
cd .vim/bundle
git submodule init
git submodule update
cd $HOME
echo "Installation finished!"
