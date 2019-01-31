#!/usr/bin/env zsh

source $HOME/.dotfiles/lib/git.sh

# Outputs current branch info in prompt format
function _git_prompt_info() {
  local ref _PROMPT

  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
  fi
}

function _current_prompt_info()
{
  echo $ZSH_THEME_GIT_PROMPT_PREFIX'%10c'$ZSH_THEME_GIT_PROMPT_SUFFIX
}

PROMPT='$(_current_prompt_info)$(_git_current_branch)$(_git_current_status)$(_git_current_sha)$(_git_time_since_commit)'
# PROMPT='%B%F{magenta}%10c%f%{$reset_color%}$(_git_prompt_info)
# $ '
# RPROMPT='$(git_prompt_info) %F{blue}] %F{green}%D{%L:%M} %F{yellow}%D{%p}%f'
# !

ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}●%f"
ZSH_THEME_GIT_PROMPT_DIRTY_UNPUSHED="%F{yellow}●%f"
ZSH_THEME_GIT_PROMPT_DIRTY_UNPULLED="%F{yellow}●%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}●%f"
ZSH_THEME_GIT_PROMPT_CLEAN_UNPUSHED="%F{yellow}○%f"
ZSH_THEME_GIT_PROMPT_CLEAN_UNPULLED="%F{yellow}○%f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{blue}?%f"
ZSH_THEME_GIT_PROMPT_ADDED="%F{green}+%f"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{green}+%f"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{blue}»%f"
ZSH_THEME_GIT_PROMPT_DELETED="%F{red}-%f"
ZSH_THEME_GIT_PROMPT_STASHED="%F{blue}$%f"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{blue}=%f"
ZSH_THEME_GIT_PROMPT_AHEAD_PREFIX=""
ZSH_THEME_GIT_PROMPT_AHEAD_SUFFIX=""
ZSH_THEME_GIT_PROMPT_AHEAD="%F{cyan}⇡%f"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%F{cyan}⇡%f"
ZSH_THEME_GIT_PROMPT_BEHIND_PREFIX=""
ZSH_THEME_GIT_PROMPT_BEHIND_SUFFIX=""
ZSH_THEME_GIT_PROMPT_BEHIND="%F{cyan}⇣%f"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%F{cyan}⇣%f"
ZSH_THEME_GIT_PROMPT_DIVERGED_PREFIX=""
ZSH_THEME_GIT_PROMPT_DIVERGED_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIVERGED=":" # default "⇕"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE=""
ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{magenta}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX_BRANCH=" on %B%F{green}"
ZSH_THEME_GIT_PROMPT_SUFFIX_BRANCH="%f%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CURRENT_BRANCH=""
ZSH_THEME_GIT_PROMPT_CURRENT_STATUS_BEFORE=""
ZSH_THEME_GIT_PROMPT_CURRENT_STATUS_AFTER=""
ZSH_THEME_GIT_PROMPT_CURRENT_STATUS=""
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" "
ZSH_THEME_GIT_PROMPT_SHA_AFTER=""
ZSH_THEME_GIT_PROMPT_SHA=""
ZSH_THEME_GIT_PROMPT_TIME_SINCE_COMMIT_BEFORE=""
ZSH_THEME_GIT_PROMPT_TIME_SINCE_COMMIT_AFTER=""
ZSH_THEME_GIT_PROMPT_TIME_SINCE_COMMIT=""
