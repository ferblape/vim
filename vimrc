" Plugin manager
call pathogen#infect()

" Set line numbers
if has("gui_running")
  set relativenumber
  set guioptions-=T " no toolbar
  set guioptions-=r
  set guioptions-=L
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
set autoread
filetype plugin indent on       " load file type plugins + indentation
runtime macros/matchit.vim      " enable matchit plugin

"" Whitespace
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
"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase
set smartcase                   " ... unless they contain at least one capital letter

"" Fonts and colors
set background=dark
" color mac_classic
" color solarized
" color jellybeans
" color vividchalk
color Tomorrow-Night-Eighties
set guifont=Menlo\ Regular:h14

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

" Closetags plugin
" set Filetype html,xml,xsl,erb
source ~/.vim/bundle/closetag.vim
let g:closetag_html_style=1
inoremap <c-g> <C-R>=GetCloseTag()<CR>

" Command T plugin
"" ignore files and folders
set wildignore+=*.o,*.obj,*.git,*.log,*.tmp,*.jpeg,*.jpg,*.png,*.gif,*.mp3,*.pdf,*.swf,*.pyc,*.psd
set wildignore+=bundle/**,system/**,uploads/**,log/**,tmp/**

" Remove trailing whitespaces
" autocmd BufWritePre *.rb,*.rake,*.tasks,*.html,*.erb,*.html.erb,*.sh :%s/\s\+$//e

" Disable arrows even in insert mode
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Map move between tabs
nnoremap <leader>f gT
nnoremap <leader>g gt
map <leader>q <C-]>
map <leader>Q :tab split<CR>:exec("tag ".expand("<cword>"))<CR>


" Clean search
nnoremap <leader><space> :noh<cr>
" Use tabs to move in blocks
nnoremap <tab> %
vnoremap <tab> %

" Search using ag
let g:ackprg = 'ag --nogroup --nocolor --column'
" Map <leader>a to Ack
nnoremap <leader>a :Ack

" Change way to come back to normal mode
inoremap jj <ESC>

" Exit insert mode, insert a begin of block (do or {), close the block and 
" go inside the block
inoremap jdo <ESC>A<space>do<Enter>end<ESC>ko
inoremap j{ <ESC>A<space>{<Enter>}<ESC>ko

" Open a vertical window and switch over it
nnoremap <leader>w <C-w>v<C-w>l
" Open a horizontal window and switch over it
nnoremap <leader>W <C-w>s<C-w>j

" NERDTree
nnoremap <leader>n :NERDTreeTabsOpen<Enter>
nnoremap <leader>c :NERDTreeTabsClose<Enter>

" Remove the whole line without yanking
nnoremap <leader>d 0"_D
" Delete without yanking (i.e do Rd instead of dd, or R$ instead of d$)
nnoremap R "_d

" Save your swp files to a less annoying place than the current directory
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=~/.vim/swap

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vim/vimrc

" goes to the definition of a Ruby method when
" cursor is inside of it
:nmap [[ ?def <CR>
:nmap ]] /def <CR>

" tidy xmls
nnoremap <C>x :%!tidy -i -xml -q

let g:rails_projections = {
\ "config/projections.json": {
\   "command": "projections"
\ },
\ "vendor/metadata-exporters/cardinal/lib/cardinal/*.rb": {
\  "command": "cardinal",
\  "test": "vendor/metadata-exporters/cardinal/spec/%s_spec.rb"
\ },
\ "vendor/metadata-exporters/xml_technique/lib/xml_technique/*.rb": {
\  "command": "xml_technique",
\  "related": "vendor/metadata-exporters/xml_technique/lib/xml_technique/manifest.xml.erb",
\  "test": "vendor/metadata-exporters/xml_technique/spec/%s_spec.rb"
\ },
\ "spec/features/*_spec.rb": {
\   "command": "feature",
\   "template": "require 'spec_helper'\n\nfeature '%h' do\n\nend",
\ },
\}

" snippets
iab sap save_and_open_page

nmap <silent> <leader>s :set spell!<CR>

" Set region to British English
set spelllang=en_gb
