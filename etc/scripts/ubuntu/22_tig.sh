#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.sh

tig_ghq_url='jonas/tig'
tig_ghq_path="$GHQ_ROOT/github.com/$tig_ghq_url"
tig_prefix='/usr/local'

function install_tig() {
    ghq get $tig_ghq_url

    cd $tig_ghq_path
    sudo apt-get -qq install -y xmlto
    sudo make prefix=$tig_prefix
    sudo make install prefix=$tig_prefix

    sudo apt-get -qq install -y asciidoc
    sudo make install-doc prefix=$tig_prefix

    sudo git clean -dfx
}

log $0 install_tig

