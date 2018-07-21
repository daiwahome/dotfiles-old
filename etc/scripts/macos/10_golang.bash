#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.bash

function install_golang() {
    brew install go >/dev/null
}

log $0 install_golang

