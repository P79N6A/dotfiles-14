#!/bin/bash

if [[ -z $1 ]]; then
  echo "Please enter file name."
else
  FILE="$1"
  shift

  if [[ -z $1 ]]; then
    echo "Please enter file permissions."
  else
    PERM="$1"
    shift

    chmod $PERM "$FILE" $*
  fi
fi
