# function
function is_wsl() {
    local exp='Microsoft'
    grep -q $exp /proc/version || grep -q $exp /proc/sys/kernel/osrelease
}

# Common
export EDITOR=vim
export TERM=xterm-256color
umask 022

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
