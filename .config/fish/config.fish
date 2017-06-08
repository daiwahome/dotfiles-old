# WSL
set -x DISPLAY :0.0
set -x EDITOR vim
set -x TERM xterm-256color
umask 022

# Alias
alias ls="ls -hF --color=auto"
alias la="ls -A"
alias ll="ls -l"
alias open=wsl-open

# pyenv
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PATH $PYENV_ROOT/bin
. (pyenv init - | psub)

# python
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -x WORKON_HOME "$HOME/.virtualenvs"

# go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
