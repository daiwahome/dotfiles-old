# WSL
export TERM=xterm-256color
export EDITOR=vim
umask 022
export DISPLAY=:0.0

# Alias
alias ls="ls -hF --color=auto"
alias ll="ls -l"
alias la="ls -A"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
