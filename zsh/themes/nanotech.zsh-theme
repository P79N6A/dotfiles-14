#!/usr/bin/env zsh

function _git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0

    if [[ $(_git_commits_ahead) > 0 || $(_git_commits_behind) > 0 ]]; then
      ZSH_THEME_GIT_PROMPT_CLEAN=" %F{yellow}○%f"
    fi

    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(_git_current_branch)$(_parse_git_dirty)$(_git_prompt_status)$ZSH_THEME_GIT_PROMPT_SUFFIX"

    echo "${IS_UNTRACKED}"
    echo "${IS_ADDED}"
    echo "${IS_MODIFIED}"
    echo "${IS_RENAMED}"
    echo "${IS_DELETED}"
    echo "${IS_STASHED}"
    echo "${IS_UNMERGED}"
    echo "${IS_AHEAD}"
    echo "${IS_BEHIND}"
    echo "${IS_DIVERGED}"
  fi
}

PROMPT='%F{green}λ%f %F{yellow}%10c%f $(_git_prompt_info) %D{%L:%M} %D{%p}
$ '
# RPROMPT='$(git_prompt_info) %F{blue}] %F{green}%D{%L:%M} %F{yellow}%D{%p}%f'

ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}●%f"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green}•%f"
ZSH_THEME_GIT_PROMPT_ADDED="" # default "+"
ZSH_THEME_GIT_PROMPT_MODIFIED="" # default "+"
ZSH_THEME_GIT_PROMPT_RENAMED="" # default "»"
ZSH_THEME_GIT_PROMPT_DELETED="" # default "-"
ZSH_THEME_GIT_PROMPT_STASHED="" # default "$"
ZSH_THEME_GIT_PROMPT_UNMERGED="" # default "="
ZSH_THEME_GIT_PROMPT_DIVERGED="" # default "⇕"
ZSH_THEME_GIT_PROMPT_UNSTAGED="xxx" # default "?"
ZSH_THEME_GIT_PROMPT_UNTRACKED="" # default "?"
ZSH_THEME_GIT_PROMPT_PREFIX_BRANCH="%F{black}"
ZSH_THEME_GIT_PROMPT_SUFFIX_BRANCH="%f"
ZSH_THEME_GIT_PROMPT_CURRENT_BRANCH=""
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE=""
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=""
ZSH_THEME_GIT_PROMPT_SHA_AFTER=""
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_AHEAD=""
ZSH_THEME_GIT_PROMPT_BEHIND=""
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX=""
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX=""
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%F{cyan}⇡%f"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%F{cyan}⇣%f"
