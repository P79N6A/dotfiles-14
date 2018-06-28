#!/usr/bin/env zsh

source $HOME/.dotfiles/lib/git.sh

# Outputs current branch info in prompt format
function _git_prompt_info() {
  local ref _PROMPT

  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0

    local GIT_CURRENT_BRANCH GIT_CURRENT_STATUS GIT_INFO

    GIT_CURRENT_BRANCH="$ZSH_THEME_GIT_PROMPT_PREFIX_BRANCH$(_git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX_BRANCH"
    GIT_CURRENT_STATUS=""

    local STATUS=$(_git_prompt_status)
    local IS_DIRTY IS_CLEAN IS_UNTRACKED IS_ADDED IS_MODIFIED IS_RENAMED IS_DELETED IS_STASHED IS_UNMERGED IS_AHEAD IS_BEHIND IS_DIVERGED

    IS_UNTRACKED="$(echo $STATUS | grep -E 'UNTRACKED' -io)"
    IS_ADDED="$(echo $STATUS | grep -E 'ADDED' -io)"
    IS_MODIFIED="$(echo $STATUS | grep -E 'MODIFIED' -io)"
    IS_RENAMED="$(echo $STATUS | grep -E 'RENAMED' -io)"
    IS_DELETED="$(echo $STATUS | grep -E 'DELETED' -io)"
    IS_STASHED="$(echo $STATUS | grep -E 'STASHED' -io)"
    IS_UNMERGED="$(echo $STATUS | grep -E 'UNMERGED' -io)"
    IS_AHEAD="$(echo $STATUS | grep -E 'AHEAD' -io)"
    IS_BEHIND="$(echo $STATUS | grep -E 'BEHIND' -io)"
    IS_DIVERGED="$(echo $STATUS | grep -E 'DIVERGED' -io)"
    IS_UNPUSHED=""
    [[ $(_git_commits_ahead) > 0 ]] && IS_UNPUSHED="UNPUSHED"
    IS_UNPULLED=""
    [[ $(_git_commits_behind) > 0 ]] && IS_UNPULLED="UNPULLED"

    local STATUS=$(_parse_git_dirty)
    [[ -n $IS_UNTRACKED ]] && STATUS='DIRTY'
    [[ -n $IS_MODIFIED || -n $IS_RENAMED || -n $IS_DELETED ]] && STATUS='DIRTY'
    # if [[ $(_git_commits_ahead) > 0 || $(_git_commits_behind) > 0 ]]; then
    #   ZSH_THEME_GIT_PROMPT_CLEAN=" %F{yellow}○%f"
    # fi

    case $STATUS in
      "DIRTY" )
        if [[ -n $IS_UNPUSHED ]]; then
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_DIRTY_UNPUSHED"
        elif [[ -n $IS_UNPULLED ]]; then
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_DIRTY_UNPULLED"
        else
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_DIRTY"
        fi

        # [[ -n $IS_ADDED ]] && GIT_CURRENT_STATUS="${GIT_CURRENT_STATUS}${ZSH_THEME_GIT_PROMPT_ADDED}"
        # [[ -n $IS_MODIFIED ]] && GIT_CURRENT_STATUS="${GIT_CURRENT_STATUS}${ZSH_THEME_GIT_PROMPT_MODIFIED}"
        # [[ -n $IS_RENAMED ]] && GIT_CURRENT_STATUS="${GIT_CURRENT_STATUS}${ZSH_THEME_GIT_PROMPT_RENAMED}"
        # [[ -n $IS_DELETED ]] && GIT_CURRENT_STATUS="${GIT_CURRENT_STATUS}${ZSH_THEME_GIT_PROMPT_DELETED}"
        ;;
      "CLEAN" )
        if [[ -n $IS_UNPUSHED ]]; then
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_CLEAN_UNPUSHED"
        elif [[ -n $IS_UNPULLED ]]; then
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_CLEAN_UNPULLED"
        else
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_CLEAN"
        fi
        ;;
      "" )
        ;;
    esac

    # echo "{${STATUS}:${IS_UNTRACKED}:${IS_ADDED}:${IS_MODIFIED}:${IS_RENAMED}:${IS_DELETED}:${IS_STASHED}:${IS_UNMERGED}:${IS_AHEAD}:${IS_BEHIND}:${IS_DIVERGED}}"

    if [[ -n $GIT_CURRENT_STATUS ]]; then
      GIT_CURRENT_STATUS=" $GIT_CURRENT_STATUS"
    fi
  fi

  echo $GIT_CURRENT_BRANCH$GIT_CURRENT_STATUS
}

PROMPT='%F{green}λ%f %F{yellow}%10c%f $(_git_prompt_info) [%D{%L:%M} %D{%p}]
$ '
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
ZSH_THEME_GIT_PROMPT_AHEAD="%F{cyan}⇡%f"
ZSH_THEME_GIT_PROMPT_BEHIND="%F{cyan}⇣%f"
ZSH_THEME_GIT_PROMPT_DIVERGED="" # default "⇕"
# ZSH_THEME_GIT_PROMPT_PREFIX_BRANCH=""
ZSH_THEME_GIT_PROMPT_PREFIX_BRANCH="%F{black}"
# ZSH_THEME_GIT_PROMPT_SUFFIX_BRANCH=""
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
