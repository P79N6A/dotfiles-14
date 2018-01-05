#!/bin/bash


# Load core functions file
source "$DOTFILES_PATH/lib/functions.sh"

source_reload

# Load old files
source "$DOTFILES_PATH/alias"
source "$DOTFILES_PATH/functions"

load_additional_files

# Shell configurations
xcode_select_install
# set_gem_home
create_global_git_files
set_prompt
