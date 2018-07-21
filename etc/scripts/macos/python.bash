#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.bash

python_path="$XDG_DATA_HOME/python"
python_version=3.6.1

function setup_python() {
    mkdir_with_check $python_path
}

function install_pyenv() {
    brew install pyenv >/dev/null
}

function setup_pyenv() {
    eval "$(pyenv init -)"

    pyenv install -s $python_version
    pyenv global $python_version
}

function setup_venv() {
    mkdir_with_check $WORKON_HOME
}

function setup_venv_for_nvim() {
    local venv_path="$WORKON_HOME/nvim"

    python -m venv $venv_path

    set +u
    source $venv_path/bin/activate
    pip install pylint mypy jedi neovim
    deactivate
    set -u
}

log $0 setup_python
log $0 install_pyenv
log $0 setup_pyenv
log $0 setup_venv
log $0 setup_venv_for_nvim

