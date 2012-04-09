" Plugin manager
call pathogen#infect()

" Set line numbers
if has("gui_running")
  set relativenumber
else
  set number
end

set nocompatible                " choose no compatibility with legacy vi
set modelines=0                 " prevents some security exploits having to do with modelines in files
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set showmode
set ruler
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2
set shiftwidth=2                " a tab is two spaces (or set this to 4)
set softtabstop=2
set autoindent
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set list                        " Show invisible characters

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:▸\              " a tab should display as "  ", trailing whitespace as "."
set listchars+=eol:¬
set listchars+=trail:·            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the first column when wrap is
                                  " off and the line continues beyond the left of the screen
"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Fonts and colors
if has("gui_running")
  set background=dark
else
  set background=light
endif
" color solarized
" color jellybeans
color vividchalk
set guifont=Menlo\ Regular:h14

" Povide some context when editing
set scrolloff=3

" Don't use Ex mode, use Q for formatting
map Q gq

" Use comma as <Leader> key instead of backslash
let mapleader=","

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Command T plugin
"" ignore files and folders
set wildignore+=*.o,*.obj,*.git,*.log,*.tmp,*.jpeg,*.jpg,*.png,*.gif,*.mp3,*.pdf,*.swf,*.pyc,*.psd
set wildignore+=bundle/**,system/**,uploads/**,log/**,tmp/**

" Remove trailing whitespaces
autocmd BufWritePre *.rb,*.js,*.rake,*.tasks,*.html :%s/\s\+$//e

" Disable arrows even in insert mode
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Clean search
nnoremap <leader><space> :noh<cr>
" Use tabs to move in blocks
nnoremap <tab> %
vnoremap <tab> %

" Map <leader>a to Ack
nnoremap <leader>a :Ack

" Change way to come back to normal mode
inoremap jj <ESC>

" Open a vertical window and switch over it
nnoremap <leader>w <C-w>v<C-w>l

