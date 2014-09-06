alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias c="clear"
alias gs="git status"
alias gp="git push"
alias gpl="git pull"
alias gc="git clone"
alias tag="ctags -R -f .git/tags ."

export EDITOR=vim
export TERMINAL=urxvt
export BROWSER=chromium
export GOPATH=$HOME/.go
export GOROOT=/usr/local/go
export PATH=$GOPATH/bin:$GOROOT/bin:~/bin:/sbin:/usr/local/sbin:/usr/sbin:$PATH

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

function py34(){
    source /home/koen/virtualenvs/py34/bin/activate
}

py34
