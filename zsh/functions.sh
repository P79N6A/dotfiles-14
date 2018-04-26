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
        git push origin $*
    fi
}

function git_pull() {
    if [[ $# == 0 ]]; then
        git pull
    else
        git pull origin $*
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
