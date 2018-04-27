#!/usr/bin/env zsh

function _git_commits_ahead() {
  if command git rev-parse --git-dir &>/dev/null; then
    local commits="$(git rev-list --count @{upstream}..HEAD 2>/dev/null)"
    if [[ -n "$commits" && "$commits" != 0 ]]; then
      echo "$commits"
      # echo "$ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX$commits$ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX"
    fi
  fi
}

function _git_commits_behind() {
  if command git rev-parse --git-dir &>/dev/null; then
    local commits="$(git rev-list --count HEAD..@{upstream} 2>/dev/null)"
    if [[ -n "$commits" && "$commits" != 0 ]]; then
      echo "$ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX$commits$ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX"
    fi
  fi
}

function _git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

function _git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0

    if [[ $(_git_commits_ahead) > 0 ]]; then
      ZSH_THEME_GIT_PROMPT_CLEAN=" %F{yellow}ﯸ%f"
    fi

    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(_git_commits_ahead):$(_git_commits_behind):$(_git_current_branch):$(_parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

function _parse_git_dirty() {
  local STATUS=''
  local -a FLAGS
  FLAGS=('--porcelain')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi
  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

function get_right_prompt() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo -n "$(git_prompt_short_sha)"
    else
        echo -n ""
    fi
}

PROMPT='%2c $(_git_prompt_info) %D{%L:%M} %D{%p}
$ '
# RPROMPT='$(git_prompt_info) %F{blue}] %F{green}%D{%L:%M} %F{yellow}%D{%p}%f'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX=""
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" *"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green}ﯸ%f"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=""
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=""
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE=""
ZSH_THEME_GIT_PROMPT_AHEAD=""
ZSH_THEME_GIT_PROMPT_BEHIND=""
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=""
ZSH_THEME_GIT_PROMPT_SHA_AFTER=""
ZSH_THEME_GIT_PROMPT_ADDED=""
ZSH_THEME_GIT_PROMPT_MODIFIED=""
ZSH_THEME_GIT_PROMPT_RENAMED=""
ZSH_THEME_GIT_PROMPT_DELETED=""
ZSH_THEME_GIT_PROMPT_STASHED=""
ZSH_THEME_GIT_PROMPT_UNMERGED=""
ZSH_THEME_GIT_PROMPT_DIVERGED=""
ZSH_THEME_GIT_PROMPT_UNTRACKED=""
