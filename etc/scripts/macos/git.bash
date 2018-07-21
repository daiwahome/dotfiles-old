#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.bash

function install_git_flow() {
    brew install git-flow >/dev/null
}

log $0 install_git_flow

