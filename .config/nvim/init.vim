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
let s:python_bin_dir = $WORKON_HOME . '/nvim/bin'
let g:python3_host_prog = expand(s:python_bin_dir . '/python')

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
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2
let g:neomake_python_enabled_makers = ['python', 'pylint', 'mypy']
let g:neomake_python_pylint_maker = {
  \ 'exe': expand(s:python_bin_dir . '/pylint'),
  \ 'args': [
      \ '--output-format=text',
      \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"',
      \ '--reports=no'
  \ ],
  \ 'errorformat':
      \ '%A%f:%l:%c:%t: %m,' .
      \ '%A%f:%l: %m,' .
      \ '%A%f:(%l): %m,' .
      \ '%-Z%p^%.%#,' .
      \ '%-G%.%#',
  \ 'postprocess': [
      \ function('neomake#postprocess#GenericLengthPostprocess'),
      \ function('neomake#makers#ft#python#PylintEntryProcess'),
  \ ]
  \ }
let g:neomake_python_mypy_maker = {
  \ 'exe': expand(s:python_bin_dir . '/mypy'),
  \ 'args': ['--ignore-missing-imports', '--follow-imports=skip'],
  \ 'errorformat':
      \ '%E%f:%l: error: %m,' .
      \ '%W%f:%l: warning: %m,' .
      \ '%I%f:%l: note: %m',
  \ }

"
" deoplete
"
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

"
" deoplete-jedi
"
set completeopt-=preview

"
" colorscheme
"
syntax enable
colorscheme molokai

