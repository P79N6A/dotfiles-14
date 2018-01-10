#!/bin/bash

download_video() {

  [[ -z $1 ]] && printf "${RED}Please enter URL${R}"
  download_url=$1; shift

  youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' $download_url $*
}

download_audio() {

  [[ -z $1 ]] && printf "${RED}Please enter URL${R}"
  download_url=$1; shift

  youtube-dl -f 'bestaudio[ext=mp3]/best' $download_url $*
}
