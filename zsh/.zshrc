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
