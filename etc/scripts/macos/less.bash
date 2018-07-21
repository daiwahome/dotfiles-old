#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.bash

less_path="$XDG_CACHE_HOME/less"

function setup_less() {
    mkdir_with_check $less_path
}

log $0 setup_less

