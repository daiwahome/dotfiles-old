#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.sh

function install_golang() {
    sudo add-apt-repository -y ppa:longsleep/golang-backports
    sudo apt-get -qq update

    sudo apt-get -qq install -y golang-go
}

log $0 install_golang

