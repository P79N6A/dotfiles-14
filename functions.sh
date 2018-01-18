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

gita() {
  files=.
  if [[ $# > 0 ]]; then
    files=$*
  fi
  git add $files
}

gitcp() {
  if [[ $# == 0 ]]; then
    echo  -e "${Red}Please add messages${ResetColor}"
    return 1
  fi

  msg=$1; shift
  git commit -m $msg; git push $*
}

pushdotf() {
  printf "${GREEN}Generating log files...${R}\n"
  gem list | grep -E '^\S+' -io 1>$DOTFILES/gem.log
  brew list 1>$DOTFILES/brew.log
  composer global show | grep -E '^\S+' -io 1>$DOTFILES/composer.log
  npm list -g --depth 0 | perl -pe 's/^.+\ //g' | perl -pe 's/\@[a-zA-Z0-9\.\-]+$//g' | tail +2 1>$DOTFILES/npm.log

  (cd $HOME/.dotfiles; git add .; git commit -m 'upload'; git push origin master)
}

pushatom() {
  printf "${GREEN}Generating log files...${R}\n"
  apm list -i | grep -E '\s(\S+)$' -io | perl -pe 's/.+\@.+//g' | tail +2 1>$DOTFILES/apm.log

  (cd $HOME/.atom; git add .; git commit -m 'upload'; git push origin master)
}

push() {
  msg=''; repo=''

  if [[ $# < 2 ]]; then
    echo "usage: target_dir messages [remote:origin] [branch:master]"
    return 1
  fi

  repo=$1; shift
  msg=$1; shift

  (cd $repo; git add .; git commit -m $msg; git push $*)
}
