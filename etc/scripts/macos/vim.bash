#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.bash

vim_path="$XDG_CACHE_HOME/vim"
vim_backup_path="$XDG_CACHE_HOME/vim/backup"
vim_undo_path="$XDG_CACHE_HOME/vim/undo"
vim_swap_path="$XDG_CACHE_HOME/vim/swap"

function setup_vim() {
    mkdir_with_check $vim_path
    mkdir_with_check $vim_backup_path
    mkdir_with_check $vim_undo_path
    mkdir_with_check $vim_swap_path
}

log $0 setup_vim

