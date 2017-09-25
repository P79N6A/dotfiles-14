#!/bin/bash

test -e "$HOME/.iterm2_shell_integration.bash"; source "$HOME/.iterm2_shell_integration.bash";


export __DOTFILES_PATH="$HOME/.dotfiles";
export __COMPOSER_BIN_PATH="$HOME/.composer/vendor/bin";
export __OTHERS_PATH="/usr/local/Cellar:/usr/local/sbin";
export __GEM_PATH="$HOME/.gem";
export GEM_HOME=$"__GEM_PATH";

# Set up all common paths
export PATH="$__DOTFILES_PATH:$__COMPOSER_BIN_PATH:$__GEM_PATH:$__OTHERS_PATH:$PATH";


# Highlight the user name when logged in as root.
export __USER_LEVEL="normal";
if [[ "${USER}" == "root" ]]; then
  __USER_LEVEL="root";
fi


# Highlight the hostname when connected via SSH.
export __SSH="";
if [[ "${SSH_TTY}" ]]; then
  __SSH="1";
fi

# Load the shell dotfiles, and then some:
for file in $__DOTFILES_PATH/{vimrc,bash_colors,bash_options,bash_prompt,functions,alias,bashrc,exrc,bash_autocomplete}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
