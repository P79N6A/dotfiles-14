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
  gem_path="`gem environment gempath`"
  gem_home="`echo -e \"${gem_path//:/\\n}\" | head -n1`"

  export GEM_HOME="$gem_home";

  # echo -n 'gem: --bindir /usr/bin'
}


create_global_git_files() {
  files=("$HOME/.gitconfig $HOME/.gitignore")
  for file in $files; do
    basename_file="`basename $file`"
  done
}

