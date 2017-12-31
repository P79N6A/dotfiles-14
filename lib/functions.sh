#!/bin/bash

install_required_packages() {
  if [[ "`command -v composer 2>/dev/null`" == '' ]]; then
    # Install composer
    selection=''
    echo "Install composer [y/N]? - "
    read selection
    case $selection in
      'y' )
          php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
          php -r "composer-setup.php"
          php -r "unlink('composer.php');"
          sudo mv 'composer.phar' '/usr/local/bin/composer'
        ;;
      'N' ) clear; return;;
    esac
  fi
}

set_gem_home() {
  gem_paths="`gem environment gempath`"
  gem_path="`echo -e \"${gem_paths//:/\\n}\" | head -n1`"

  export GEM_HOME="$HOME/.gem";
  export GEM_PATH="$gem_path"
}


create_global_git_files() {
  files=("$HOME/.gitconfig $HOME/.gitignore")
  for file in $files; do
    basename_file="`basename $file | perl -pe 's/\.//g'`"
    if [[ -e "$DOTFILES_PATH/$basename_file" ]]; then
      cp "$DOTFILES_PATH/$basename_file" "$file"
    fi
  done
}


get_brew_prefix() {
  if [[ $# != 1 ]]; then
    brew --prefix; return 0
  fi

  brew --prefix $1; return 0
}


load_additional_files() {
  source_files=("$HOME/.bashrc $HOME/.exrc $HOME/.gemrc $HOME/.npmrc $HOME/.vimrc $HOME/.ackrc")
  for file in $source_files; do
    basename_file="$(basename $file | perl -pe 's/\.//gi')"

    if [[ -e "$DOTFILES_PATH/$basename_file" && "`cat \"$DOTFILES_PATH/$basename_file\" 2>/dev/null`" != "" ]]; then
      cp "$DOTFILES_PATH/$basename_file" "$file"
    else
      rm -rf $file
    fi
  done
}


_self() {
  if [[ $# == 0 ]]; then
    cd /
  else
    path=''
    for item in $*; do
      path+="$item/"
    done
    cd "./$path"
  fi
}

_parent() {
  path=''

  if [[ $# > 0 ]]; then
    for item in $*; do
      path+="$item/"
    done
  fi

  cd "../$path"
}

_home() {
  path=''

  if [[ $# > 0 ]]; then
    for item in $*; do
      path+="$item/"
    done
  fi

  cd "$HOME/$path"
}


hidden() {
  chflags hidden $*
}

nohidden() {
  chflags nohidden $*
}


foo() {
  version=''
  string=''
  flag='0'

  while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do
    case $1 in
      -V | --version)
        echo $version
        exit
        ;;
      -s | --string)
        shift;
        string=$1
        ;;
      -f | --flag)
        flag=1
        ;;
    esac
    shift
  done

  if [[ "$1" == '--' ]]; then
    shift
  fi

  echo $version
  echo $string
  echo $flag


  # names=( "Aaron Maxwell" "Wayne Gretzky" "David Beckham" "Anderson da Silva" )
  # echo "With default IFS value..."
  # for name in ${names[@]}; do
  #   echo "$name"
  # done
  #
  # echo ""
  # echo "With strict-mode IFS value..."
  # IFS=$'\n\t'
  # for name in ${names[@]}; do
  #   echo "$name"
  # done
}


git_show() {
  head=0
  if [[ $# == 1 ]]; then
    head=$1; shift
  fi
  git show --pretty="format:" --name-only HEAD~$head
}


heredoc() {
  cat <<END
hello world
END
}


reading() {
  echo -n "Proceed? [y/n]: "
  read ans
  echo $ans
  read -n 1 ans # Just one character
}


grep_search() {
  file=\*.php
  grep -RHn --include $file "Controller" "."
}


curdate() {
  date "+DATE: %Y-%m-%d"
}

curtime() {
  date "+TIME: %H:%M:%S"
}


source "$DOTFILES_PATH/lib/colors.sh"
source "$DOTFILES_PATH/lib/laravel.sh"
source "$DOTFILES_PATH/lib/git.sh"
source "$DOTFILES_PATH/lib/prompt.sh"
