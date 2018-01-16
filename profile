#!/bin/bash


# Default paths
PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

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
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# Paths
export COMPOSER_PATH=~/.composer/vendor
export NODE_PATH=/usr/local/opt/node@9:/usr/local/lib/node_modules
export BREW_PATH=/usr/local/Cellar
# export GEM_HOME=~/.gem
# export GEM_PATH=~/.gem/ruby/gems

# Add more additional paths
# PATH=$GEM_HOME:$PATH
# PATH=$GEM_PATH:$PATH
PATH=$COMPOSER_PATH/bin:$PATH
PATH=/usr/local/lib/ruby/gems/2.3.0/bin:/usr/local/Cellar/ruby@2.3/2.3.6_2/bin:$PATH
PATH=$BREW_PATH:$PATH
PATH=$NODE_PATH/bin:$PATH
PATH=$DOTFILES_PATH/bin:$PATH
PATH=/Library/Ruby/Gems:$PATH
export PATH

export PS0='PS0 '
export PS1='\u [\w]: '
export PS2='> '
