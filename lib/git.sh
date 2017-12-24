#!bin/bash

git-clone() {
  if [[ $# == 0 || $# > 2 ]]; then
    echo -e 'usage: repository [target_dir]'
    complete 1
  fi

  repository="$1"; shift
  target_dir="$1"; shift

  git clone $repository $target_dir
}
