# WSL
export DISPLAY=:0.0
export EDITOR=vim
export TERM=xterm-256color
umask 022

# Alias
alias ls="ls -hF --color=auto"
alias la="ls -A"
alias ll="ls -l"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
