#!/bin/bash

# # GIT_PROMPT_ONLY_IN_REPO=1
# # source /usr/local/opt/bash-git-prompt/share/gitprompt.sh

# # Detect which `ls` flavor is in use
# if ls --color > /dev/null 2>&1; then # GNU `ls`
#   colorflag="--color"
#   export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
# else # macOS `ls`
#   colorflag="-G"
#   export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
# fi

# source ~/.bash-powerline.sh

# alias atomupdate="(cd $HOME/.atom && git add . && git commit -m 'update' && git push -f)"
# alias rename='mv -v'
# alias h?='history | grep'
# alias c?='clear'
# alias r?="clear && exec $SHELL -l"
# alias ls="ls -lA"
# # alias ls="ls -lA ${colorflag}"
# alias l="ls -lAhF ${colorflag}"
# alias la="ls -1AhF ${colorflag}"
# alias ld="ls -lAhF ${colorflag} | grep --color=never '^d'"
# alias ls="command ls ${colorflag}"

# # Always enable colored `grep` output
# # Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
# alias grep='grep --color=auto'
# alias fgrep='fgrep --color=auto'
# alias egrep='egrep --color=auto'

# # Get week number
# alias week='date +%V'

# # Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
# alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# # Google Chrome
# # alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
# # alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'

# # IP addresses
# # alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
# # alias localip="ipconfig getifaddr en0"
# # alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# # Clean up LaunchServices to remove duplicates in the “Open With” menu
# alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# # Trim new lines and copy to clipboard
# alias copy="tr -d '\n' | pbcopy"

# # Recursively delete `.DS_Store` files
# alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# # Empty the Trash on all mounted volumes and the main HDD.
# # Also, clear Apple’s System Logs to improve shell startup speed.
# # Finally, clear download history from quarantine. https://mths.be/bum
# alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# # URL-encode strings
# alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# # Merge PDF files
# # Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
# alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# # PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
# alias plistbuddy="/usr/libexec/PlistBuddy"

# # Airport CLI alias
# alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'

# # Intuitive map function
# # For example, to list all directories that contain a certain file:
# # find . -name .gitattributes | map dirname
# alias map="xargs -n1"

# # Make Grunt print stack traces by default
# command -v grunt > /dev/null && alias grunt="grunt --stack"

# # Lock the screen (when going AFK)
# alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# # Print each PATH entry on a separate line
# alias path='echo -e ${PATH//:/\\n}'

# function vag() {
#   (cd "${HOME}/Homestead" && vagrant $*)
# }

# function flushdns() {
#   sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder && say -f in "Cache flushed"
# }

# if [ -f $(brew --prefix)/etc/bash_completion ]; then source $(brew --prefix)/etc/bash_completion; fi
