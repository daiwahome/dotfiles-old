#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ./common.sh

# List dotfiles
function list_dotfiles() {
    local targets=$(find $home -type f)
    local target

    for target in $targets; do
        local name=$(trim_parentpath $target $home)

        echo $name
    done
}

list_dotfiles

