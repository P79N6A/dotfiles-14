#!/bin/bash
#
# Customize zsh

export DOTFILES="${HOME}/.dotfiles"
export ZSHFILES="${DOTFILES}/zsh"

source $ZSHFILES/exports.sh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$ZSHFILES

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="amuse"
# ZSH_THEME="cypher"
# ZSH_THEME="dpoggi"
# ZSH_THEME="kolo"
# ZSH_THEME="theunraveler"
# ZSH_THEME="zhann"
# ZSH_THEME="sobole"
# ZSH_THEME="lambda-mod"
ZSH_THEME="nanotech"
# ZSH_THEME="lambda-pure"
# ZSH_THEME="my_awesome_theme"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm dd, yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM="${ZSHFILES}/custom"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=("asciidoctor" "zsh-256color" "urltools" "zsh-autosuggestions" "git")

reset_fresh

## LOAD ZSH
## -------------------------------------------------- ##
source $ZSH/oh-my-zsh.sh


## LOAD SOURCES
## -------------------------------------------------- ##
source $ZSHFILES/functions.sh

check_required_packages

source $ZSHFILES/alias.sh
