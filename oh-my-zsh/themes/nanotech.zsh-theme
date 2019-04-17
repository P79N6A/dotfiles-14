#!/usr/bin/env zsh

set GIT_CURRENT_BRANCH
set GIT_TIME_SINCE_COMMIT
set GIT_CURRENT_SHA
set GIT_CURRENT_STATUS

source $HOME/.dotfiles/lib/git.sh

# Outputs current branch info in prompt format
function _git_prompt_info() {
  local DIRTY_SIDE
  local CLEAN_SIDE
  local ref _PROMPT

  local STATUS=$(_git_prompt_status)
  local IS_DIRTY IS_CLEAN IS_UNTRACKED IS_ADDED IS_MODIFIED IS_RENAMED IS_DELETED IS_STASHED IS_UNMERGED IS_AHEAD IS_BEHIND IS_DIVERGED

  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0


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
    # [[ -n $IS_UNTRACKED ]] && STATUS='DIRTY'
    [[ -n $IS_UNTRACKED || -n $IS_MODIFIED || -n $IS_RENAMED || -n $IS_DELETED ]] && STATUS='DIRTY'


    case $STATUS in
      "DIRTY" )
        IS_DIRTY='DIRTY'
        DIRTY_SIDE="%F{red}%f"
        if [[ -n $IS_UNPUSHED ]]; then
          DIRTY_SIDE="%F{yellow}%f"
          if [[ ! -n $IS_ADDED ]]; then
            DIRTY_SIDE="%F{yellow}   %f"
          fi
          if [[ -n $IS_MODIFIED || -n $IS_RENAMED || -n $IS_DELETED || -n $IS_UNTRACKED ]]; then
            DIRTY_SIDE="%F{yellow}%f"
          fi
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_DIRTY_UNPUSHED"
        elif [[ -n $IS_UNPULLED ]]; then
          DIRTY_SIDE="%F{red}          %f %F{yellow}xx%f"
          # DIRTY_SIDE="%F{red}⬤%f%F{yellow}  ﴵ  ﲫ   撚 漣  ﲘ 璉 練 聯   3%f"
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_DIRTY_UNPULLED"
        elif [[ -n $IS_ADDED ]]; then
          DIRTY_SIDE="%F{yellow}%f"
          if [[ -n $IS_MODIFIED || -n $IS_RENAMED || -n $IS_DELETED || -n $IS_UNTRACKED ]]; then
            DIRTY_SIDE="%F{yellow}%f"
          fi
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_DIRTY_ADDED"
        elif [[ -n $IS_MODIFIED ]]; then
          DIRTY_SIDE="%F{yellow}%f"
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_DIRTY_MODIFIED"
        else
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_DIRTY"
        fi
        ;;
      "CLEAN" )
        IS_CLEAN='CLEAN'
        CLEAN_SIDE="%F{green}                               %f"
        # CLEAN_SIDE="%F{green}                                 %f"
        # CLEAN_SIDE="%F{green}%f           !?       +-       1 2 3"
        if [[ -n $IS_UNPUSHED ]]; then
          CLEAN_SIDE="%F{yellow}UNPUSHED%f"
          if [[ -n $IS_AHEAD ]]; then
            CLEAN_SIDE="%F{yellow}%f"
            # CLEAN_SIDE="%F{green}        %f"
            # CLEAN_SIDE="%F{green}AHEAD        %f"
          fi
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_CLEAN_UNPUSHED"
        elif [[ -n $IS_UNPULLED ]]; then
          CLEAN_SIDE="%F{yellow}UNPULLED%f"
          if [[ -n $IS_BEHIND ]]; then
            CLEAN_SIDE="%F{yellow}%f"
            # CLEAN_SIDE="%F{green}        %f"
            # CLEAN_SIDE="%F{green}AHEAD        %f"
          fi
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_CLEAN_UNPULLED"
        elif [[ -n $IS_ADDED ]]; then
          CLEAN_SIDE="%F{green}%f"
          if [[ -n $IS_MODIFIED || -n $IS_RENAMED || -n $IS_DELETED || -n $IS_UNTRACKED ]]; then
            CLEAN_SIDE="%F{green}%f"
          fi
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_CLEAN_ADDED"
        elif [[ -n $IS_MODIFIED ]]; then
          CLEAN_SIDE="%F{green}%f"
          GIT_CURRENT_STATUS="$ZSH_THEME_GIT_PROMPT_CLEAN_MODIFIED"
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

    # if [[ -n $(_git_time_since_commit) ]]; then
    #   GIT_TIME_SINCE_COMMIT=$ZSH_THEME_GIT_PROMPT_TIME_SINCE_COMMIT_BEFORE$(_git_time_since_commit)$ZSH_THEME_GIT_PROMPT_TIME_SINCE_COMMIT_AFTER
    # fi

    if [[ -n $GIT_CURRENT_STATUS ]]; then
      GIT_CURRENT_STATUS=$ZSH_THEME_GIT_PROMPT_CURRENT_STATUS_BEFORE$CLEAN_SIDE$DIRTY_SIDE$ZSH_THEME_GIT_PROMPT_CURRENT_STATUS_AFTER
    fi
  fi

  echo $GIT_CURRENT_STATUS
  # echo $GIT_CURRENT_BRANCH$GIT_CURRENT_STATUS
}

PROMPT='%F{black}--------------------------------------------------------%f
$ZSH_THEME_GIT_PROMPT_PREFIX$PROMPT_START$ZSH_THEME_GIT_PROMPT_SUFFIX$(_git_prompt_info)
$PROMPT_PS1 '
RPROMPT='  蓼 $(_git_current_branch)'

PROMPT_START='%10c'
PROMPT_PS1='%F{white}%f'
PROMPT_PS2='%F{red}%f'
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}%f"
ZSH_THEME_GIT_PROMPT_DIRTY_UNPUSHED="%F{yellow}%f"
ZSH_THEME_GIT_PROMPT_DIRTY_UNPULLED="%F{yellow}%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}%f"
ZSH_THEME_GIT_PROMPT_CLEAN_UNPUSHED="%F{green}%f"
ZSH_THEME_GIT_PROMPT_CLEAN_UNPULLED="%F{green}%f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="?"
ZSH_THEME_GIT_PROMPT_ADDED=""
ZSH_THEME_GIT_PROMPT_DIRTY_ADDED="%F{green}%f"
ZSH_THEME_GIT_PROMPT_DIRTY_MODIFIED="%F{green}MODIFIED%f"
ZSH_THEME_GIT_PROMPT_CLEAN_ADDED=""
ZSH_THEME_GIT_PROMPT_CLEAN_MODIFIED="MODIFIED"
ZSH_THEME_GIT_PROMPT_MODIFIED="+"
ZSH_THEME_GIT_PROMPT_RENAMED="»"
ZSH_THEME_GIT_PROMPT_DELETED="-"
ZSH_THEME_GIT_PROMPT_STASHED="$"
ZSH_THEME_GIT_PROMPT_UNMERGED="="
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX=""
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX=""
ZSH_THEME_GIT_PROMPT_AHEAD="⇡"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="⇡"
ZSH_THEME_GIT_PROMPT_BEHIND="⇣"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="⇣"
ZSH_THEME_GIT_PROMPT_DIVERGED="" # default "⇕"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE=""
ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{magenta}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b"
ZSH_THEME_GIT_PROMPT_PREFIX_BRANCH=" %F{def}"
ZSH_THEME_GIT_PROMPT_SUFFIX_BRANCH="%f"
ZSH_THEME_GIT_PROMPT_CURRENT_STATUS_BEFORE=" "
ZSH_THEME_GIT_PROMPT_CURRENT_STATUS_AFTER=""
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="["
ZSH_THEME_GIT_PROMPT_SHA_AFTER="]"
ZSH_THEME_GIT_PROMPT_TIME_SINCE_COMMIT_BEFORE=""
ZSH_THEME_GIT_PROMPT_TIME_SINCE_COMMIT_AFTER=""
