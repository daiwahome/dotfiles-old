# Functions
function is_wsl
    set -l exp 'Microsoft'
    grep -q $exp /proc/version; or grep -q $exp /proc/sys/kernel/osrelease
end

# Common
set -x EDITOR vim
set -x TERM xterm-256color
umask 022

# Alias
alias ls="ls -hF --color=auto"
alias la="ls -A"
alias ll="ls -lA"

# Python
## pyenv
set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH $PATH "$PYENV_ROOT/bin"
. (pyenv init - | psub)

## venv
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -x WORKON_HOME "$HOME/.virtualenvs"

# Golang
set -x GOPATH "$HOME/go"
set -x PATH $PATH "$GOPATH/bin"

# WSL
if is_wsl
    set -x DISPLAY :0.0
    set -x BROWSER chrome.exe
    alias open=wsl-open
end
