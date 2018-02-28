## OTHERS
## -------------------------------------------------- ##
alias ..="cdup"
alias ...="cdhome"

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
alias lsbin="ls /usr/local/bin"
alias lsbing="ls /usr/local/bin | grep -E "


## GEM
## -------------------------------------------------- ##
alias gem="sudo gem"


## GREP
## -------------------------------------------------- ##
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"


## WORDPRESS
## -------------------------------------------------- ##
alias wpkey="curl -G https://api.wordpress.org/secret-key/1.1/salt/ | pbcopy"


alias h="history | grep -E -i"
alias pbcopy=" pbcopy -Prefer txt"
alias localip="ipconfig getifaddr en0"
alias cleandotds="find . -type f -name '*.DS_Store' -ls -delete"
alias urlencode='python -c"import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias imgopt="jpegoptim"


## CHROME-CLI
## -------------------------------------------------- ##
alias ch="chrome-cli"


## FOLDER
## -------------------------------------------------- ##
alias lav="cd ~/www/laravel.local"
alias repro="cd ~/www/reproduction-gallery.com"
alias repron="cd ~/www/repro-gallery-master"
alias soho="cd ~/www/soho-art.com"
alias abacus="cd ~/www/abacus-gallery.com"
alias reprog="cd ~/www/reproduction-galleries.com"


## GIT
## -------------------------------------------------- ##
alias gits="git status"
alias stash="git stash"
alias status="git status"
alias add="git add"
alias commit="git commit"
alias push="git push"
alias pull="git pull"
alias checkout="git checkout"
alias master='git checkout master'


## NPM
## -------------------------------------------------- ##
alias npmrund="npm run dev"
alias npmrunp="npm run production"


## LARAVEL
## -------------------------------------------------- ##
alias artisan="php artisan"
alias tinker="artisan tinker"
