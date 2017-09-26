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
export HISTCONTROL='ignoreboth';
export HISTFILE="$__DOTFILES_PATH/bash_history";
export HISTSIZE="1000";

## Set up all common paths
export PATH="$__DOTFILES_PATH:$__DOTFILES_PATH/bin:$__COMPOSER_BIN_PATH:$__GEM_PATH:$__OTHERS_PATH:$PATH";

## Load the shell dotfiles, and then some:
# vimrc,bash_colors,bash_options,bash_prompt,functions,alias,bashrc,exrc,bash_autocomplete
sources=("options colors prompt alias functions");
for file in $sources; do
  file="$__LIB_PATH/$file";

  if [[ -r "$file" && -f "$file" ]]; then
    source "$file";
  fi
done
unset file;
