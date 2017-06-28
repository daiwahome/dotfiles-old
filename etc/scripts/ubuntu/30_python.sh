#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ../common.sh

python_path="$XDG_DATA_HOME/python"
python_version=3.6.1

pyenv_ghq_url='pyenv/pyenv'
pyenv_ghq_path="$GHQ_ROOT/github.com/$pyenv_ghq_url"
pyenv_dir="$(trim_childpath $PYENV_ROOT pyenv)"

venv_name='nvim'
venv_path="$WORKON_HOME/$venv_name"

function setup_python() {
    mkdir_with_check $python_path
}

function install_pyenv() {
    ghq get $pyenv_ghq_url
    ln -fsv $pyenv_ghq_path $pyenv_dir
}

function setup_pyenv() {
    eval "$(pyenv init -)"

    sudo apt-get -qq install -y xz-utils tk-dev llvm libreadline-dev \
        libssl-dev zlib1g-dev libbz2-dev libsqlite3-dev libncurses5-dev \
        libncursesw5-dev
    pyenv install -s $python_version
    pyenv global $python_version
}

function setup_venv() {
    mkdir_with_check $WORKON_HOME

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

