export DOTFILES="$HOME/.dotfiles"
export ZSHFILES="$HOME/.dotfiles/oh-my-zsh"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export HOMEBREW_NO_EMOJI="1"
export MAILCHECK="-1"
export TERM="xterm-256color"
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;32"
export HISTCONTROL="ignoreboth:erasedups"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE="1000"
export PYTHONIOENCODING="UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export MANPAGER="less -X"
export MANPATH="/usr/local/man:$MANPATH"
export GPG_TTY="$(tty)"
export EDITOR="Atom"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export NAME="nopphasinara"
export EMAIL="nopphasin.arayasirikul@gmail.com"
export GIT_CONFIG_NOSYSTEM=1
export GIT_AUTHOR_NAME=$NAME
export GIT_COMMITTER_NAME=$NAME
export GIT_AUTHOR_EMAIL=$EMAIL
export GIT_COMMITTER_EMAIL=$EMAIL
export GIT_SSL_KEY="$HOME/.ssh/id_rsa"
export ARCHFLAGS="-arch x86_64"
export BREW_PREFIX="`brew --prefix`"
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export PATH="$HOME/.composer/vendor/bin:/usr/local/Cellar:$PATH"

export PS1="\u on \w\n$ "


alias home="cd ~/"

alias ls="exa -l -h -a --git --color=always --group-directories-first"
alias tree="ls -T"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

