function settitle() {
    if [[ $# -eq 0 ]]; then
        eval set -- "\\u@\\h: \\w"
    fi

    case $TERM in
      xterm*)
      local title="\[\033]0;$@\007\]"
      ;;
      *)
      local title=''
    esac

    local prompt=$(echo "$PS1" | sed -e 's/\\\[\\033\]0;.*\\007\\\]//')

    PS1="${title}${prompt}"
}

# precmd () { print -Pn "\e]0;$TITLE\a" }
# title() { export TITLE="$*" }

# printf "\033];%s\07\n" "hello world"
ZSH_THEME_TERM_TAB_TITLE_IDLE="%15c"
ZSH_THEME_TERM_TITLE_IDLE="%n at %m"
