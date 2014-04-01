alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias c="clear"
alias sl="sl -e"
alias gs="git status"

export PATH=~/bin:/sbin:/usr/local/sbin:/usr/sbin:$PATH

if [ -e /usr/games/fortune ] && [ -e /usr/games/cowsay ]; then
    fortune -o | cowsay
    echo " "
fi

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
