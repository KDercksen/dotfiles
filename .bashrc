alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias c="clear"

export PATH=~/bin:/sbin:/usr/local/sbin:/usr/sbin:$PATH

if [ -e /usr/games/fortune ] && [ -e /usr/games/cowsay ]; then
    fortune -o | cowsay
    echo " "
fi
