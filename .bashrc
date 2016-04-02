alias ls="ls --color=auto"
alias rm="trash"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias c="clear"
alias gs="git status"
alias gp="git push"
alias gpl="git pull"
alias gc="git clone"
alias tag="ctags -R -f .git/tags ."
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias fuck='sudo $(history -p \!\!)'
alias gvd='echo Margo houd je bek'

export EDITOR=vim
export TERMINAL=urxvt
export BROWSER=google-chrome
export GOPATH=$HOME/.go
export GOROOT=/usr/local/go
export PATH=$GOPATH/bin:$GOROOT/bin:~/bin:/sbin:/usr/local/sbin:/usr/sbin:$PATH
export WORKON_HOME=/home/koen/venvs
export PROJECT_HOME=/home/koen/projects

# Set the title of X terminals
if [[ $TERM =~ "xterm|*rxvt*" ]]; then
    # set -o functrace
    trap 'set_title' DEBUG
fi

# Function to run a certain command multiple times
function run(){
    number=$1
    shift
    for i in `seq $number`; do
        $@
    done
}

function getlink(){
    pastebinit -i $1 -b http://pastebin.com | xclip -selection clipboard
}

function openpdf(){
    evince $1 & disown
}

function cyanide(){
    display "$(wget -q http://explosm.net/comics/random/ -O - | grep -Po 'http://www.explosm.net/db/files/Comics/*/[^"]+(png|jpg|jpeg)')";
}

function extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2) tar xvjf $1 ;;
            *.tar.gz) tar xvzf $1 ;;
            *.bz2) bunzip x $1 ;;
            *.rar) unrar x $1 ;;
            *.gz) tar xvf $1 ;;
            *.tbz2) tar xvjf $1 ;;
            *.tgz) tar xvzf $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *.7z) 7z x $1 ;;
            *) echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

eval $(keychain --quiet --eval --agents ssh ~/.ssh/github)
