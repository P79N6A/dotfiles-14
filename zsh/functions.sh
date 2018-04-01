#!/bin/bash
#
# Custom defined functions

check_required_packages() {
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


## OTHERS
## -------------------------------------------------- ##
public_key() {
  cat ~/.ssh/id_rsa.pub
}

foobar() {
  local ref='refs/heads/master'
  echo -e ${ref#refs/heads/}
  # echo -e ${ref//refs\/heads\/}
}

updatenpm() {
  if [[ -n $1 && ($1 == '--global' || $1 == '-g') ]]; then
    npm install -g npm
    npm update -g
  else
    npm install
    npm update
  fi
}

updatecomp() {
  if [[ -n $1 && ($1 == '--global' || $1 == '-g') ]]; then
    composer self-update
    composer global update
  else
    composer self-update
    composer update
  fi
}

updatebrew() {
  if [[ -n $1 && ($1 == '--global' || $1 == '-g') ]]; then
    brew update && brew upgrade
  else
    brew update
  fi
}

sinetv() {
  echo 'wolff91mac@outlook.com:wolff91mac:22Hdbfgur'
}

email() {
  local email_address=''

  result() {
    echo $1
  }

  na() {
    email_address='nopphasin.arayasirikul@gmail.com'
    email result $email_address
  }

  gc() {
    email_address='goldfishcreative.thailand@gmail.com'
    email result $email_address
  }

  fa() {
    email_address='fineartdeveloper@gmail.com'
    email result $email_address
  }

  fd() {
    email_address='fineartdropbox@gmail.com'
    email result $email_address
  }

  if declare -f $1 > /dev/null
  then
    "$@"
    return 0
  else
    echo -e "function name '${1}' not exists"
    return 1
  fi
}

domain() {
  local result
  local domain='goldfishcreativethailand.com'

  if [[ $# == 0 ]]; then
    echo $domain
  else
    for host in $*; do
      if [[ $result != '' ]]; then
        result+="\n"
      fi
      result+="${host}.${domain}"
    done

    echo -ne $result
  fi
}

remote() {
  local host

  if [[ $# == 1 ]]; then
    if [[ $1 == 'hostinger' ]]; then
      ssh -p 65002 u822159201@185.224.137.8
    else
      echo "No remote host"
    fi
  fi
}

reload_shell() {
  clear
  exec $SHELL -l
  load_sources
}

load_sources() {
  source $ZSHFILES/exports.sh
  source $ZSHFILES/functions.sh
  source $ZSHFILES/alias.sh
}

home() {
  cd $HOME && [[ $# > 0 ]] && cd "./${*}"
}

atm() {
  cd $HOME/.atom && [[ $# > 0 ]] && cd "./${*}"
}

dotf() {
  cd $HOME/.dotfiles && [[ $# > 0 ]] && cd "./${*}"
}

www() {
  cd $HOME/www

  lav() {
    cd laravel.local
  }

  lpp() {
    cd luxurypropertiespattaya.com
  }

  repron() {
    cd repro-gallery-master
  }

  repro() {
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

usr() {
  cd /usr && [[ $# > 0 ]] && cd "./${*}"
}

localbin() {
  cd /usr/local/bin && [[ $# > 0 ]] && cd "./${*}"
}

cmd() {
  command -v $1
}

ver() {
  $1 --version
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

copy() {
  if [[ $# > 0 && $1 == '-e' ]]; then
    pbcopy -Prefer txt
  else
    perl -pe "s/(\r|\n)$//g" | pbcopy -Prefer txt
  fi
}

ip() {
  my_ip="`dig +short myip.opendns.com @resolver1.opendns.com`"
  echo $my_ip | copy | echo $my_ip
}

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

flushdns() {
  (
    sudo dscacheutil -flushcache &&
    sudo killall -HUP mDNSResponder &&
    say -f in "Cache flushed"
  )
}

# ll() {
#   if [[ $# == 0 ]]; then
#     printf "usage: file\n"
#     return 1
#   fi
#
#   file=$1; shift
#   if [[ ! -e $file ]]; then
#     printf "File not exists\n"
#     return 1
#   fi
#
#   total_lines="$(cat -b $file | grep -E '\S+' -ic)"
#   begin_line=1
#   line_to_get=1
#   _coproc=0
#   _exec=''
#   _argv=()
#   if [[ $1 =~ ^- && $1 == '-e' ]]; then
#     shift; _exec=$*; _coproc=1
#   fi
#
#   for (( i = 1; i <= $total_lines; i++ )); do
#     _argv+="`tail +$i $file | head -1` "
#   done
#
#   if [[ $_coproc == 1 ]]; then
#     $_exec $_argv
#   else
#     echo $_argv | perl -pe 's/\s/\n/g'
#   fi
# }

newcmd() {
  local cmd="`basename $0`"

  if [[ $# == 0 ]]; then
    _error $cmd "usage: command_name [target_dir]" 1; return
  fi

  local command_name=$1; shift
  local bindir="$DOTFILES/bin"
  local target="${bindir}/${command_name}"

  if [[ -e $target ]]; then
    _error $cmd "Command ${command_name} already exists" 1; return
  fi

  echo -en "#!/bin/bash\n" > $target && chmod -R 755 $target
}


## GENLOGS
## -------------------------------------------------- ##
genlog() {
  printf "${GREEN}Generating log files...${R}\n\n"

  getgem 1>$DOTFILES/gem.log;
  getbrew 1>$DOTFILES/brew.log;
  getcomp 1>$DOTFILES/composer.log;
  getapm 1> $DOTFILES/apm.log;
  getnpm 1> $DOTFILES/npm.log
}

getgem() {
  gem list | grep -E '^\S+' -io
}

getbrew() {
  brew list | perl -pe 's/\t//g'
}

getcomp() {
  composer global show | grep -E '^\S+' -io
}

getapm() {
  apm list -i | grep -E '\s\S+' -io | perl -pe 's/^\s//g' | perl -pe 's/\@.+$//g' | tail +4
}

getnpm() {
  npm list -g --depth 0 | perl -pe 's/^.+\ //g' | perl -pe 's/\@[a-zA-Z0-9\.\-]+$//g' | tail +2
}


## GIT
## -------------------------------------------------- ##
gitraw() {
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

gitclone() {
  if [[ $# == 0 ]]; then
    printf "${Red}RED${ResetColor}"
    return 1
  fi

  repo=$1; shift
  target_dir=$1; shift
  git clone https://github.com/$repo $target_dir $*
}

clonefineart() {
  gitclone fineartdeveloper/$1 $2
}

clonenopphasin() {
  gitclone nopphasinara/$1 $2
}

clonescreen() {
  gitclone screenbeetle/$1 $2
}

pushmaster() {
  _add .
  _commit 'Update source'
  _push origin master
}

pushcurrent() {
  _add .
  _commit 'Update source'
  _push
}

pullmaster() {
  if [[ $# > 0 ]]; then
    origin=$*
  fi

  _pull origin master
}

pullcurrent() {
  _pull
}


## LARAVEL
## -------------------------------------------------- ##
newlaravel() {
  composer create-project laravel/laravel $* --prefer-dist
}

migrate() {
  php artisan migrate $*
}

seed() {
  php artisan db:seed $*
}


## COMPOSER
## -------------------------------------------------- ##
compproject() {
  composer create-project $* --prefer-dist --remove-vcs
}


## NPM
## -------------------------------------------------- ##
n.() {
  npm view $1
}

in.() {
  npm install $*
}

un.() {
  npm uninstall $*
}

nn.() {
  npm search $1
}

npmupdate() {
  npm update -g && npm install -g npm
}


## ATOM
## -------------------------------------------------- ##
a.() {
  apm view $1
}

ia.() {
  apm install $*
}

ua.() {
  apm uninstall $*
}

aa.() {
  apm search $1
}

aal.() {
  apm list -b $* | perl -pe "s/(\@.+$|^.+\ )//g" | tail +1
}


## BREW
## -------------------------------------------------- ##
b.() {
  brew info $1
}

ib.() {
  brew install $*
}

ub.() {
  brew uninstall $*
}

bb.() {
  brew search $1
}

tbb.() {
  brew tap $1
}

bbl.() {
  brew list
}

cleanbrew() {
  brew update
  brew upgrade
  brew prune
  brew cleanup
  brew doctor
}


## GEM
## -------------------------------------------------- ##
g.() {
  sudo gem search --details ^$1$
}
ig.() {
  sudo gem install $* --no-ri --no-rdoc --no-document --backtrace --verbose --quiet
}
ug.() {
  sudo gem uninstall $* --backtrace --verbose --quiet
}
gg.() {
  sudo gem search $1
}
ggl.() {
  sudo gem list
}
upg.() {
  sudo gem update
}
