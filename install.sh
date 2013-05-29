#!/bin/bash

cd $HOME &&
rm -rf .vim/ &&
rm .vimr &&
rm .gvimr &&
git clone git://github.com/ferblape/vim.git .vim &&
ln -s .vim/vimrc .vimr &&
ln -s .vim/gvimrc .gvimr &&

