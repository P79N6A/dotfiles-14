#!/bin/bash


# Define custom variables
export DOTFILES_PATH="$HOME/.dotfiles"
# Load core configurations file
source "$DOTFILES_PATH/lib/configs.sh"


## Custom shell variables configuration
# Others
export MAILCHECK=-1
export TERM="xterm-256color"
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export CLICOLOR="1"
export LSCOLORS="ExFxCxDxBxegedabagacad"
export HISTCONTROL='ignoreboth:erasedups';
export HISTFILE="${HOME}/.bash_history";
export HISTSIZE="1000";
export NODE_REPL_HISTORY="$HOME/.node_history";
export NODE_REPL_HISTORY_SIZE="32768";
export NODE_REPL_MODE="sloppy";
export PYTHONIOENCODING="UTF-8";
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';
export MANPAGER='less -X';
export GPG_TTY=$(tty);
export EDITOR="Atom";
export MAILCHECK="0"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# Paths
export COMPOSER_PATH="$HOME/.composer/vendor"
export NODE_PATH="/usr/local/opt/node@6"
export BREW_PREFIX="`get_brew_prefix`"

# Default paths
PATH="/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
# Add more additional paths
PATH="$GEM_PATH/bin:$PATH"
PATH="$GEM_HOME/bin:$PATH"
PATH="$COMPOSER_PATH/bin:$PATH"
PATH="$NODE_PATH/bin:$PATH"
PATH="$DOTFILES_PATH/bin:$PATH"
PATH="/usr/local/opt/gettext/bin:$PATH"
PATH="/usr/local/opt/icu4c/bin:$PATH"
PATH="/usr/local/opt/icu4c/sbin:$PATH"
PATH="/usr/local/opt/libxml2/bin:$PATH"
PATH="/usr/local/opt/php70:$PATH"
PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
PATH="/usr/local/opt/openssl/bin:$PATH"
PATH="/usr/local/Cellar/watchman:$PATH"
PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
PATH="/usr/local/bin:$PATH"
export PATH

export PS0="PS0 "
export PS1="\u [\w]: "
export PS2="> "
# export PROMPT_COMMAND='STDOUT="`cat /tmp/x`"; exec >/dev/tty; exec > >(tee /tmp/x)'


load_additional_files
