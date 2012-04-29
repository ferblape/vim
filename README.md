# Vim config files

My vim configuration files

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

## Author

Fernando Blat
<ferblape at gmail.com>
(@ferblape)[http://twitter.com/ferblape]
