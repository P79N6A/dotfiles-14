#!/bin/bash

shell_init() {
  return
}

check_git() {
  gitrepo=$(git worktree list &>/dev/null; echo "$?")
  if [[ $gitrepo == 0 ]]; then
    export PS1="\w [!!] \n\$ "
    export PS2="> "
  else
    export PS1="\w \n\$ "
    export PS2="> "
  fi
}

reload_shell() {
  clear; exec $SHELL -l;
}

load_sources() {
  return
}

flushdns() {
  (sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder && say -f in "Cache flushed")
}

home() {
  cd $HOME && [[ $# > 0 ]] && cd "./${*}"
}

atom() {
  cd $HOME/.atom && [[ $# > 0 ]] && cd "./${*}"
}

dotf() {
  cd $HOME/.dotfiles && [[ $# > 0 ]] && cd "./${*}"
}

www() {
  cd $HOME/www && [[ $# > 0 ]] && cd "./${*}"
}

proj() {
  cd $HOME/projects && [[ $# > 0 ]] && cd "./${*}"
}

hidden() {
  chflags hidden $*
}

nohidden() {
  chflags nohidden $*
}

curdate() {
  date "+DATE: %Y-%m-%d"
}

curtime() {
  date "+TIME: %H:%M:%S"
}

path() {
    echo -e ${1//:/\\n}
}

shell_init
load_sources

alias ls="ls -lAfh"
alias la="ls -1Afh"
alias lc="ls -CAfh"
alias lf="ls | grep --color=never '^-'"
alias ld="ls | grep --color=never '^d'"

alias export=" export"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias pbcopy=" pbcopy -Prefer txt"
# alias pbcopy=" tr -d '\n' | pbcopy -Prefer txt"
alias h?="history | grep -E -i"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias wpkey="curl -G https://api.wordpress.org/secret-key/1.1/salt/ | pbcopy"
alias cleandotds="find . -type f -name '*.DS_Store' -ls -delete"
alias urlencode='python -c"import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

alias cv="command -v"
ver() {
  $1 --version
}
alias brewclean='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

alias gem="sudo gem"
gemi() {
  sudo gem install $* --no-ri --no-rdoc --no-document --backtrace --verbose --quiet
}
gemun() {
  sudo gem install $* --no-ri --no-rdoc --no-document --backtrace --verbose --quiet
}
gems() {
  sudo gem search $1
}
geml() {
  sudo gem list
}
geminfo() {
  sudo gem search --details ^$1$
}

brews() {
  brew search $1
}
brewi() {
  brew install $*
}
brewun() {
  brew uninstall $*
}
brewl() {
  brew list
}
brewinfo() {
  brew info $1
}

export MAILCHECK=-1
export TERM='xterm-256color'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS='ExFxCxDxBxegedabagacad'
export HISTCONTROL='ignoreboth:erasedups'
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=1000
export PYTHONIOENCODING='UTF-8'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export MANPAGER='less -X'
export GPG_TTY=$(tty);
export EDITOR='Atom'

export BREW_PREFIX="$(brew --prefix)"
export BREWGEM="/usr/local/lib/ruby/gems/2.5.0"
export BREWGEMBIN="/usr/local/lib/ruby/gems/2.3.0/bin"

_PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:sbin"
_PATH="$HOME/.dotfiles/bin:$_PATH"
export PATH="$_PATH"
export PROMPT_COMMAND="check_git"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
