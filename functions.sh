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

apmi() {
  apm install $*
}
apmun() {
  apm uninstall $*
}
apms() {
  apm search $1
}
apminfo() {
  apm view $1
}
apml() {
  apm list -b $* | perl -pe "s/(\@.+$|^.+\ )//g" | tail +1
}

npmi() {
  npm install $*
}
npmun() {
  npm uninstall $*
}
npms() {
  npm search $1
}
npminfo() {
  npm view $1
}


getgem() {
  gem list | grep -E '^\S+' -io
}
getbrew() {
  brew list | perl -pe 's/\t//g'
}
getcomp() {
  composer global show | grep -E '^\S+' -io
}
getapm() {
  apm list -i | grep -E '\s\S+' -io | perl -pe 's/^\s//g' | perl -pe 's/\@.+$//g' | tail +4
}
getnpm() {
  npm list -g --depth 0 | perl -pe 's/^.+\ //g' | perl -pe 's/\@[a-zA-Z0-9\.\-]+$//g' | tail +2
}
genlog() {
  printf "${GREEN}Generating log files...${R}\n\n"

  getgem 1>$DOTFILES/gem.log
  getbrew 1>$DOTFILES/brew.log
  getcomp 1>$DOTFILES/composer.log
  getapm 1> $DOTFILES/apm.log
  getnpm 1> $DOTFILES/npm.log
}

pushdotf() {
  (cd $HOME/.dotfiles; git add .; git commit -m 'upload'; git push origin master)
}

pushatom() {
  (cd $HOME/.atom; git add .; git commit -m 'upload'; git push origin master)
}

push() {
  msg=''; repo=''

  if [[ $# < 2 ]]; then
    echo "usage: target_dir messages [remote:origin] [branch:master]"
    return 50
  fi

  repo=$1; shift
  msg=$1; shift

  (cd $repo; git add .; git commit -m $msg; git push $*)
}

ll() {
  if [[ $# == 0 ]]; then
    printf "usage: file\n"
    return 1
  fi

  file=$1; shift
  if [[ ! -e $file ]]; then
    printf "File not exists\n"
    return 1
  fi

  total_lines="$(cat -b $file | grep -E '\S+' -ic)"
  begin_line=1
  line_to_get=1
  _coproc=0
  _exec=''
  _argv=()
  if [[ $1 =~ ^- && $1 == '-e' ]]; then
    shift; _exec=$*; _coproc=1
  fi

  for (( i = 1; i <= $total_lines; i++ )); do
    _argv+="`tail +$i $file | head -1` "
  done

  if [[ $_coproc == 1 ]]; then
    $_exec $_argv
  else
    echo $_argv | perl -pe 's/\s/\n/g'
  fi
}

install_facebook() {
  composer global require facebook/graph-sdk
}

install_react() {
  npm install -g react-devtools
}

install_graphql() {
  composer global require webonyx/graphql-php
  composer global require ivome/graphql-relay-php
}

install_merlin() {
  opam install merlin
  opam user-setup install
  yarn global add flow-typed
}

pullatom() {
  _follow=0
  _argv=()

  for item in $*; do
    if [[ $item == '--follow' ]]; then
      _follow=1
    else
      _argv+=" $item"
    fi
  done

  (cd $HOME/.atom; git pull $_argv)

  if [[ $_follow == 1 ]]; then
    cd $HOME/.atom
  fi
}

pulldotf() {
  _follow=0
  _argv=()

  for item in $*; do
    if [[ $item == '--follow' ]]; then
      _follow=1
    else
      _argv+=" $item"
    fi
  done

  (cd $HOME/.dotfiles; git pull $_argv)

  if [[ $_follow == 1 ]]; then
    cd $HOME/.dotfiles
  fi
}


push() {
  files='.'
  messsage='upload'
  origin='origin master'
  if [[ -n $1 ]]; then
    files=$1; shift
  fi

  if [[ -n $1 ]]; then
    message=$1; shift
  fi

  if [[ -n $1 ]]; then
    origin=$1; shift
  fi

  git add $files
  git commit -m $messsage
  git push $origin
}


copy() {
  perl -pe "s/(\r|\n)$//g" | pbcopy
}
