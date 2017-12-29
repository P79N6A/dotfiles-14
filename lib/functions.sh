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


source "$DOTFILES_PATH/lib/laravel.sh"
source "$DOTFILES_PATH/lib/git.sh"
source "$DOTFILES_PATH/lib/prompt.sh"
