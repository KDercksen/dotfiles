ZSH_THEME="spaceship"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
SPACESHIP_VENV_SHOW="false"

plugins=(
  colored-man-pages
  colorize
  command-not-found
  extract
  git
  github
  tmux
  tmuxinator
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
)

export BROWSER=google-chrome
export EDITOR=nvim
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export PYENV_ROOT=~/.pyenv
export PATH=~/.cargo/bin:$PYENV_ROOT/bin:~/.local/bin:~/bin:/sbin:$PATH
export PATH=/usr/local/sbin:/usr/sbin:/usr/local/cuda/bin:$PATH
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
