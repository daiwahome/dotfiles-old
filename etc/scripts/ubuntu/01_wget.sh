#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.sh

wget_path="$XDG_CACHE_HOME/wget"

function install_wget() {
    sudo apt-get -qq install -y wget
}

function setup_wget() {
    mkdir_with_check $wget_path
}

log $0 install_wget
log $0 setup_wget

