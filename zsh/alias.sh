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
alias hostof="host -a "
alias nsof="host -t ns "
function hostquery() {
  if [[ $# != 1 ]]; then
    echo -ne "usage: query hostname|ip\n"
  fi
}
alias clearmail=": > /var/mail/$USER"


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

function sshplesk()
{
  local user='adminonly'

  if [[ -n $1 ]]; then
    user=$1; shift
  fi

  ssh "$user@184.95.43.90"
}

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
  local user='u113671738'

  if [[ -n $1 ]]; then
    user=$1; shift
  fi

  ssh -p 65002 "$user@185.201.11.43"
}
alias check="git checkout"
alias staging="cd $HOME/www/staging.reproduction-galleries.com"
alias lux="cd $HOME/www/luxurypropertiespattaya.com"
alias gold="cd $HOME/www/goldfishcreativethailand.com"
alias luxaffi="cd ~/www/affiliate.luxurypropertiespattaya.com"
alias del="rm -rf"

function benchmark() {
  ab -k -n $1 -c $2 $3
}
# Scanning for Abusing IP Addresses
alias scanabuse="netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n"
# Block IP address
function blockip() {
  iptables -A INPUT -s $1 -j DROP
}
# Block IP address load website more than 10 times
function blockipbytimes() {
  iptables -I INPUT -p tcp —dport 80 -i eth0 -m state —state NEW -m recent —set
  iptables -I INPUT -p tcp —dport 80 -i eth0 -m state —state NEW -m recent —update —seconds 60 —hitcount $1 -j DROP
  iptables-save >/etc/iptables.up.rules

  # Save what you have done
  iptables-save > /etc/iptables.up.rules
  iptables-restore < /etc/iptables.up.rules
}
alias houzez="$HOME/www/houzez.local"



function pullall() {
  echo -ne "\n\e[33m\e[1mPulling... .dotfiles\e[39m\e[0m\n";
  dotf; git pull;
  echo -ne "\n\e[33m\e[1mPulling... .atom\e[39m\e[0m\n";
  atm; git pull;
  echo -ne "\n\e[33m\e[1mPulling... reproduction-gallery.com\e[39m\e[0m\n";
  repro; git pull;
  echo -ne "\n\e[33m\e[1mPulling... repro-gallery-master\e[39m\e[0m\n";
  repronew; git pull;
  echo -ne "\n\e[33m\e[1mPulling... goldfishcreativethailand.com\e[39m\e[0m\n";
  gold; git pull;
  echo -ne "\n\e[33m\e[1mPulling... luxurypropertiespattaya.com\e[39m\e[0m\n";
  lux; git pull;
  echo -ne "\n\e[33m\e[1mPulling... affiliate.luxurypropertiespattaya.com\e[39m\e[0m\n";
  luxaffi; git pull;
  echo -ne "\n\e[33m\e[1mPulling... houzez.local\e[39m\e[0m\n";
  houzez; git pull;
  cd ~;
  echo -ne "\n";
}

function pushall() {
  echo -ne "\n\e[33m\e[1mPushing... .dotfiles\e[39m\e[0m\n";
  dotf; add; commit; push;
  echo -ne "\n\e[33m\e[1mPushing... .atom\e[39m\e[0m\n";
  atm; add; commit; push;
  echo -ne "\n\e[33m\e[1mPushing... reproduction-gallery.com\e[39m\e[0m\n";
  repro; add; commit; push;
  echo -ne "\n\e[33m\e[1mPushing... repro-gallery-master\e[39m\e[0m\n";
  repronew; add; commit; push;
  echo -ne "\n\e[33m\e[1mPushing... goldfishcreativethailand.com\e[39m\e[0m\n";
  gold; add; commit; push;
  echo -ne "\n\e[33m\e[1mPushing... luxurypropertiespattaya.com\e[39m\e[0m\n";
  lux; add; commit; push;
  echo -ne "\n\e[33m\e[1mPushing... affiliate.luxurypropertiespattaya.com\e[39m\e[0m\n";
  luxaffi; add; commit; push;
  echo -ne "\n\e[33m\e[1mPushing... houzez.local\e[39m\e[0m\n";
  houzez; add; commit; push;
  cd ~;
  echo -ne "\n";
}

function screenshots_folder() {
  defaults write com.apple.screencapture location $1
  killall SystemUIServer
}

function screenshot_type() {
  defaults write com.apple.screencapture type $1
  killall SystemUIServer
}

function toggle_single_app() {
  is_active=`defaults read com.apple.dock single-app`

  if [[ $is_active == 1 ]]; then
    new_status=false
  else;
    new_status=true
  fi

  defaults write com.apple.dock single-app -bool $new_status; killall Dock
}

function toggle_quickview_copy() {
  is_active=`defaults read com.apple.finder QLEnableTextSelection`

  if [[ $is_active == 1 ]]; then
    new_status=false
  else;
    new_status=true
  fi

  defaults write com.apple.finder QLEnableTextSelection -bool $new_status; killall Finder
}

function toggle_window_effect() {
  is_active=`defaults read NSGlobalDomain NSAutomaticWindowAnimationsEnabled`

  if [[ $is_active == 1 ]]; then
    new_status=false
  else;
    new_status=true
  fi

  defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool $new_status
}

function toggle_floating_viewer() {
  is_active=`defaults read com.apple.helpviewer DevMode`

  if [[ $is_active == 1 ]]; then
    new_status=false
  else;
    new_status=true
  fi

  defaults write com.apple.helpviewer DevMode -bool $new_status
}

function show_calendar() {
  if [[ $# != 2 ]]; then
    echo -ne "usage: month[MM] year[YYYY]\n"
    return 0
  fi

  cal $1 $2
}


# function toggle_browser_editor() {
#   data:text/html, <html contenteditable>
# }
alias brpt="cd ~/www/buyrentpropertythailand.com"
alias download="it2dl"
alias preview="imgcat"
alias hh="echo $HOME"
alias backpack="cd ~/www/backpack.local"

function phpversion() {
  php -v 2&> /dev/null | egrep "^PHP\s?[0-9\.]+" -io 2&> /dev/null | egrep "[0-9\.]+" -io 2&> /dev/null
}
