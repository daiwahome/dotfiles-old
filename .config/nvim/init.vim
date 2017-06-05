"
" options
"
set cursorline
set nobackup
set number

" coding
set smartindent
set list
set listchars=tab:>-,trail:=

" tab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformat=unix
set fileformats=unix,dos,mac

"
" Python
"
let g:python3_host_prog = expand('~/.virtualenvs/nvim/bin/python')

"
" Plugins (vim-plug)
"
call plug#begin('~/.local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'neomake/neomake'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
call plug#end()

"
" lightline
"
set laststatus=2
set ambiwidth=double
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'molokai',
    \ }

"
" neomake
"
let g:neomake_python_enabled_makers = ['pylint', 'mypy']

"
" deoplete
"
let g:deoplete#enable_at_startup = 1

"
" deoplete-jedi
"
set completeopt-=preview

"
" colorscheme
"
syntax enable
colorscheme molokai

