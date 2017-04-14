"
" options
"
set nobackup
set nocompatible
set number
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set list
set listchars=tab:>-,trail:=

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

"
" Plugins (vim-plug)
"
call plug#begin('~/.vim/plugged')
Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'
Plug 'tomasr/molokai'
Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/nerdtree'
call plug#end()

"
" jedi-vim
"
autocmd FileType python setlocal completeopt-=preview

"
" lightline
"
set laststatus=2
set ambiwidth=double
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
    \ }

"
" neocomplete
"
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

"
" nerdtree
"
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"
" colorscheme
"
set t_Co=256
syntax enable
colorscheme molokai
highlight Normal ctermbg=none
