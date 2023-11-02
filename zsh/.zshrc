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

export BROWSER=brave-browser
export EDITOR=nvim
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export PYENV_ROOT=~/.pyenv
export PATH=~/.cargo/bin:$PYENV_ROOT/bin:~/.local/bin:~/bin:/sbin:$PATH
export PATH=/usr/local/sbin:/usr/sbin:/usr/local/cuda/bin:$PATH
export PATH=/snap/bin:$PATH
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export TERMINAL=alacritty
export XDG_CONFIG_HOME=/home/koen/.config
export ZSH=/home/koen/.oh-my-zsh
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export TRANSFORMERS_CACHE=/mnt/storage/cache/
export TMPDIR=/home/koen/tmp

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
eval "$(gh completion -s zsh)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


# JINA_CLI_BEGIN

## autocomplete
if [[ ! -o interactive ]]; then
    return
fi

compctl -K _jina jina

_jina() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(jina commands)"
  else
    completions="$(jina completions ${words[2,-2]})"
  fi

  reply=(${(ps:
:)completions})
}

# session-wise fix
ulimit -n 4096
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# JINA_CLI_END



fpath+=${ZDOTDIR:-~}/.zsh_functions
