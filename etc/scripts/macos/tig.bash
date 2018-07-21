#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.bash

function install_tig() {
    brew install tig >/dev/null
}

log $0 install_tig

