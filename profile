#!/bin/bash


## Custom shell variables configuration
# Others
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
export GEM_HOME="${HOME}/.gem/ruby/2.3.0/bin";
export EDITOR="Atom";
export MAILCHECK="0"

# Paths
export DOTFILES_PATH="${HOME}/.dotfiles"
export COMPOSER_PATH="${HOME}/.composer/vendor"
export NODE_PATH="/usr/local/opt/node@6"

PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export PATH="${GEM_HOME}:${COMPOSER_PATH}/bin:${NODE_PATH}/bin:${DOTFILES_PATH}/bin:${PATH}"

export PS0="PS0 "
export PS1="\u [\w]: "
export PS2="> "
export PROMPT_COMMAND=""


source_files=("$HOME/.bashrc $HOME/.exrc $HOME/.npmrc $HOME/.vimrc $HOME/.lessfilter")
for file in $source_files; do
  base_filename="$(basename $file | perl -pe 's/\.//gi')"

  if [[ ! -e "$DOTFILES_PATH/$base_filename" ]]; then
    touch "$DOTFILES_PATH/$base_filename"
  fi
  cp "$DOTFILES_PATH/$base_filename" "$file"
  # chmod -R 0755 "$file"
  source "$file"
done

# Load additional files
common_files=("$DOTFILES_PATH/alias $DOTFILES_PATH/functions")
for file in $common_files; do
  if [[ ! -e "$file" ]]; then
    echo -e "Filename $file does not exists"
  else
    source "$file"
  fi
done


# iTerm test shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
