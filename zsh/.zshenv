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

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
