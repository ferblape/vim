# Vim

My vim configuration files

## Requirements

- Ctags (install it via brew `brew install ctags`)

## How to install them

```bash
cd $HOME
rm -rf vim/
rm -rf .vim/
git clone git://github.com/ferblape/vim.git
mv vim .vim
ln -s .vim/vimrc .vimrc
cd .vim
git submodule init
git submodule update
```

## Contact me

`ferblape at gmail.com`
[@ferblape](http://twitter.com/ferblape)
