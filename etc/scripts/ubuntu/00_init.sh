#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.sh

function install_init() {
    sudo apt-get -qq update

    # For add-apt-repository
    sudo apt-get -qq install -y software-properties-common

    # Disable errors when installing
    sudo apt-get -qq install -y apt-utils dialog

    # Building
    sudo apt-get -qq install -y build-essential pkg-config automake

    # Misc.
    sudo apt-get -qq install -y curl
}

log $0 install_init
