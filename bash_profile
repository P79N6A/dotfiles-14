#!/bin/bash

## iTerm2 script
test -e "$HOME/.iterm2_shell_integration.bash";
source "$HOME/.iterm2_shell_integration.bash";

## Setup common variables
export __DOTFILES_PATH="$HOME/.dotfiles";
export __LIB_PATH="$__DOTFILES_PATH/lib";
export __COMPOSER_BIN_PATH="$HOME/.composer/vendor/bin";
export __CELLAR_PATH="/usr/local/Cellar";
export __OTHERS_PATH="$__CELLAR_PATH:/usr/local/sbin";
export __GEM_PATH="$HOME/.gem";
export GEM_HOME="$__GEM_PATH";

## Change default settings
export TERM="xterm-256color"
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export CLICOLOR="1"
export LSCOLORS="ExFxCxDxBxegedabagacad"
export HISTCONTROL='ignoreboth';
export HISTFILE="$__DOTFILES_PATH/bash_history";
export HISTSIZE="1000";

export NODE_REPL_HISTORY="$HOME/.node_history";
export NODE_REPL_HISTORY_SIZE="32768";
export NODE_REPL_MODE="sloppy";
export PYTHONIOENCODING="UTF-8";
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';
export MANPAGER='less -X';
export GPG_TTY=$(tty);

export EDITOR="Atom";

## Set up all common paths
export PATH="$__DOTFILES_PATH:$__DOTFILES_PATH/bin:$__COMPOSER_BIN_PATH:$__GEM_PATH:$__OTHERS_PATH:$PATH";

## Load the shell dotfiles, and then some:
source "${HOME}/.profile";
source "${HOME}/.bashrc";
source "${HOME}/.exrc";
source "${HOME}/.vimrc";
source "${__LIB_PATH}/options";
source "${__LIB_PATH}/colors";
source "${__LIB_PATH}/functions";
source "${__LIB_PATH}/prompt";
source "${__LIB_PATH}/alias";
