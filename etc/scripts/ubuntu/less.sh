#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.sh

less_path="$XDG_CACHE_HOME/less"

function install_less() {
    sudo apt-get -qq install -y less
}

function setup_less() {
    mkdir_with_check $less_path
}

log $0 install_less
log $0 setup_less

