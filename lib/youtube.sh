#!/bin/bash

download_video() {

  [[ -z $1 ]] && printf "${RED}Please enter URL${R}"
  download_url=$1; shift

  youtube-dl --no-mark-watched --yes-playlist --no-part --rm-cache-dir -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -o "~/Downloads/%(title)s.%(ext)s" $download_url $*
}

download_audio() {

  [[ -z $1 ]] && printf "${RED}Please enter URL${R}"
  download_url=$1; shift

  youtube-dl --no-mark-watched --yes-playlist --no-part --rm-cache-dir -x --audio-quality '3' --audio-format 'mp3' -f 'bestaudio[abr>=192][vbr>=192][asr>=44]/best[abr>=192][vbr>=192][asr>=44]/best' -o "~/Downloads/%(title)s.%(ext)s" $download_url $*
}

# https://youtu.be/IWk_d_C1z2E?t=1m28s
