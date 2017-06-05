"
" options
"
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

" statusline
set laststatus=2
set statusline=%f\ %m%r%h%w
set statusline+=%=
set statusline+=%{&fileformat}\ \|\ %{&fileencoding}\ \|\ %3p%%\ \|\ %3c:%3l

" colorscheme
syntax enable
