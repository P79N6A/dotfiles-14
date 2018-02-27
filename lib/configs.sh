#!/bin/bash


# Load core functions file
source $HOME/.dotfiles/lib/functions.sh

source_reload

# Load old files
source $HOME/.dotfiles/alias
source $HOME/.dotfiles/functions

load_additional_files

# Shell configurations
xcode_select_install
# set_gem_home
create_global_git_files
# set_prompt
