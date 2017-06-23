# function
function is_wsl() {
    local exp='Microsoft'
    grep -q $exp /proc/version || grep -q $exp /proc/sys/kernel/osrelease
}

# Common
## XDG Base Directory Specification
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
## misc.
export EDITOR=vim
umask 022
if [[ $- == *i* && -z "$TMUX" ]]; then
    export TERM=xterm-256color
fi

# Commands
## ls
alias ls="ls -hF --color=auto"
alias la="ls -A"
alias ll="ls -lA"

# WSL
if $(is_wsl); then
    export DISPLAY=:0.0

    ## run tmux
    if [[ $- == *i* && -z "$TMUX" ]]; then
        exec tmux
    fi
fi
