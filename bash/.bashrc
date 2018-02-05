alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias c="clear"
alias tag="ctags -R ."
alias update="sudo apt update"
alias upgrade="sudo apt full-upgrade"
alias v=nvim

export EDITOR=nvim
export TERMINAL=urxvt
export BROWSER=google-chrome
export WORKON_HOME=/home/koen/venvs
export PROJECT_HOME=/home/koen/projects
export SPARK_HOME=/usr/local/spark
export PYENV_ROOT=~/.pyenv
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export PATH=$PYENV_ROOT/bin:~/.local/bin:~/bin:/sbin:/usr/local/sbin:/usr/sbin:$PATH
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Set the title of X terminals
if [[ $TERM =~ "xterm|*rxvt*" ]]; then
    # set -o functrace
    trap 'set_title' DEBUG
fi

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

eval $(keychain --quiet --eval ~/.ssh/github)
if [ -f $(which powerline-daemon) ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . ~/.pyenv/versions/3.6.4/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
fi
