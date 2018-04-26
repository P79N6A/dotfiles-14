#!/usr/bin/env zsh

function get_right_prompt() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo -n "$(git_prompt_short_sha)"
    else
        echo -n ""
    fi
}

PROMPT='%2c $(git_prompt_info) %D{%L:%M} %D{%p}
$ '
# RPROMPT='$(git_prompt_info) %F{blue}] %F{green}%D{%L:%M} %F{yellow}%D{%p}%f'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" *"
ZSH_THEME_GIT_PROMPT_CLEAN=" ±"

# ZSH_THEME_GIT_PROMPT_ADDED="+"
# ZSH_THEME_GIT_PROMPT_MODIFIED="!"
# ZSH_THEME_GIT_PROMPT_RENAMED=""
# ZSH_THEME_GIT_PROMPT_DELETED="x"
# ZSH_THEME_GIT_PROMPT_STASHED=""
# ZSH_THEME_GIT_PROMPT_UNMERGED="??"
# ZSH_THEME_GIT_PROMPT_DIVERGED=""
# ZSH_THEME_GIT_PROMPT_UNSTAGED=""
# ZSH_THEME_GIT_PROMPT_UNTRACKED=""
# ZSH_THEME_GIT_PROMPT_AHEAD=""
# ZSH_THEME_GIT_PROMPT_BEHIND=""
