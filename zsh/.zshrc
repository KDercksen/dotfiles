ZSH_THEME="agnoster"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DEFAULT_USER="$(whoami)"

plugins=(
  colored-man-pages
  colorize
  command-not-found
  extract
  git
  github
  vi-mode
  virtualenv
  tmux
  tmuxinator
)

export BROWSER=google-chrome
export EDITOR=nvim
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export PATH=$PYENV_ROOT/bin:~/.local/bin:~/bin:/sbin:/usr/local/sbin:/usr/sbin:/usr/local/cuda/bin:$PATH
export PYENV_ROOT=~/.pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export TERMINAL=st
export XDG_CONFIG_HOME=/home/koen/.config
export ZSH=/home/koen/.oh-my-zsh

alias c="clear"
alias cmpv="mpv --no-audio-display"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias m=neomutt
alias ra=ranger
alias tag="ctags -R ."
alias update="sudo apt update"
alias upgrade="sudo apt full-upgrade"
alias v=nvim

source $ZSH/oh-my-zsh.sh

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
