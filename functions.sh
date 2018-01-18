#!/bin/bash

check_git() {
  gitrepo=$(git worktree list &>/dev/null; echo "$?")
  if [[ $gitrepo == 0 ]]; then
    gitbranch="$(git show-branch --current | grep -E '\[.+\]' -io | perl -pe 's/(\[|\])//g')"
    gitstatus="$(git status -s)"
    if [[ -z $gitstatus ]]; then
      gitstatus=''
    else
      gitstatus=' !!'
    fi
    export PS1="$PURPLE\w$R $CYAN[$gitbranch$gitstatus]$R \n\$ "
    export PS2="> "
  else
    export PS1="$PURPLE\w$R \n\$ "
    export PS2="> "
  fi
}

cmd() {
  command -v $1
}

ver() {
  $1 --version
}

flushdns() {
  (sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder && say -f in "Cache flushed")
}

home() {
  cd $HOME && [[ $# > 0 ]] && cd "./${*}"
}

atom() {
  cd $HOME/.atom && [[ $# > 0 ]] && cd "./${*}"
}

dotf() {
  cd $HOME/.dotfiles && [[ $# > 0 ]] && cd "./${*}"
}

www() {
  cd $HOME/www && [[ $# > 0 ]] && cd "./${*}"
}

proj() {
  cd $HOME/projects && [[ $# > 0 ]] && cd "./${*}"
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

gitclone() {
  if [[ $# == 0 ]]; then
    printf "${Red}RED${ResetColor}"
    return 1
  fi

  repo=$1; shift
  target_dir=$1; shift
  git clone https://github.com/$repo $target_dir $*
}
