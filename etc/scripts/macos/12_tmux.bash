#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.bash

tpm_ghq_url='tmux-plugins/tpm'
tpm_ghq_path="$GHQ_ROOT/github.com/$tpm_ghq_url"
tpm_dir="$XDG_CONFIG_HOME/tmux/plugins"

function install_tmux() {
    brew install tmux >/dev/null
}

function install_tpm() {
    ghq get $tpm_ghq_url

    mkdir_with_check $tpm_dir
    ln -fsv "$tpm_ghq_path/" $tpm_dir
}

log $0 install_tmux
log $0 install_tpm

