#!/usr/bin/env zsh

function _git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0

    if [[ $(_git_commits_ahead) > 0 || $(_git_commits_behind) > 0 ]]; then
      ZSH_THEME_GIT_PROMPT_CLEAN=" %F{yellow}○%f"
    fi

    local STATUS"$(_git_prompt_status)"

    IS_UNTRACKED="$(echo $STATUS | grep -E /^UNTRACKED/i -io)"
    echo "${IS_UNTRACKED}"
    IS_ADDED="$(echo $STATUS | grep -E /^ADDED/i -io)"
    echo "${IS_ADDED}"
    IS_MODIFIED="$(echo $STATUS | grep -E /^MODIFIED/i -io)"
    echo "${IS_MODIFIED}"
    IS_RENAMED="$(echo $STATUS | grep -E /^RENAMED/i -io)"
    echo "${IS_RENAMED}"
    IS_DELETED="$(echo $STATUS | grep -E /^DELETED/i -io)"
    echo "${IS_DELETED}"
    IS_STASHED="$(echo $STATUS | grep -E /^STASHED/i -io)"
    echo "${IS_STASHED}"
    IS_UNMERGED="$(echo $STATUS | grep -E /^UNMERGED/i -io)"
    echo "${IS_UNMERGED}"
    IS_AHEAD="$(echo $STATUS | grep -E /^AHEAD/i -io)"
    echo "${IS_AHEAD}"
    IS_BEHIND="$(echo $STATUS | grep -E /^BEHIND/i -io)"
    echo "${IS_BEHIND}"
    IS_DIVERGED="$(echo $STATUS | grep -E /^DIVERGED/i -io)"
    echo "${IS_DIVERGED}"

    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(_git_current_branch)$(_parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"

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
