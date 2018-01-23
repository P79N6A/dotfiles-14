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
  apm list $*
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

mdb2xls() {
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'บัญชีพยานประเด็น' 1> $HOME'/.dotfiles/bin/บัญชีพยานประเด็น.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'บัญชีรับประเด็น' 1> $HOME'/.dotfiles/bin/บัญชีรับประเด็น.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'Paste Errors' 1> $HOME'/.dotfiles/bin/Paste Errors.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'บัญชีพยาน' 1> $HOME'/.dotfiles/bin/บัญชีพยาน.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'Table2' 1> $HOME'/.dotfiles/bin/Table2.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'การนัดความ' 1> $HOME'/.dotfiles/bin/การนัดความ.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ของกลาง' 1> $HOME'/.dotfiles/bin/ของกลาง.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'อาชีพ' 1> $HOME'/.dotfiles/bin/อาชีพ.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ครบผัดฟ้อง' 1> $HOME'/.dotfiles/bin/ครบผัดฟ้อง.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ความเห็นพนักงานสอบสวน' 1> $HOME'/.dotfiles/bin/ความเห็นพนักงานสอบสวน.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'คำพิพากษา ส11' 1> $HOME'/.dotfiles/bin/คำพิพากษา ส11.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'คำสั่งคดี' 1> $HOME'/.dotfiles/bin/คำสั่งคดี.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'คำสั่งคดีส1' 1> $HOME'/.dotfiles/bin/คำสั่งคดีส1.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'คำสั่งฎีกา' 1> $HOME'/.dotfiles/bin/คำสั่งฎีกา.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'คำสั่งอุทธรณ์' 1> $HOME'/.dotfiles/bin/คำสั่งอุทธรณ์.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ชั้นฎีกา' 1> $HOME'/.dotfiles/bin/ชั้นฎีกา.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ชั้นฎีกาของจำเลย' 1> $HOME'/.dotfiles/bin/ชั้นฎีกาของจำเลย.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ชั้นอุทธรณ์ของจำเลย' 1> $HOME'/.dotfiles/bin/ชั้นอุทธรณ์ของจำเลย.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ชั้นอุทรธณ์' 1> $HOME'/.dotfiles/bin/ชั้นอุทรธณ์.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ชื่อผู้เสียหาย' 1> $HOME'/.dotfiles/bin/ชื่อผู้เสียหาย.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ตำบล' 1> $HOME'/.dotfiles/bin/ตำบล.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ที่อยู่ของสำนวน' 1> $HOME'/.dotfiles/bin/ที่อยู่ของสำนวน.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'โทษ' 1> $HOME'/.dotfiles/bin/โทษ.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ผู้อุทธรณ์' 1> $HOME'/.dotfiles/bin/ผู้อุทธรณ์.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'รับประเด็น' 1> $HOME'/.dotfiles/bin/รับประเด็น.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'รายการอก5' 1> $HOME'/.dotfiles/bin/รายการอก5.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ส2' 1> $HOME'/.dotfiles/bin/ส2.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ส3' 1> $HOME'/.dotfiles/bin/ส3.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ส่งประเด็น' 1> $HOME'/.dotfiles/bin/ส่งประเด็น.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'สภอ' 1> $HOME'/.dotfiles/bin/สภอ.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'สารบบ ส1' 1> $HOME'/.dotfiles/bin/สารบบ ส1.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'เหตุค้าง' 1> $HOME'/.dotfiles/bin/เหตุค้าง.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'อก5' 1> $HOME'/.dotfiles/bin/อก5.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'อำเภอ' 1> $HOME'/.dotfiles/bin/อำเภอ.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'รับสำนวน ส1' 1> $HOME'/.dotfiles/bin/รับสำนวน ส1.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ชื่ออัยการ' 1> $HOME'/.dotfiles/bin/ชื่ออัยการ.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ชื่อพยาน' 1> $HOME'/.dotfiles/bin/ชื่อพยาน.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'Table1' 1> $HOME'/.dotfiles/bin/Table1.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'คำสั่งคดีส2' 1> $HOME'/.dotfiles/bin/คำสั่งคดีส2.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'จุดประสงค์การนัด' 1> $HOME'/.dotfiles/bin/จุดประสงค์การนัด.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'สัญชาติ' 1> $HOME'/.dotfiles/bin/สัญชาติ.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ประกัน' 1> $HOME'/.dotfiles/bin/ประกัน.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ผลคดี' 1> $HOME'/.dotfiles/bin/ผลคดี.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ประเภทคดี' 1> $HOME'/.dotfiles/bin/ประเภทคดี.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'คำพิพากษา ส1' 1> $HOME'/.dotfiles/bin/คำพิพากษา ส1.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ชื่อผู้พิพากษา' 1> $HOME'/.dotfiles/bin/ชื่อผู้พิพากษา.txt';
  mdb-export -d '\t' $HOME/Desktop/test.mdb 'ชื่อผู้ว่าความ' 1> $HOME'/.dotfiles/bin/ชื่อผู้ว่าความ.txt';
}
