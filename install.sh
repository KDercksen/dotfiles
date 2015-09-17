#!/usr/bin/env bash

set -e

FILES=".xinitrc .tmux.conf .bashrc .gitconfig .vimrc .vim .i3 .Xresources"
BACKUPDIR="$HOME/dotfiles.old"

mkdir -pv $BACKUPDIR

for file in $FILES
do
    if [ -e $HOME/$file ]; then
        mv -v $HOME/$file $BACKUPDIR/$file
    fi
    ln -sv $PWD/$file $HOME/$file
done

echo "All done!"
