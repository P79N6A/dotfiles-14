#!/bin/bash

export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/node@8/bin:$PATH"


export PS1="\u on \w\\n$ "


alias ls="exa -a -l -h --git"
alias brewi="brew install"
alias npmi="npm install"
alias apmi="apm install"
alias brewun="brew uninstall"
alias npmun="npm uninstall"
alias apmun="apm uninstall"

alias npmfix="npm audit fix"
