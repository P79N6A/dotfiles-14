#!/bin/bash

reload_shell() {
  clear; exec $SHELL -l;
  load_sources
}

load_sources() {
  source "$DOTFILES/lib/colors.sh"
  source "$DOTFILES/lib/functions.sh"
  source "$DOTFILES/lib/alias.sh"
}

load_sources
