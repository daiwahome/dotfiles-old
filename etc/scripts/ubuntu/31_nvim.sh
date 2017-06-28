#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.sh

vim_plug_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
vim_plug_path="$XDG_DATA_HOME/nvim/site/autoload/plug.vim"

function install_neovim() {
    sudo add-apt-repository -y ppa:neovim-ppa/stable
    sudo apt-get -qq update

    sudo apt-get -qq install -y python-dev python-pip python3-dev python3-pip
    sudo apt-get -qq install -y neovim
}

function install_vim_plug() {
    curl -fLo $vim_plug_path --create-dirs $vim_plug_url
}

log $0 install_neovim
log $0 install_vim_plug

