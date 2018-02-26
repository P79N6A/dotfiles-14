#!/bin/bash

alias lms="lsmac -a"
alias lmf="lsmac -ao"
alias lmd="lsmac -aF"
alias ls="ls -lAh"
alias la="ls -1Ah"
alias lc="ls -CAh"
alias lf="ls | grep --color=never '^-'"
alias ld="ls | grep --color=never '^d'"
alias lsf="ls -L"
alias lsbysize="ls -S"
alias lsbytime="ls -t"

alias export=" export"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias pbcopy=" pbcopy -Prefer txt"
# alias pbcopy=" tr -d '\n' | pbcopy -Prefer txt"
alias h?="history | grep -E -i"
# alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
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
gemup() {
  sudo gem update
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

alias gits="git status"
alias gitiw="git instaweb"


alias a.="apminfo"
alias aa.="apmi"
alias ua.="apmun"
alias sa.="apms"
alias b.="brewinfo"
alias bb.="brewi"
alias ub.="brewun"
alias sb.="brews"
alias g.="geminfo"
alias gg.="gemi"
alias ug.="gemun"
alias sg.="gems"
alias n.="npminfo"
alias nn.="npmi"
alias un.="npmun"
alias sn.="npms"

alias ch="chrome-cli"
alias lsbin="ls /usr/local/bin"
alias lsbing="ls /usr/local/bin | grep -E "
alias artisan="php artisan"
alias ytdvideo="youtube-dl --yes-playlist --no-part --no-mark-watched --no-continue --no-cache-dir -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -o '%(title)s.%(ext)s'"
alias ytdaudio="youtube-dl --yes-playlist --no-part --no-mark-watched --no-continue --no-cache-dir -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -o '%(title)s.%(ext)s' -x --audio-format 'mp3' --audio-quality 3"
alias apmb="apm-beta"


alias master='git checkout master'

alias ..="cdup"
alias ...="cdhome"

cdup() {
  if [[ $# == 0 ]]; then
    cd ../
  else
    cd $1
  fi
}

cdhome() {
  if [[ $# == 0 ]]; then
    cd
  else
    cd && cd $1
  fi
}
alias lav="cd ~/www/laravel.local"
alias repro="cd ~/www/reproduction-gallery.com"
alias repron="cd ~/www/repro-gallery-master"
alias soho="cd ~/www/soho-art.com"
alias abacus="cd ~/www/abacus-gallery.com"
alias reprog="cd ~/www/reproduction-galleries.com"
alias stash="git stash"
alias status="git status"
alias commit="git commit"
alias push="git push"
alias pull="git pull"
alias npmrund="npmrun development"
alias npmrunp="npmrun production"
