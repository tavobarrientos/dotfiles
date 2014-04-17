runtime bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()
syntax on
filetype plugin indent on

" Set Line Numbers
set number

" NERDTree Configuration
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>

" Disable Arrow Keys
noremap  <up>     <nop>
noremap  <down>   <nop>
noremap  <left>   <nop>
noremap  <right>  <nop>
inoremap <up>     <nop>
inoremap <down>   <nop>
inoremap <left>   <nop>
inoremap <right>  <nop>

" Color Scheme
syntax enable
set background=dark
colorscheme solarized

set cursorline " Highlight current line
set autoindent " Copy indent from last line
set mouse=a " Enable Mouse
set shell=/bin/sh " Set Bash to execute current shell commands
set visualbell " Disable audible Alert