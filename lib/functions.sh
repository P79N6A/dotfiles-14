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


gitcm() {
  msg='upload'
  if [[ $# == 1 ]]; then
    msg=$1; shift
  fi

  git add .; git commit -m $msg $*
}

gitcam() {
  msg='upload'
  if [[ $# == 1 ]]; then
    msg=$1; shift
  fi

  git add .; git commit -am $msg $*
}

gitsl() {
  git status
}
gitss() {
  git status --short
}
gitsth() {
  git stash $*
}
gitchk() {
  git checkout $*
}
gitre() {
  git reset $*
}

gitph() {
  git push $*
}
gitpl() {
  git pull $*
}





source "$DOTFILES_PATH/lib/laravel.sh"
