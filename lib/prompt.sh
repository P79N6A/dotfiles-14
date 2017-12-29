#!bin/bash

let is_dirty branch status user host dir ps1 ps2 untracked unstaged uncommitted unstashed

prompt() {
  local ref index
  local flags='--porcelain --ignore-submodules=dirty --untracked-files=no'

  is_dirty=''
  branch=''
  status=''
  untracked=''
  unstaged=''
  uncommitted=''
  unstashed=''

  ref="$(git symbolic-ref HEAD 2> /dev/null)"
  if [[ $? != 0 ]]; then
    ref="$(git rev-parse --short HEAD 2> /dev/null)"
    [[ $? != 0 ]] && ref=''
  fi

  branch="$(echo $ref | grep -e [^\/]*$ -io)"
  [[ $branch ]] && branch="  ${branch}"

  # [[ -n `git status ${FLAGS} 2> /dev/null | tail -n1` ]] && is_dirty=1

  index="$(git status --short --porcelain -b 2> /dev/null)"
  [[ `echo "$index" | grep -E '^\?\? '` ]] && untracked=1 && is_dirty=1
  [[ `echo "$index" | grep -E '^[A-Z][A-Z] '` ]] && uncommitted=1 && unstaged=1 && is_dirty=1
  [[ `echo "$index" | grep -E '^ [A-Z] '` ]] && unstaged=1 && is_dirty=1
  [[ `echo "$index" | grep -E '^[A-Z]  '` ]] && uncommitted=1 && is_dirty=1

  [[ $untracked ]] && untracked='?'
  [[ $uncommitted ]] && uncommitted='+'
  [[ $unstaged ]] && unstaged='!'
  [[ $unstashed ]] && unstashed='⁉'

  [[ $is_dirty = 1 ]] && status+=' '
  status+="${untracked}"
  status+="${unstaged}"
  status+="${uncommitted}"
  status+="${unstashed}"

  prompt_update;
}

prompt_update() {
  user="\u"
  host=""
  # host=" at \h"
  dir=" [ \w]"
  ps1=" "
  ps2=" "

  PS1="${user}${host}${dir}${branch}${status}";
  PS1+="\n";
  PS1+="${ps1}";
  export PS1;

  PS2="${ps2}";
  export PS2;
}

set_prompt() {
  export PROMPT_COMMAND="prompt"
}
