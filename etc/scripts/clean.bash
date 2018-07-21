#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ./common.bash

# Remove the symbolic link
function clean_dotfile() {
    local path="$1"
    local target="$2"
    local name="$3"

    rm -fv $path/$name
}

do_home clean_dotfile
do_xdg_config_home clean_dotfile
do_custom_path clean_dotfile

