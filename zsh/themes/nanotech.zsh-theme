ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}*%f "
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%F{green}%2c%F{blue}%f
$ '
RPROMPT="${ZSH_THEME_GIT_PROMPT_PREFIX}\
$(git_prompt_info)$(parse_git_dirty)\
${ZSH_THEME_GIT_PROMPT_SUFFIX}\
%F{blue}[ %F{green}%D{%L:%M} %F{yellow}%D{%p} %F{blue}]%f"
