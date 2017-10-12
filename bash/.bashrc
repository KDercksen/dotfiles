alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias c="clear"
alias tag="ctags -R ."
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias fuck='sudo $(history -p \!\!)'

export EDITOR=vim
export TERMINAL=urxvt
export BROWSER=google-chrome
export PATH=~/.local/bin:~/bin:/sbin:/usr/local/sbin:/usr/sbin:$PATH
export WORKON_HOME=/home/koen/venvs
export PROJECT_HOME=/home/koen/projects
export SPARK_HOME=/usr/local/spark
export PYTHONPATH=/home/koen/.local/lib/python3.6/site-packages:$PYTHONPATH
export JAVA_HOME=/usr/lib/jvm/java-8-oracle

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

eval $(keychain --quiet --eval ~/.ssh/github)
if [ -f $(which powerline-daemon) ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . ~/.local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
fi
