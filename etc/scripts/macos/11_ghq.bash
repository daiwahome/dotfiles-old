#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.bash

ghq_url='github.com/motemen/ghq'

function install_ghq() {
    go get $ghq_url
}

log $0 install_ghq

