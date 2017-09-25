#!/bin/bash

## iTerm2 script
test -e "${HOME}/.iterm2_shell_integration.bash";
source "${HOME}/.iterm2_shell_integration.bash";

## Setup common variables
export __DOTFILES_PATH="${HOME}/.dotfiles:${HOME}/.dotfiles/bin";
export __LIB_PATH="${HOME}/.dotfiles/lib";
export __COMPOSER_BIN_PATH="${HOME}/.composer/vendor/bin";
export __OTHERS_PATH="/usr/local/Cellar:/usr/local/sbin";
export __GEM_PATH="${HOME}/.gem";
export GEM_HOME=$"__GEM_PATH";

## Set up all common paths
export PATH="${__DOTFILES_PATH}:${__COMPOSER_BIN_PATH}:${__GEM_PATH}:${__OTHERS_PATH}:${PATH}";

## Highlight the user name when logged in as root.
export __USER_LEVEL="normal";
[[ "${USER}" == "root" ]] && __USER_LEVEL="root";

## Highlight the hostname when connected via SSH.
export __SSH="";
[[ "${SSH_TTY}" ]] && __SSH="1";

## Load the shell dotfiles, and then some:
# vimrc,bash_colors,bash_options,bash_prompt,functions,alias,bashrc,exrc,bash_autocomplete
source_files=("bash_options");

# for file in $__DOTFILES_PATH/{vimrc,bash_colors,bash_options,bash_prompt,functions,alias,bashrc,exrc,bash_autocomplete}; do
#   [ -r "$file" ] && [ -f "$file" ] && source "$file";
# done;
# unset file;
