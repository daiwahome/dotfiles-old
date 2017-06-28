#!/usr/bin/env bash
set -eu

# Export environment variables to install
function export_env() {
    # XDG Base Directory Specification
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_DATA_HOME="$HOME/.local/share"

    # golang
    export GOPATH="$XDG_DATA_HOME/go"
    export PATH="$GOPATH/bin:$PATH"

    # ghq
    export GHQ_ROOT="$XDG_DATA_HOME/ghq"

    # pyenv
    export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"

    # venv
    export WORKON_HOME="$HOME/.virtualenvs"
}

export_env

# Constant
os_list=(ubuntu)
home="$DOTPATH/home"
config='.config'
scripts="$DOTPATH/etc/scripts"
log_dir="$DOTPATH/log"

# Custom paths
custom=('.tigrc' '.pythonstartup')
custom_tigrc=("$XDG_CONFIG_HOME/tig" "$home/.tigrc")
custom_pythonstartup=("$XDG_CONFIG_HOME/python" "$home/.pythonstartup")

# Return 0 if an array contains the element
function contains() {
    local target="$1"
    local array="${@:2}"
    local element

    for element in ${array[@]}; do
        if [ $element == $target ]; then
            return 0
        fi
    done

    return 1
}

# Return the path is trimed parent path
function trim_parentpath() {
    local path="$1"
    local parent="$2"

    echo "${path##*$parent/}"
}

# Return the path is trimed child path
function trim_childpath() {
    local path="$1"
    local child="$2"

    echo "${path%%/$child*}"
}

# Make directory if it is not exsits
function mkdir_with_check() {
    local path="$1"

    if [ ! -d $path ]; then
        mkdir -p $path
    fi
}

# Return 0 if OS is Ubuntu
function is_ubuntu() {
    if [[ -f /etc/os-release && \
          $(awk -F= '/^ID=/{print $2}' /etc/os-release) == ubuntu ]]; then
        return 0
    fi

    return 1
}

# Get OS name
function get_os() {
    local os
    local result

    for os in ${os_list[@]}; do
        if is_$os; then
            result=$os
            break
        fi
    done

    echo "$result"
}

# Log the output of a callback
function log() {
    local name="$(basename $1)"
    local callback="${@:2}"
    local log_path="$log_dir/${name%.sh}.log"

    echo '#--------------------' >> $log_path
    #echo "$callback" >> $log_path
    echo "$callback" | tee -a $log_path
    $callback >> $log_path 2>&1
    echo >> $log_path
}

# Call the callback for $HOME
function do_home() {
    local callback="$@"
    local targets=$(find $home -type f)
    local target

    for target in $targets; do
        local name=$(trim_parentpath $target $home)

        if [ $(trim_childpath $name '') == $config ] \
            || contains $name ${custom[@]}; then
            continue
        fi

        $callback $HOME $target $name
    done
}

# Call the callback for $XDG_CONFIG_HOME
function do_xdg_config_home() {
    local callback="$@"
    local targets=$(find $home/$config -type f)
    local target

    for target in $targets; do
        local dir=$(dirname $(trim_parentpath $target $home/$config))
        local path=$XDG_CONFIG_HOME/$dir
        local name=$(basename $target)

        $callback $path $target $name
    done
}

# Call the callback for custom path
function do_custom_path() {
    local callback="$@"
    local dotfile

    for dotfile in ${custom[@]}; do
        local file="${dotfile#.}"

        eval $callback \${custom_$file[@]} $file
    done
}

