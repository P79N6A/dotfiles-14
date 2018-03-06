# ZSH_THEME_GIT_PROMPT_ADDED="%F{green}A%f"
# ZSH_THEME_GIT_PROMPT_MODIFIED="%F{yellow}M%f"
# ZSH_THEME_GIT_PROMPT_RENAMED="%F{blue}R%f"
# ZSH_THEME_GIT_PROMPT_DELETED="%F{red}D%f"
# ZSH_THEME_GIT_PROMPT_STASHED="%F{cyan}S%f"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%F{cyan}UM%f"
# ZSH_THEME_GIT_PROMPT_DIVERGED="%F{cyan}DI%f"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{cyan}UT%f"

PROMPT='%F{green}%2c%F{blue}
%F{white}$%f '
RPROMPT='$(git_prompt_info) %F{blue}[ %F{green}%D{%L:%M} %F{yellow}%D{%p} %F{blue}]%f'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}$(git_prompt_status)*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""
