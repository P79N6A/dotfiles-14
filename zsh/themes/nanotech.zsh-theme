#!/usr/bin/env zsh

source $HOME/.dotfiles/lib/git.sh

# Outputs current branch info in prompt format
function _git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0

    local STATUS=$(_git_prompt_status)

    IS_UNTRACKED="$(echo ${STATUS} | grep -E 'UNTRACKED' -io)"
    IS_ADDED="$(echo ${STATUS} | grep -E 'ADDED' -io)"
    IS_MODIFIED="$(echo ${STATUS} | grep -E 'MODIFIED' -io)"
    IS_RENAMED="$(echo ${STATUS} | grep -E 'RENAMED' -io)"
    IS_DELETED="$(echo ${STATUS} | grep -E 'DELETED' -io)"
    IS_STASHED="$(echo ${STATUS} | grep -E 'STASHED' -io)"
    IS_UNMERGED="$(echo ${STATUS} | grep -E 'UNMERGED' -io)"
    IS_AHEAD="$(echo ${STATUS} | grep -E 'AHEAD' -io)"
    IS_BEHIND="$(echo ${STATUS} | grep -E 'BEHIND' -io)"
    IS_DIVERGED="$(echo ${STATUS} | grep -E 'DIVERGED' -io)"

    local STATUS=$(_parse_git_dirty)

    [[ -n $IS_UNTRACKED ]]; STATUS='DIRTY'

    if [[ -z $STATUS || $STATUS == '' ]]; then
      IS_DIRTY=""
      IS_CLEAN=""
    elif [[ $STATUS == 'DIRTY' ]]; then
      IS_DIRTY="DIRTY"
      IS_CLEAN=""
    elif [[ $STATUS == 'CLEAN' ]]; then
      IS_DIRTY=""
      IS_CLEAN="CLEAN"
    else
      IS_DIRTY=""
      IS_CLEAN=""
    fi

    # IS_CLEAN=''
    # IS_DIRTY=$(_parse_git_dirty)
    # IS_DIRTY="$(echo ${IS_DIRTY} | grep -E 'DIRTY' -io)"
    # if [[ -z $IS_DIRTY ]]; then
    #   IS_CLEAN='CLEAN'
    # fi
    # [[ -n IS_MODIFIED || -n IS_RENAMED || -n IS_DELETED ]]; IS_DIRTY='DIRTY'


    # if [[ $(_git_commits_ahead) > 0 || $(_git_commits_behind) > 0 ]]; then
    #   ZSH_THEME_GIT_PROMPT_CLEAN=" %F{yellow}○%f"
    # fi

    GIT_CURRENT_BRANCH="${ZSH_THEME_GIT_PROMPT_PREFIX_BRANCH}$(_git_current_branch)${ZSH_THEME_GIT_PROMPT_SUFFIX_BRANCH}"
    GIT_CURRENT_STATUS=""

    echo "{${IS_CLEAN}:${IS_DIRTY}:${IS_UNTRACKED}:${IS_ADDED}:${IS_MODIFIED}:${IS_RENAMED}:${IS_DELETED}:${IS_STASHED}:${IS_UNMERGED}:${IS_AHEAD}:${IS_BEHIND}:${IS_DIVERGED}}"

    # echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${GIT_CURRENT_BRANCH}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
    # echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(_git_current_branch)$ZSH_THEME_GIT_PROMPT_CLEAN$(_parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"

    local PROMPT="%F{green}λ%f %F{yellow}%10c%f ${GIT_CURRENT_BRANCH}${GIT_CURRENT_STATUS} [%D{%L:%M} %D{%p}]
$ "

    echo $PROMPT

  fi
}

PROMPT='$(_git_prompt_info)'
# RPROMPT='$(git_prompt_info) %F{blue}] %F{green}%D{%L:%M} %F{yellow}%D{%p}%f'

IS_DIRTY=''
IS_CLEAN=''
IS_UNTRACKED=''
IS_ADDED=''
IS_MODIFIED=''
IS_RENAMED=''
IS_DELETED=''
IS_STASHED=''
IS_UNMERGED=''
IS_AHEAD=''
IS_BEHIND=''
IS_DIVERGED=''

ZSH_THEME_GIT_PROMPT_DIRTY=".DIRTY."
ZSH_THEME_GIT_PROMPT_CLEAN=".CLEAN."
ZSH_THEME_GIT_PROMPT_UNTRACKED=".UNTRACKED." # default "?"
ZSH_THEME_GIT_PROMPT_ADDED=".ADDED." # default "+"
ZSH_THEME_GIT_PROMPT_MODIFIED=".MODIFIED." # default "+"
ZSH_THEME_GIT_PROMPT_RENAMED=".RENAMED." # default "»"
ZSH_THEME_GIT_PROMPT_DELETED=".DELETED." # default "-"
ZSH_THEME_GIT_PROMPT_STASHED=".STASHED." # default "$"
ZSH_THEME_GIT_PROMPT_UNMERGED=".UNMERGED." # default "="
ZSH_THEME_GIT_PROMPT_AHEAD=".AHEAD."
ZSH_THEME_GIT_PROMPT_BEHIND=".BEHIND."
ZSH_THEME_GIT_PROMPT_DIVERGED=".DIVERGED." # default "⇕"
ZSH_THEME_GIT_PROMPT_PREFIX_BRANCH="%F{black}"
ZSH_THEME_GIT_PROMPT_SUFFIX_BRANCH="%f"
ZSH_THEME_GIT_PROMPT_CURRENT_BRANCH=""
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE=""
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=""
ZSH_THEME_GIT_PROMPT_SHA_AFTER=""
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX=""
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX=""
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%F{cyan}⇡%f"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%F{cyan}⇣%f"
