PROMPT='%F{green}%2c%F{blue}%f
$ '
RPROMPT='$(parse_git_dirty) / $(git_current_branch) %F{blue}[ %F{green}%D{%L:%M} %F{yellow}%D{%p} %F{blue}]%f'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}*%f "
ZSH_THEME_GIT_PROMPT_CLEAN=""
