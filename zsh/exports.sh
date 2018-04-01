export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"

export HOMEBREW_NO_EMOJI="1"
export MAILCHECK="-1"
export TERM="xterm-256color"
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;32"
export CLICOLOR="1"
export LSCOLORS="ExFxCxDxBxegedabagacad"
export HISTCONTROL="ignoreboth:erasedups"
export HISTFILE="${HOME}/.bash_history"
export HISTSIZE="1000"
export PYTHONIOENCODING="UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export MANPAGER="less -X"
export GPG_TTY="$(tty)"
export EDITOR="Atom"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export GITURL="https://github.com"
export GITSSH="git@github.com"
export FINEARTGIT="${GITURL}/fineartdeveloper"
export NOPPHASINGIT="${GITURL}/nopphasinara"

export ATOM_DEV_RESOURCE_PATH="${HOME}/.dotfiles/dev/packages"
export PHP_HOME="/usr/local/bin/php"
export MANPATH="/usr/local/man:${MANPATH}"
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="${HOME}/.ssh/rsa_id"
export BREW_PREFIX="`brew --prefix`"
export BREW_PATH="/usr/local/Cellar"
export BREWGEMBIN="/usr/local/Cellar/ruby/2.5.0_2/bin"
export COMPOSERBIN="${HOME}/.composer/vendor/bin"
_PATH=""
_PATH="/usr/local/sbin:/usr/sbin:/sbin:${_PATH}"
_PATH="${DOTFILES}/bin:${_PATH}"
_PATH="${COMPOSERBIN}:${_PATH}"
_PATH="${BREW_PATH}:${_PATH}"
_PATH="${BREWGEMBIN}:/usr/local/bin:/usr/bin:/bin:${_PATH}"
export PATH="${_PATH}"
# export PROMPT_COMMAND=""


## THEME VARIABLES
## -------------------------------------------------- ##
# PROMPT
# DEFAULT_USER
# ZSH_THEME_SCM_PROMPT_PREFIX

# ZSH_THEME_GIT_PROMPT_PREFIX
# ZSH_THEME_GIT_PROMPT_SUFFIX
# ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX
# ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX
# ZSH_THEME_GIT_PROMPT_DIRTY
# ZSH_THEME_GIT_PROMPT_CLEAN
# ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE
# ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE
# ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE
# ZSH_THEME_GIT_PROMPT_AHEAD
# ZSH_THEME_GIT_PROMPT_BEHIND
# ZSH_THEME_GIT_PROMPT_SHA_BEFORE
# ZSH_THEME_GIT_PROMPT_SHA_AFTER
# ZSH_THEME_GIT_PROMPT_ADDED
# ZSH_THEME_GIT_PROMPT_MODIFIED
# ZSH_THEME_GIT_PROMPT_RENAMED
# ZSH_THEME_GIT_PROMPT_DELETED
# ZSH_THEME_GIT_PROMPT_STASHED
# ZSH_THEME_GIT_PROMPT_UNMERGED
# ZSH_THEME_GIT_PROMPT_DIVERGED
# ZSH_THEME_GIT_PROMPT_UNTRACKED

# ZSH_THEME_NVM_PROMPT_PREFIX
# ZSH_THEME_NVM_PROMPT_SUFFIX

# ZSH_THEME_RVM_PROMPT_PREFIX
# ZSH_THEME_RVM_PROMPT_SUFFIX
# ZSH_THEME_RVM_PROMPT_OPTIONS

# ZSH_THEME_TERM_TAB_TITLE_IDLE
# ZSH_THEME_TERM_TITLE_IDLE
# chpwd_functions
# precmd_functions
