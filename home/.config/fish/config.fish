# Functions
function is_wsl
    set -l exp 'Microsoft'
    grep -q $exp /proc/version; or grep -q $exp /proc/sys/kernel/osrelease
end

# Common
## XDG Base Directory Specification
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
#set -x XDG_RUNTIME_DIR "/run/user/$USER"
## misc.
set -x EDITOR vim
umask 022
if test -z "$TMUX"
    set -x TERM xterm-256color
end

# Commands
## bash
set -x HISTFILE "$XDG_DATA_HOME/bash/bash_history"
## ls
alias ls="ls -hF --color=auto"
alias la="ls -A"
alias ll="ls -lA"
## less
#set -x LESSKEY "$XDG_CONFIG_HOME/less/lesskey"
set -x LESSHISFILE "$XDG_CACHE_HOME/less/lesshst"
# tig
alias tig='tig --all'
set -x TIGRC_USER "$XDG_CONFIG_HOME/tig/tigrc"
## wget
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget/wget-hsts"'
#set -x WGETRC "$XDG_CONFIG_HOME/wget/wgetrc"

# Python
## python
set -x PYTHONSTARTUP "$XDG_CONFIG_HOME/python/pythonstartup"
## venv
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -x WORKON_HOME "$HOME/.virtualenvs"
## jupyter
set -x IPYTHONDIR "$XDG_CONFIG_HOME/ipython"
set -x JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME/jupyter"
## pylint
set -x PYLINTHOME "$XDG_CACHE_HOME/pylint"
## pyenv
set -x PYENV_ROOT "$XDG_DATA_HOME/pyenv"
set -x PATH $PATH "$PYENV_ROOT/bin"
. (pyenv init - | psub)

# Golang
## go
set -x GOPATH "$XDG_DATA_HOME/go"
set -x PATH $PATH "$GOPATH/bin"
## ghq
set -x GHQ_ROOT "$XDG_DATA_HOME/ghq"

# WSL
if is_wsl
    set -x DISPLAY :0.0
    set -x BROWSER chrome.exe
    alias open=wsl-open
end
