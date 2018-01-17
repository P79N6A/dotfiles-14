#!/bin/bash

reload_shell() {
  clear; exec $SHELL -l;
  load_sources
}

load_sources() {
  test -e "$HOME/.iterm2_shell_integration.bash" && source "$HOME/.iterm2_shell_integration.bash"

  source "$DOTFILES/colors"
  source "$DOTFILES/functions"
  source "$DOTFILES/alias"

  if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="$(brew --prefix)/opt/bash-git-prompt/share"

    # Set config variables first
    export GIT_PROMPT_ONLY_IN_REPO=0
    # uncomment to avoid fetching remote status
    export GIT_PROMPT_FETCH_REMOTE_STATUS=0
    # uncomment to avoid searching for changed files in submodules
    export GIT_PROMPT_IGNORE=1
    export GIT_PROMPT_IGNORE_SUBMODULES=1
    # uncomment to show upstream tracking branch
    # export GIT_PROMPT_SHOW_UPSTREAM=0
    # can be no, normal or all; determines counting of untracked files
    export GIT_PROMPT_SHOW_UNTRACKED_FILES='no'
    # uncomment to avoid printing the number of changed files
    export GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=1
    # uncomment to support Git older than 1.7.10
    # export GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh
    # uncomment for custom prompt start sequence
    # export GIT_PROMPT_START="branch:"
    # uncomment for custom prompt end sequence
    # export GIT_PROMPT_END=...
    # use theme optimized for solarized color scheme
    export GIT_PROMPT_THEME='Custom'
    export GIT_PROMPT_THEME_FILE="$HOME/.dotfiles/git-prompt-colors"
    # export GIT_PROMPT_START_USER="\w [branch status]"
    # export GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${Yellow}\w${ResetColor}"
    # export GIT_PROMPT_END_USER="\n$ "
    # export GIT_PROMPT_START_ROOT="_LAST_COMMAND_INDICATOR_ ${GIT_PROMPT_START_USER}"
    # export GIT_PROMPT_END_ROOT="ENDROOT"
    # export GIT_PROMPT_COMMAND_OK="${Green} "
    # export GIT_PROMPT_COMMAND_FAIL="${Red}✘-_LAST_COMMAND_STATE_ " # displays as ✘-1 for exit code 1
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
  fi
}

load_sources
