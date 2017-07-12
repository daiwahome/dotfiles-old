#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.sh

function install_git_flow() {
    sudo apt-get -qq install -y git-flow
}

log $0 install_git_flow

