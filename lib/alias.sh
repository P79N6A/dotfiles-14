#!/bin/bash

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
