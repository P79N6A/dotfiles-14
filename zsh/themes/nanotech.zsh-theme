#!/usr/bin/env zsh

function get_right_prompt() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo -n "$(git_prompt_short_sha)"
    else
        echo -n ""
    fi
}

PROMPT='$(git_prompt_info)'

# PROMPT='%F{green}λ%f %F{yellow}%100c%f$(git_prompt_info)%F{blue}[%f %F{green}%D{%L:%M}%f %F{yellow}%D{%p}%f %F{blue}]%f
# %F{white}$%f $(get_right_prompt)'
# RPROMPT='$(git_current_branch) $(parse_git_dirty) %F{blue}[ %F{green}%D{%L:%M} %F{yellow}%D{%p} %F{blue}]%f'
# PROMPT="%B%F{black}▶%f%b%F{red}▶%B%F{red}▶%f%b \
# %B%F{$HASH_MOD}%D{%R.%S %a %b %d %Y}%b%f\
# ${EXIT_STATUS}\
# %(1j. %B%F{green}◆%f%b %B%F{yellow}Jobs: %j%f%b.)\
# ${PR_BATTERY}\
#  %B%F{red}◀%f%b%F{red}◀%B%F{black}◀%f%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}*%f "
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}%f"

ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="!"
ZSH_THEME_GIT_PROMPT_RENAMED=""
ZSH_THEME_GIT_PROMPT_DELETED="x"
ZSH_THEME_GIT_PROMPT_STASHED=""
ZSH_THEME_GIT_PROMPT_UNMERGED="??"
ZSH_THEME_GIT_PROMPT_DIVERGED=""
ZSH_THEME_GIT_PROMPT_UNSTAGED="%F{yellow}●%f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{red}●%f"
ZSH_THEME_GIT_PROMPT_AHEAD="[B%.]"
ZSH_THEME_GIT_PROMPT_BEHIND="[A%.]"


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
