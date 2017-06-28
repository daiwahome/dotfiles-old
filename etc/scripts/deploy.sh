#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ./common.sh

# Deploy a dotfile
function deploy_dotfile() {
    local path="$1"
    local target="$2"
    local name="$3"

    mkdir_with_check $path

    ln -fsv $target $path/$name
}

do_home deploy_dotfile
do_xdg_config_home deploy_dotfile
do_custom_path deploy_dotfile

