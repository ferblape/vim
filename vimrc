" Plugin manager
call pathogen#infect()

" Set line numbers
if has("gui_running")
  set guioptions-=T " no toolbar
  set guioptions-=r
  set guioptions-=L
else
  set number
end

set relativenumber

set nocompatible                " choose no compatibility with legacy vi
set modelines=0                 " prevents some security exploits having to do with modelines in files
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set showmode
set ruler
set autoread
filetype plugin indent on       " load file type plugins + indentation
runtime macros/matchit.vim      " enable matchit plugin

" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2
set shiftwidth=2                " a tab is two spaces (or set this to 4)
set softtabstop=2
set autoindent
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set list                        " Show invisible characters
set colorcolumn=100

" Allows you to jump to a file without saving it
set hidden
" Tip: Use Ctrl + o to jump to the previous file

" Set markdown files length to 100
au BufRead,BufNewFile *.md setlocal textwidth=100

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:▸\              " a tab should display as "  ", trailing whitespace as "."
set listchars+=eol:¬
set listchars+=trail:·            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the first column when wrap is
                                  " off and the line continues beyond the left of the screen
" Searching
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase
set smartcase                     " ... unless they contain at least one capital letter

" Fonts and colors
set background=dark
" color mac_classic
" color solarized
" color jellybeans
" color vividchalk
color Tomorrow-Night-Eighties
" set guifont=Menlo\ Regular:h14
set guifont=Iosevka:h14

" Povide some context when editing
set scrolloff=3

" Gem tags
set tags+=gems.tags

" Don't use Ex mode, use Q for formatting
map Q gq

" Use comma as <Leader> key instead of backslash
let mapleader=","

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Command P plugin
"" ignore files and folders
set wildignore+=*.o,*.obj,*.git,*.log,*.tmp,*.jpeg,*.jpg,*.png,*.gif,*.mp3,*.pdf,*.swf,*.pyc,*.psd
set wildignore+=bundle/**,system/**,uploads/**,log/**,tmp/**,node_modules/**,*/node_modules/*
set wildignore+=tags
set wildignore+=.git/**

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules)$'

" Remove trailing whitespaces
autocmd BufWritePre *.md,*.txt,*.rb,*.rake,*.tasks,*.html,*.erb,*.html.erb,*.sh,*.js :%s/\s\+$//e

" Map move between tabs
nnoremap <leader>f gT
nnoremap <leader>g gt

" TODO: not sure what it does
map <leader>q <C-]>
" Run tag command
map <leader>Q :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Clean search
nnoremap <leader><space> :noh<cr>
" Use tabs to move in blocks
nnoremap <tab> %
vnoremap <tab> %

" Search using ag
let g:ackprg = 'ag --nogroup --nocolor --column --hidden'
" Map <leader>a to Ack
nnoremap <leader>a :Ack

" Change to normal mode and save
inoremap jj <ESC>:w

" Exit insert mode, insert a begin of block (do or {), close the block and 
" go inside the block
inoremap jdo <ESC>A<space>do<Enter>end<ESC>ko
inoremap j{ <ESC>A<space>{<Enter>}<ESC>ko

" Open a vertical window and switch over it
nnoremap <leader>w <C-w>v<C-w>l
" Open a horizontal window and switch over it
nnoremap <leader>W <C-w>s<C-w>j

" Remove the whole line without yanking
nnoremap <leader>d 0"_D
" Delete without yanking (i.e do Rd instead of dd, or R$ instead of d$)
nnoremap R "_d

" Save your swp files to a less annoying place than the current directory
if isdirectory($HOME . '/.vim_swap') == 0
  :silent !mkdir -p ~/.vim_swap >/dev/null 2>&1
endif
set directory=~/.vim_swap

" automatically reload vimrc when it's saved
" au BufWritePost .vimrc so ~/.vim/vimrc

" goes to the definition of a Ruby method when
" cursor is inside of it
:nmap [[ ?def <CR>
:nmap ]] /def <CR>

" tidy xmls
nnoremap <C>x :%!tidy -i -xml -q

" snippets
iab sap save_and_open_page
iab cl console.log();
iab tick ✔︎

nmap <silent> <leader>s :set spell!<CR>

" Set region to British English
set spelllang=en_gb

inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

" Copy current filename to system clipboard
nnoremap <Leader>yf :let @*=expand("%:p")<cr>:echo "Copied file name to clipboard"<cr>

let g:user_emmet_leader_key='<leader>'

" CtrlP
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" NerdTree
" Show hidden files
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_gui_startup=2
let g:nerdtree_tabs_open_on_console_startup=1

" Disable sound
set noeb vb t_vb=

" select last paste in visual mode
" https://dalibornasevic.com/posts/43-12-vim-tips
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" use localorie
nnoremap <silent> <leader>lt :call localorie#translate()<CR>
nnoremap <silent> <leader>le :call localorie#expand_key()<CR>

" map write and quit
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Syntactic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'eslint'
