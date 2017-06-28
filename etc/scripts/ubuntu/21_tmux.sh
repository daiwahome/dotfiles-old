#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.sh

tmux_ghq_url='tmux/tmux'
tmux_ghq_path="$GHQ_ROOT/github.com/$tmux_ghq_url"

tpm_ghq_url='tmux-plugins/tpm'
tpm_ghq_path="$GHQ_ROOT/github.com/$tpm_ghq_url"
tpm_ghq_dir="$(trim_childpath $tpm_ghq_path tpm)"

tpm_dir="$XDG_CONFIG_HOME/tmux/plugins"
tpm_path="$tpm_dir/tpm"

function install_tmux() {
    ghq get $tmux_ghq_url

    cd $tmux_ghq_path
    sudo apt-get -qq install -y libevent-dev libncurses-dev

    sh autogen.sh
    ./configure
    make
    sudo make install

    git clean -dfx
}

function install_tpm() {
    ghq get $tpm_ghq_url

    mkdir_with_check $tpm_dir
    ln -fsv $tpm_ghq_path $tpm_path
}

log $0 install_tmux
log $0 install_tpm

