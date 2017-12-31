#!bin/bash

git_clone() {
  if [[ $# == 0 || $# > 2 ]]; then
    echo -e 'usage: repository [target_dir]'
    complete 1
  fi

  repository="$1"; shift
  target_dir="$1"; shift

  git clone $repository $target_dir
}


git_show() {
  head=0
  if [[ $# == 1 ]]; then
    head=$1; shift
  fi
  git show --pretty="format:" --name-only HEAD~$head
}

git_sha() {
  git show-ref HEAD -s
}
