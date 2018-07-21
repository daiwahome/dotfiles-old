#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.bash

vim_plug_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
vim_plug_path="$XDG_DATA_HOME/nvim/site/autoload/plug.vim"

function install_neovim() {
    brew install neovim >/dev/null
}

function install_vim_plug() {
    curl -fLo $vim_plug_path --create-dirs $vim_plug_url
}

log $0 install_neovim
log $0 install_vim_plug

