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
alias imgopt="jpegoptim"
alias gem="sudo gem"
gemi() {
  sudo gem install $* --no-ri --no-rdoc --no-document --backtrace --verbose --quiet
}
gemun() {
  sudo gem uninstall $* --backtrace --verbose --quiet
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
alias brewclean='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
brews() {
  brew search $1
}
brewt() {
  brew tap $1
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
alias npms="npm search --long"
alias npmi="npm install"
alias npmun="npm uninstall"
alias npminfo="npm info"

alias gits="git status"
alias gitiw="git instaweb"
gita() {
  files=.
  if [[ $# > 0 ]]; then
    files=$*
  fi
  git add $files
}
gitcp() {
  if [[ $# == 0 ]]; then
    echo  -e "${Red}Please add messages${ResetColor}"
    return 1
  fi

  msg=$1; shift
  git commit -m $msg; git push $*
}

pushdotf() {
  printf "${GREEN}Generating log files...${R}\n"
  gem list 1>gem.log; brew list 1>brew.log; npm list -g --depth 0 1>npm.log; composer global show 1>composer.log

  git add .; git commit -m 'upload'; git push origin master
}
