#!/bin/bash

lib_dir="$HOME/.dotfiles/lib"
install="`cat "$HOME/install.log" 2>&1 | grep -E "^is_install\=" -i | perl -pe s/is_install\=//g`"

if [[ -z $install || $install == '' || $install > 1 ]]; then
  install=0
fi

if [[ $install != 1 ]]; then
  sources=("$lib_dir/exrc $lib_dir/gemrc $lib_dir/npmrc $lib_dir/vimrc $lib_dir/profile $lib_dir/bashrc")

  for source_file in $sources; do
    if [[ -e $source_file ]]; then
      target_name="`basename $source_file`"
      target_file="$HOME/.$target_name"

      if [[ -e $target_file ]]; then
        sudo cp $target_file "$lib_dir/$target_name-bak"
      fi

      sudo cp $source_file "$HOME/.$target_name"
    fi
  done

  echo -e "is_install=1" > "$HOME/install.log"
  # echo -e "Install completed"
fi
