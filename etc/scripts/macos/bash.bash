#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.bash

bash_path="$XDG_DATA_HOME/bash"

function setup_bash() {
    mkdir_with_check $bash_path
}

log $0 setup_bash

