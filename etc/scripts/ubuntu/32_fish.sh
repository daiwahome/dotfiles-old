#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.sh

fish_path="$XDG_CONFIG_HOME/fish"

fisherman_url='https://git.io/fisher'
fisherman_path="$fish_path/functions/fisher.fish"

function install_fish() {
    sudo add-apt-repository -y ppa:fish-shell/release-2
    sudo apt-get -qq update

    sudo apt-get -qq install -y fish
}

function setup_fish() {
    mkdir_with_check $fish_path
}

function install_fisherman() {
    curl -Lo $fisherman_path --create-dirs $fisherman_url
}

function setup_fisherman() {
    fish -c 'fisher'
}

log $0 install_fish
log $0 setup_fish
log $0 install_fisherman
log $0 setup_fisherman

