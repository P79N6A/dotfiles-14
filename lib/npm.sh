#!/bin/bash

# Installed: tern angular @angular/router @angular/core @angular/compiler @angular/animations @angular/cli angular-ui-bootstrap @angular/cdk @angular/material protractor @ngtools/webpack@angular-devkit/build-optimizer @angular/flex-layout gulp-angular-templatecache

npml() {
  re='^[0-9]+$'

  global=''
  depth='--depth=0'
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
