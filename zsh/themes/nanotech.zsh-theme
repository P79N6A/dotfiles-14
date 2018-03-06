PROMPT='%F{green}%2c%F{blue}%f
$ '
RPROMPT='$(git_current_branch) $(parse_git_dirty) %F{blue}[ %F{green}%D{%L:%M} %F{yellow}%D{%p} %F{blue}]%f'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}*%f "
ZSH_THEME_GIT_PROMPT_CLEAN=""
