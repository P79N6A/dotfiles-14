#!/bin/bash

npml() {
  re='^[0-9]+$'

  global=''
  depth=''
  while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do
    case $1 in
      -d | --depth)
        shift;
        if [[ -n $1 ]]; then
          if [[ `is_numeric $1` == 0 ]]; then
            printf "\n${RED}[-d | --depth] Must be a numeric value${R}\n\n"; return 1
          else
            depth='--depth='$1
          fi
        fi
        ;;
      -g | --global)
        global='-g' ;;
      --)
        shift ;;
    esac; shift
  done
  npm list $global $depth
}
