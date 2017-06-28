#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ./common.sh

# Create XDG BASE Directories
function create_xdg_base_directories() {
    mkdir_with_check $XDG_CACHE_HOME
    mkdir_with_check $XDG_CONFIG_HOME
    mkdir_with_check $XDG_DATA_HOME
}

# initialize by each platform scripts
function initialize() {
    local os=$(get_os)

    if [ -z $os ]; then
        echo 'Cannot detect OS' >&2
        exit 1
    fi

    # Disable the warning when executing `apt-get install`
    if [ $os == ubuntu ]; then
        export DEBIAN_FRONTEND=noninteractive
    fi

    for script in $scripts/$os/*.sh; do
        bash $script
    done
}

create_xdg_base_directories
initialize

