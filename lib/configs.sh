#!/bin/bash


# Load core functions file
source "$DOTFILES_PATH/lib/functions.sh"

# Load old files
source "$DOTFILES_PATH/alias"
source "$DOTFILES_PATH/functions"

# Shell configurations
set_gem_home
create_global_git_files
