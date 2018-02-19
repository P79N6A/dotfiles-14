#!/bin/bash

lib_dir="$HOME/.dotfiles/lib"
install="`cat "$HOME/install.log" 2>/dev/null | grep -E "^is_install\=" -i | perl -pe s/is_install\=//g`"

if [[ -z $install || $install == '' || $install > 1 ]]; then
  install=0
fi

install=0

if [[ $install != 1 ]]; then
  sources=("$lib_dir/profile $lib_dir/exrc $lib_dir/gemrc $lib_dir/npmrc $lib_dir/vimrc $lib_dir/bashrc $lib_dir/yarnrc $lib_dir/ocamlinit")

  for source_file in $sources; do
    if [[ -e $source_file ]]; then
      target_name="`basename $source_file`"
      target_file=$HOME/.$target_name

      if [[ -e $target_file ]]; then
        sudo rm -rf $target_file
      fi

      sudo cp -f $source_file $target_file
    fi
  done

  # echo -e "is_install=1" > $HOME/install.log
  # echo -e "Install completed"
fi
