# dotfiles
My dotfiles.

## Requirement
`bash` and `git`.

## Installation
Start to install with `wget`:
```
$ bash -c "$(wget -qO - https://git.io/dot.daiwahome)"
```
and initialize settings as follows:
```
$ chsh -s /usr/bin/fish
$ nvim -c ":PlugInstall | q | q"
```
If you want to use the plugins for `tmux`, hit `<C-j>I` after executing:
```
$ tmux
```

## Usage
Manage the dotfiles by `make`:
```
$ make
clean-log                      Remove log files
clean                          Remove symbolic links
deploy                         Make symbolic links
help                           Show help
initialize                     Install and setup tools
list                           List dotfiles
update                         Update this repository
```

## Link
- [tig](https://github.com/jonas/tig)
- [tmux](https://github.com/tmux/tmux)
- [tpm](https://github.com/tmux-plugins/tpm)
- [fish](https://github.com/fish-shell/fish-shell)
- [fisherman](https://github.com/fisherman/fisherman)
- [neovim](https://github.com/neovim/neovim)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [pyenv](https://github.com/pyenv/pyenv)

