#!/bin/bash

export MAILCHECK=-1
export TERM='xterm-256color'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS='ExFxCxDxBxegedabagacad'
export HISTCONTROL='ignoreboth:erasedups'
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=1000
export PYTHONIOENCODING='UTF-8'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export MANPAGER='less -X'
export GPG_TTY=$(tty);
export EDITOR='Atom'
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

export DOTFILES="$HOME/.dotfiles"
export BREW_PREFIX="$(brew --prefix)"
export BREW_PATH="/usr/local/Cellar"
export BREWGEM="/usr/local/lib/ruby/gems/2.5.0"
export BREWGEMBIN="/usr/local/lib/ruby/gems/2.3.0/bin"
_PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
_PATH="$DOTFILES/bin:$_PATH"
# _PATH="$BREW_PATH:$_PATH"
export PATH="$_PATH"
export PROMPT_COMMAND="gp_install_prompt"
# export PROMPT_COMMAND="check_git"

source "$HOME/.bashrc"
