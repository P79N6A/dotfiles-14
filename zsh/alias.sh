## OTHERS
## -------------------------------------------------- ##
alias h="history | grep -E -i"
alias pbcopy=" pbcopy -Prefer txt"
alias localip="ipconfig getifaddr en0"
alias cleandotds="sudo find . -type f -name '*.DS_Store' -ls -delete"
alias urlencode='python -c"import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias imgopt="jpegoptim"
alias cmd="command -v"
alias curdate="date \"+DATE: %Y-%m-%d\""
alias curtime="date \"+TIME: %H:%M:%S\""
alias path="echo -e ${1//:/\\n}"


## LS
## -------------------------------------------------- ##
# alias ls="ls -lAh"
# alias la="ls -1Ah"
# alias lc="ls -CAh"
# alias lf="ls | grep --color=never '^-'"
# alias ld="ls | grep --color=never '^d'"
# alias lr="ls -R"
# alias lsf="ls -L"
# alias lsbysize="ls -S"
# alias lsbytime="ls -t"
# alias lsbin="ls /usr/local/bin"
# alias lsbing="ls /usr/local/bin | grep -E "


## EXA
## -------------------------------------------------- ##
alias ls="exa -l -h -a --color=always --group-directories-first"
alias tree="ls -T"


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
# alias wpkey="curl -G https://api.wordpress.org/secret-key/1.1/salt/ | pbcopy"


## CHROME-CLI
## -------------------------------------------------- ##
# alias ch="chrome-cli"


## FOLDER
## -------------------------------------------------- ##
alias lawww="cd ~/www/laravel.local"
alias repro="cd ~/www/reproduction-gallery.com"
alias repronew="cd ~/www/repro-gallery-master"
alias atom-dev="atom --dev"


## GIT
## -------------------------------------------------- ##
alias checkout="git checkout"
alias master='git checkout master'
alias develop='git checkout develop'
alias stash="git stash"
alias status="git status"
alias headreset="git reset HEAD"
alias add="git_add"
alias commit="git_commit"
alias push="git_push"
alias pull="git_pull"
alias add-commit="git_add_commit"
alias feature="git flow feature"
alias gitrm="git rm"
alias rmcached="git rm --cached"


## NPM
## -------------------------------------------------- ##
alias npmrund="npm run dev"
alias npmrunp="npm run production"


## LARAVEL
## -------------------------------------------------- ##
alias la="php artisan"
alias tkg="(cd ~/www/laravel.local && php artisan tinker)"
alias tk="php artisan tinker"
alias art="php arttisan"
alias artisan="php artisan"
alias tinker="artisan tinker"
alias passv="echo \"VpjkcV88\" | copy"
# alias laclear="la view:clear && la route:clear"
# alias laclear="la view:clear && la route:clear && la config:clear && la auth:clear-resets && la clear-compiled"
alias fetch="git fetch"
alias branch="git branch"
alias merge="git merge"
function fastcomet()
{
  local user='devilsdenthailan'

  if [[ -n $1 ]]; then
    user=$1; shift
  fi

  ssh -p 17177 "$user@node647.myfcloud.com"
}

function hostinger()
{
  local user='u822159201'

  if [[ -n $1 ]]; then
    user=$1; shift
  fi

  ssh -p 65002 "$user@185.224.137.8"
}
alias check="git checkout"
alias staging="cd $HOME/www/staging.reproduction-galleries.com"
alias lux="cd $HOME/www/luxurypropertiespattaya.com"
alias gold="cd $HOME/www/goldfishcreativethailand.com"
alias luxaffi="cd ~/www/affiliate.luxurypropertiespattaya.com"
