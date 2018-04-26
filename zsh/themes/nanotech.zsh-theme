#!/usr/bin/env zsh

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
  # if [[ -n $STATUS ]]; then
  #   echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  # else
  #   echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  # fi
  echo $STATUS
}

function get_right_prompt() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo -n "$(git_prompt_short_sha)"
    else
        echo -n ""
    fi
}

PROMPT="$(parse_git_dirty)"
# PROMPT="λ %d $(git_prompt_info) [%D{%L:%M} %D{%p}]\n$ $(get_right_prompt)"

# PROMPT="%B%F{black}▶%f%b%F{red}▶%B%F{red}▶%f%b \
# %B%F{$HASH_MOD}%D{%R.%S %a %b %d %Y}%b%f\
# ${EXIT_STATUS}\
# %(1j. %B%F{green}◆%f%b %B%F{yellow}Jobs: %j%f%b.)\
# ${PR_BATTERY}\
#  %B%F{red}◀%f%b%F{red}◀%B%F{black}◀%f%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}●%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}●%f"

ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="!"
ZSH_THEME_GIT_PROMPT_RENAMED=""
ZSH_THEME_GIT_PROMPT_DELETED="x"
ZSH_THEME_GIT_PROMPT_STASHED=""
ZSH_THEME_GIT_PROMPT_UNMERGED="??"
ZSH_THEME_GIT_PROMPT_DIVERGED=""
ZSH_THEME_GIT_PROMPT_UNSTAGED=""
ZSH_THEME_GIT_PROMPT_UNTRACKED=""
ZSH_THEME_GIT_PROMPT_AHEAD=""
ZSH_THEME_GIT_PROMPT_BEHIND=""


# if [ $UID -eq 0 ]; then
#   NCOLOR="red"
# else
#   NCOLOR="green"
# fi

# local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
# #PROMPT='%* %{$fg[$NCOLOR]%}%n%{$reset_color%}@%{$fg[cyan]%}%m\
# PROMPT='%D{%H:%M:%S} %{$fg[$NCOLOR]%}%n%{$reset_color%}@%{$fg[cyan]%}%m\
# %{$reset_color%}:%{$fg[magenta]%}%~\
# $(git_prompt_info)
# %{$fg[red]%}%(!.#.$)%{$reset_color%} '
# PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
# RPS1='${return_code}'
