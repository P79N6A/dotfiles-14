## OTHERS
## -------------------------------------------------- ##
function check_required_packages() {
  local install=0
  local commands=""

  # Check command-toolbar folder
  local COMMAND_TOOLBAR_DIR='/Users/Shared/CommandToolbar'
  if [[ ! -e $COMMAND_TOOLBAR_DIR ]]; then
    ln -s ~/.dotfiles $COMMAND_TOOLBAR_DIR
  fi

  if [[ "$(command -v exa 2> /dev/null)" == '' ]]; then
    install=1;
    commands+="\\\n"
    commands+="brew install exa;"
  fi

  if [[ "$(command -v terminal-notifier 2> /dev/null)" == '' ]]; then
    install=1;
    commands+="\\\n"
    commands+="brew install terminal-notifier;"
  fi

  if [[ "$(command -v docker-langserver 2> /dev/null)" == '' ]]; then
    install=1
    commands+="\\\n"
    commands+="npm install -g dockerfile-language-server-nodejs;"
  fi

  if [[ "$(command -v antigen 2> /dev/null)" == '' ]]; then
    install=1
  fi

  if [[ install == 1 ]]; then
    echo -ne "\nInstall required packages...\n"

    # curl -L git.io/antigen > "$ZSHFILES/lib/antigen.zsh"
    if [[ ! -f "$ZSHFILES/lib/antigen.zsh" ]]; then
      curl https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > "$ZSHFILES/lib/antigen.zsh"
    fi
    source "$ZSHFILES/lib/antigen.zsh"

    "`$commands`"
  fi
}

function reload_shell() {
  clear && exec $SHELL -l && load_sources
}

function load_sources() {
  source $ZSHFILES/exports.sh && source $ZSHFILES/functions.sh && source $ZSHFILES/alias.sh
}

function home() {
  cd $HOME && [[ $# > 0 ]] && cd "./${*}"
}

function atm() {
  cd $HOME/.atom && [[ $# > 0 ]] && cd "./${*}"
}

function dotf() {
  cd $HOME/.dotfiles && [[ $# > 0 ]] && cd "./${*}"
}

function www() {
  cd $HOME/www

  function lav() {
    cd laravel.local
  }

  function lpp() {
    cd luxurypropertiespattaya.com
  }

  function repron() {
    cd repro-gallery-master
  }

  function repro() {
    cd reproduction-gallery.com
  }

  if declare -f $1 > /dev/null
  then
    "$@"
    return 0
  else
    for i in $*; do
      if [[ -e $i ]]; then
        cd $i
      else
        echo -e "Directory name '${i}' not exists"
        return 0
      fi
    done

    return 0
  fi
}

function copy() {
  if [[ $# > 0 && $1 == '-e' ]]; then
    pbcopy -Prefer txt
  else
    perl -pe "s/(\r|\n)$//g" | pbcopy -Prefer txt
  fi
}

function ip() {
  my_ip="`dig +short myip.opendns.com @resolver1.opendns.com`"
  echo $my_ip | copy | echo $my_ip
}

function flushdns() {
  (
    sudo dscacheutil -flushcache &&
    sudo killall -HUP mDNSResponder &&
    say -f in "Cache flushed"
  )
}


## GIT
## -------------------------------------------------- ##
# function git_prompt_info() {
#
# }

function git_add() {
    local file="${1:=.}"
    [[ $# > 1 ]] && shift;
    git add $file
}

function git_commit() {
    local message="${1:=Update source}"
    [[ $# > 1 ]] && shift;
    git commit -m $message
}

function git_push() {
    if [[ $# == 0 ]]; then
        git push
    else
        git push $*
    fi
}

function git_pull() {
    if [[ $# == 0 ]]; then
        git pull
    else
        git pull $*
    fi
}

function git_add_commit() {
    files="."
    message="Initial commit"

    function _argv=()

    for item in $*; do
        if [[ $1 == '-f' ]]; then
            shift; files="$1"
        elif [[ $1 == '-m' ]]; then
            shift; message="$1"
        else
            _argv+=" $1 "; shift
        fi
    done

    git add $files && git commit -m $message
}

function gitraw() {
  local url=''
  [[ $# > 0 ]] && url=$1; shift
  local file=''
  [[ $# > 0 ]] && file=$1; shift

  if [[ -n $url && -z $file ]]; then
    file="$(basename ${url})"
  fi

  if [[ -z $file || -z $url ]]; then
    echo -ne "
    usage: file_url [filename]
    "; return 1
  fi

  wget https://raw.githubusercontent.com/$url/$file -O $file $*
}

function newbranch () {
  local name exists count matches current_branch source_branch

  if [[ $# == 0 ]]; then
    echo "
usage: branch_name [source_branch=master]
"; return 1
  fi

  name=$1; shift

  current_branch=`git status -bs | perl -pe s/\#\#\ //gi | egrep '^[^\.]+' -o`
  if [[ -z $1 ]]; then
    source_branch=$current_branch
  else
    source_branch=$1
  fi

  count=`git branch -l | grep -w "$name" -c`
  exists=`git branch -l | grep -w "$name" -i`
  matches=0
  if [[ $count > 0 ]]; then
    echo $exists
    echo
    for (( i = 1; i <= $count; i++ )); do
      existss=`git branch -l | grep -w "$name" -i | head -n $i | tail -n 1 | perl -pe s/\ //gi`
      if [[ $name == $existss ]]; then
        matches=1
        break
      fi
    done
  fi

  echo "
creating new branch...$name
"

  if [[ $current_branch != $source_branch ]]; then
    git checkout $source_branch
    git fetch origin -a
    git pull origin $source_branch
  fi

  if [[ $matches == 1 ]]; then
    git branch -D $name
    git add .
    git commit -m "Delete branch $name and replace new branch from current"
  fi

  git branch $name

  git checkout $name
}


## LARAVEL
## -------------------------------------------------- ##



## COMPOSER
## -------------------------------------------------- ##


## NPM
## -------------------------------------------------- ##


## ATOM
## -------------------------------------------------- ##


## BREW
## -------------------------------------------------- ##
function brewclean() {
  brew update && brew upgrade && brew prune && brew cleanup && brew doctor
}


## GEM
## -------------------------------------------------- ##
function gd.() {
  sudo gem search --details ^$1$
}
function ig.() {
  sudo gem install $* --no-ri --no-rdoc --no-document --backtrace --verbose --quiet
}
function ug.() {
  sudo gem uninstall $* --backtrace --verbose --quiet
}
function gg.() {
  sudo gem search $1
}
function ggl.() {
  sudo gem list
}
function upg.() {
  sudo gem update
}


check_required_packages


function install_acmephp() {
  if [[ ! -e $HOME/bin ]]; then
    mkdir $HOME/bin
  fi

  if [[ ! -e $HOME/public_html/.well-known ]]; then
    mkdir $HOME/public_html/.well-known
  fi

  if [[ ! -e $HOME/public_html/.well-known/acme-challenge ]]; then
    mkdir $HOME/public_html/.well-known/acme-challenge
  fi

  check_bin
  cd $HOME/bin

  php -r "copy('https://github.com/acmephp/acmephp/releases/download/1.0.0-beta4/acmephp.phar', 'acmephp.phar');"
  php -r "copy('https://github.com/acmephp/acmephp/releases/download/1.0.0-beta4/acmephp.phar.pubkey', 'acmephp.phar.pubkey');"
  php acmephp.phar --version
}

function acme_request() {
  if [[ $# < 2 ]]; then
    echo 'usage: email domain'; return 1
  fi

  if [[ $# < 3 ]]; then
    check_bin
    cd $HOME/bin

    # acmephp register $1 && acmephp authorize $2 && acmephp check $2 && acmephp request $2
    php acmephp.phar register $1 && php acmephp.phar authorize $2 && php acmephp.phar check $2 && php acmephp.phar request $2
  else
    # acmephp register $1 && acmephp authorize $2 && acmephp check $2 && acmephp request $2
    /usr/bin/php acmephp.phar register $1 && /usr/bin/php acmephp.phar authorize $2 && /usr/bin/php acmephp.phar check $2 && /usr/bin/php acmephp.phar request $2
  fi
}

function acme_renew() {
  if [[ $# < 1 ]]; then
    echo 'usage: domain'; return 1
  fi

  if [[ $# < 2 ]]; then
    check_bin
    cd $HOME/bin

    /usr/bin/php acmephp.phar request $1
  else
    cd $HOME/.dotfiles/bin
    /usr/bin/php acmephp.phar request $1
  fi
}

function check_bin() {
  if [[ ! -e $HOME/bin ]]; then
    mkdir $HOME/bin
  fi
}
