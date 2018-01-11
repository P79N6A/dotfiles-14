#!/bin/bash


# Define custom variables
export DOTFILES_PATH=~/.dotfiles
# Load core configurations file
source $DOTFILES_PATH/lib/configs.sh


## Custom shell variables configuration
# Others
export CLEAR_SCREEN=0
export MAILCHECK=-1
export TERM='xterm-256color'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS='ExFxCxDxBxegedabagacad'
export HISTCONTROL='ignoreboth:erasedups'
export HISTFILE=~/.bash_history
export HISTSIZE=1000
export NODE_REPL_HISTORY=~/.node_history
export NODE_REPL_HISTORY_SIZE=32768
export NODE_REPL_MODE='sloppy'
export PYTHONIOENCODING='UTF-8'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export MANPAGER='less -X'
export GPG_TTY=$(tty);
export EDITOR='Atom'
export MAILCHECK=0
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# Paths
export COMPOSER_PATH=~/.composer/vendor
export NODE_PATH="/usr/local/opt/node@9:/usr/local/lib/node_modules"

# Default paths
PATH="/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
# Add more additional paths
PATH="$COMPOSER_PATH/bin:$PATH"
PATH="$NODE_PATH/bin:$PATH"
PATH="$DOTFILES_PATH/bin:$PATH"
PATH="/usr/local/Cellar:$PATH"
PATH="/usr/local/opt/ruby@2.3/bin:/usr/local/lib/ruby/gems/2.3.0/bin:$PATH"
PATH="/usr/local/bin:$PATH"
export PATH

export PS0='PS0 '
export PS1='\u [\w]: '
export PS2='> '
# export PROMPT_COMMAND='STDOUT="`cat /tmp/x`"; exec >/dev/tty; exec > >(tee /tmp/x)'


# load_additional_files
