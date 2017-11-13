#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.sh

rust_url='https://sh.rustup.rs'

function install_rust() {
    curl $rust_url -sSf | sh -s -- -y
}

function setup_rust() {
    $HOME/.cargo/bin/cargo install racer
    ghq get -shallow rust-lang/rust
}

log $0 install_rust
log $0 setup_rust

