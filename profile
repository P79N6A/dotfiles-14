#!/bin/bash

## Setup common variables
export DOTFILES_PATH="$HOME/.dotfiles";
export DOTFILES_LIB="$DOTFILES_PATH/lib";
export DOTFILES_BIN="$DOTFILES_PATH/bin";
export COMPOSER_PATH="$HOME/.composer/vendor/bin";
export CELLAR_PATH="/usr/local/Cellar";
export MODULES_PATH="/usr/local/lib/node_modules";
export GEM_HOME="$HOME/.gem";

## Change default settings
export TERM="xterm-256color"
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export CLICOLOR="1"
export LSCOLORS="ExFxCxDxBxegedabagacad"
export HISTCONTROL='ignoreboth';
export HISTFILE="$DOTFILES_PATH/bash_history";
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
PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin";
PATH="$(brew --prefix homebrew/php/php70)/bin:$DOTFILES_PATH:$MODULES_PATH:$DOTFILES_PATH/bin:$COMPOSER_PATH:$GEM_HOME:$__OTHERS_PATH:$PATH";
export PATH

## Load the shell dotfiles, and then some:
source "$HOME/.bashrc";
source "$HOME/.exrc";
source "$HOME/.npmrc";
source "$HOME/.vimrc";
# source "$HOME/.yarnrc";
source "$DOTFILES_LIB/options";
source "$DOTFILES_LIB/colors";
source "$DOTFILES_LIB/functions";
source "$DOTFILES_LIB/prompt";
source "$DOTFILES_LIB/alias";
