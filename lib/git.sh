#!bin/bash

git_commit_push() {
  message='upload'
  push=''
  flag='0'
  while [[ $1 =~ ^- && ! $1 == '--' ]]; do
    case $1 in
      -m | --message )
        shift; message="$1" ;;
      -p | --push )
        shift; push="$1"; flag=1 ;;
      -- )
        shift ;;
    esac; shift
  done

  git add .
  git commit -m "$message"
  if [[ $flag == 1 ]]; then
    git push $push
  fi
}

git_status() {
  if [[ $# == 1 && $1 == '-s' ]]; then
    git status --short
  else
    git status
  fi
}

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

git_diff_stat() {
  git diff --stat
}

git_shortlog() {
  head=''
  if [[ $# == 1 ]]; then
    head="HEAD~$1.."; shift
  fi

  git shortlog $head
}

git_search_commit() {
  message=""
  if [[ $# != 1 ]]; then
    echo -e "Please put some keywords"
    return 1
  else
    message="$1"; shift
  fi

  git log --grep="$message"
}

git_log() {
  ## Commit
  # %H	commit hash
  # %h	(abbrev) commit hash
  # Tree
  # %T	tree hash
  # %t	(abbrev) tree hash
  # Parent
  # %P	parent hash
  # %p	(abbrev) parent hash

  format="%h - %s on %cD %cr by %cn"
  if [[ $# == 1 ]]; then
    format=$1; shift
  fi
  git log --pretty="format:$format"
}

git_report() {
  (git summary && git effort)
}

git_fork() {
  git fork $1
}


gitclone() {
  repo=''
  target=''
  count=0
  flag=0
  for param in $*; do
    if [[ $param =~ ^- && $param == '-s' ]]; then
      flag=1
    else
      count="`expr $count + 1`"
      case $count in
        1 )
          repo=$param ;;
        2 )
          target=$param ;;
      esac
    fi
  done

  if [[ $flag == 1 ]]; then
    git clone git@github.com:$repo $target
  else
    git clone https://github.com/$repo $target
  fi
}

pullatom() {
  cd ~/.atom && git pull
}
pushatom() {
  cd ~/.atom && git_commit_push -p
}

pulldotfiles() {
  cd ~/.dotfiles && git pull
}
pushdotfiles() {
  cd ~/.dotfiles && git_commit_push -p
}
