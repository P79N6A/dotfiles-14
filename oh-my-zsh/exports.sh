export h=$HOME

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="10"

export HOMEBREW_NO_EMOJI="1"
export MAILCHECK="-1"
export TERM="xterm-256color"
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;32"
export HISTCONTROL="ignoreboth:erasedups"
export HISTFILE="$HOME/.zsh_history"
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
export FINEARTGIT="$GITURL/fineartdeveloper"
export NOPPHASINGIT="$GITURL/nopphasinara"
export NAME="nopphasinara"
export EMAIL="nopphasin.arayasirikul@gmail.com"
export GIT_CONFIG_NOSYSTEM=1
export GIT_AUTHOR_NAME=$NAME
export GIT_COMMITTER_NAME=$NAME
export GIT_AUTHOR_EMAIL=$EMAIL
export GIT_COMMITTER_EMAIL=$EMAIL
export GIT_SSL_KEY="$HOME/.ssh/github_id_rsa"
export ATOM_DEV_RESOURCE_PATH="$HOME/.dotfiles/projects/atom-source"
export NPM_CONFIG_PREFIX="$HOME/.npm-global"
export ARCHFLAGS="-arch x86_64"
export BREW_PREFIX="`brew --prefix`"
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"
export MANPATH="/usr/local/man:$MANPATH"
export BREW_PATH="/usr/local/Cellar"
export COMPOSERBIN="$HOME/.composer/vendor/bin"
# export GEM_PATH="/Library/Ruby/Gems/2.3.0/gems"
# export GEM_PATH="/Library/Ruby/Gems/2.3.0/gems/bounce_email-0.2.8/lib"
export PATH="$GEM_PATH:$BREW_PATH:$COMPOSERBIN:/usr/local/bin:$DOTFILES/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"


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

# Add colors to Terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
