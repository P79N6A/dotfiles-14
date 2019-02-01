#!/usr/bin/env zsh

set GIT_CURRENT_BRANCH
set GIT_TIME_SINCE_COMMIT
set GIT_CURRENT_SHA
set GIT_CURRENT_STATUS

source $HOME/.dotfiles/lib/git.sh

# Outputs current branch info in prompt format
function _git_prompt_info() {
  local ref _PROMPT

  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0

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

    case $STATUS in
      "DIRTY" )
        if [[ -n $IS_UNPUSHED ]]; then
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_DIRTY_UNPUSHED"
        elif [[ -n $IS_UNPULLED ]]; then
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_DIRTY_UNPULLED"
        elif [[ -n $IS_ADDED ]]; then
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_DIRTY_ADDED"
        else
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_DIRTY"
        fi
        ;;
      "CLEAN" )
        if [[ -n $IS_UNPUSHED ]]; then
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_CLEAN_UNPUSHED"
        elif [[ -n $IS_UNPULLED ]]; then
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_CLEAN_UNPULLED"
        elif [[ -n $IS_ADDED ]]; then
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_CLEAN_ADDED"
        else
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_CLEAN"
        fi
        ;;
      "" )
        ;;
    esac

    if [[ -n $(_git_current_branch) ]]; then
      GIT_CURRENT_BRANCH=$ZSH_THEME_GIT_PROMPT_PREFIX_BRANCH$(_git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX_BRANCH
    fi
    
    if [[ -n $(_git_prompt_short_sha) ]]; then
      GIT_CURRENT_SHA=$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$(_git_prompt_short_sha)$ZSH_THEME_GIT_PROMPT_SHA_AFTER
    fi
    
    if [[ -n $(_git_time_since_commit) ]]; then
      GIT_TIME_SINCE_COMMIT=$ZSH_THEME_GIT_PROMPT_TIME_SINCE_COMMIT_BEFORE$(_git_time_since_commit)$ZSH_THEME_GIT_PROMPT_TIME_SINCE_COMMIT_AFTER
    fi

    if [[ -n $GIT_CURRENT_STATUS ]]; then
      GIT_CURRENT_STATUS=$ZSH_THEME_GIT_PROMPT_CURRENT_STATUS_BEFORE$GIT_CURRENT_STATUS$ZSH_THEME_GIT_PROMPT_CURRENT_STATUS_AFTER
    fi
  fi

  clear="echo -e '\e[2J\n\n'"
  
  echo $(_git_prompt_status)$(_parse_git_dirty)$GIT_CURRENT_BRANCH$GIT_CURRENT_SHA$GIT_TIME_SINCE_COMMIT$GIT_CURRENT_STATUS
}

PROMPT='$ZSH_THEME_GIT_PROMPT_PREFIX%10c$ZSH_THEME_GIT_PROMPT_SUFFIX$(_git_prompt_info)
%B%F{cyan}%f%b '

ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}%f"
ZSH_THEME_GIT_PROMPT_DIRTY_UNPUSHED="%F{yellow}%f"
ZSH_THEME_GIT_PROMPT_DIRTY_UNPULLED="%F{yellow}%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}%f"
ZSH_THEME_GIT_PROMPT_CLEAN_UNPUSHED="%F{yellow}%f"
ZSH_THEME_GIT_PROMPT_CLEAN_UNPULLED="%F{yellow}%f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{blue}?%f"
ZSH_THEME_GIT_PROMPT_ADDED="%F{green}%f"
ZSH_THEME_GIT_PROMPT_CLEAN_ADDED="%F{green}%f"
ZSH_THEME_GIT_PROMPT_DIRTY_ADDED="%F{red}%f"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{green}+%f"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{blue}»%f"
ZSH_THEME_GIT_PROMPT_DELETED="%F{red}-%f"
ZSH_THEME_GIT_PROMPT_STASHED="%F{blue}$%f"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{blue}=%f"
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX=""
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX=""
ZSH_THEME_GIT_PROMPT_AHEAD="%F{cyan}⇡%f"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%F{cyan}⇡%f"
ZSH_THEME_GIT_PROMPT_BEHIND="%F{cyan}⇣%f"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%F{cyan}⇣%f"
ZSH_THEME_GIT_PROMPT_DIVERGED="" # default "⇕"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE=""
ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{magenta}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b"
ZSH_THEME_GIT_PROMPT_PREFIX_BRANCH=" %F{white}on%f %B%F{green}"
ZSH_THEME_GIT_PROMPT_SUFFIX_BRANCH="%f%b"
ZSH_THEME_GIT_PROMPT_CURRENT_STATUS_BEFORE=" "
ZSH_THEME_GIT_PROMPT_CURRENT_STATUS_AFTER=""
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" "
ZSH_THEME_GIT_PROMPT_SHA_AFTER=""
ZSH_THEME_GIT_PROMPT_TIME_SINCE_COMMIT_BEFORE=" %F{white}["
ZSH_THEME_GIT_PROMPT_TIME_SINCE_COMMIT_AFTER="]%f"
