## OTHERS
## -------------------------------------------------- ##
alias ..="cdup"
alias ...="cdhome"

## LS
## -------------------------------------------------- ##
# alias ls="ls -lAh"
# alias la="ls -1Ah"
# alias lc="ls -CAh"
# alias lf="ls | grep --color=never '^-'"
# alias ld="ls | grep --color=never '^d'"
# alias lr="ls -R"
# alias lsf="ls -L"
# alias lsbysize="ls -S"
# alias lsbytime="ls -t"
# alias lsbin="ls /usr/local/bin"
# alias lsbing="ls /usr/local/bin | grep -E "


## EXA
## -------------------------------------------------- ##
alias ls="exa -l -h -a --color=always --group-directories-first"
alias tree="ls -T"


## GEM
## -------------------------------------------------- ##
alias gem="sudo gem"


## GREP
## -------------------------------------------------- ##
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"


## WORDPRESS
## -------------------------------------------------- ##
alias wpkey="curl -G https://api.wordpress.org/secret-key/1.1/salt/ | pbcopy"


alias h="history | grep -E -i"
alias pbcopy=" pbcopy -Prefer txt"
alias localip="ipconfig getifaddr en0"
alias cleandotds="sudo find . -type f -name '*.DS_Store' -ls -delete"
alias urlencode='python -c"import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias imgopt="jpegoptim"


## CHROME-CLI
## -------------------------------------------------- ##
alias ch="chrome-cli"


## FOLDER
## -------------------------------------------------- ##
alias lav="cd ~/www/laravel.local"
alias repro="cd ~/www/reproduction-gallery.com"
alias repron="cd ~/www/repro-gallery-master"
alias soho="cd ~/www/soho-art.com"
alias abacus="cd ~/www/abacus-gallery.com"
alias reprog="cd ~/www/reproduction-galleries.com"
alias lpp="cd ~/www/luxurypropertiespattaya.com"
alias gct="cd ~/www/goldfishcreativethailand.com"
alias ddt="cd ~/www/devilsdenthailand.com"
alias ddvb="cd ~/www/devilsdenvipbus.com"
alias ddbe="cd ~/www/devilsdenbangkokescorts.com"
alias ddp="cd ~/www/devilsdenpinkdevils.com"
alias pse="cd ~/www/pattayasecretescorts.com"
alias atom-dev="atom --dev"


## GIT
## -------------------------------------------------- ##
alias gits="git status"
alias checkout="git checkout"
alias stash="git stash"
alias status="git status"
alias headreset="git reset HEAD"
commita() {
    git commit -ma $1
}
alias add="_add"
_add() {
    local file="${1:=.}"
    [[ $# > 1 ]] && shift;
    git add $file
}
alias commit="_commit"
_commit() {
    local message="${1:=Update source}"
    [[ $# > 1 ]] && shift;
    git commit -m $message
}
alias push="_push"
_push() {
    if [[ $# == 0 ]]; then
        git push
    else
        git push origin $*
    fi
}
alias pull="_pull"
_pull() {
    if [[ $# == 0 ]]; then
        git pull
    else
        git pull origin $*
    fi
}
alias add-commit="_add_commit"
_add_commit() {
    files="."
    message="Initial commit"

    _argv=()

    for item in $*; do
        if [[ $1 == '-f' ]]; then
            shift; files="$1"
        elif [[ $1 == '-m' ]]; then
            shift; message="$1"
        else
            _argv+=" $1 "; shift
        fi
    done

    git add $files && git commit -m $message
}
alias checkout="git checkout"
alias master='git checkout master'
alias project="_composer_project"
_composer_project() {
    if [[ $# == 0 ]]; then
        echo -e "Please provide package";
        return 1
    fi

    package=''; [[ -n $1 ]] && package=$1; shift
    target_dir=''; [[ -n $1 ]] && target_dir=$1; shift
    version=''; [[ -n $1 ]] && version=$1; shift

    composer create-project $package $target_dir $version $*
}


## NPM
## -------------------------------------------------- ##
alias npmrund="npm run dev"
alias npmrunp="npm run production"


## LARAVEL
## -------------------------------------------------- ##
alias la="php artisan"
alias tkg="(cd ~/www/laravel.local && php artisan tinker)"
alias tk="php artisan tinker"
alias artisan="php artisan"
alias tinker="artisan tinker"
alias passv="echo \"VpjkcV88\" | copy"
