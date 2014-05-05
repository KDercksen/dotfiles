#!/usr/bin/env bash

set -e

FILES=".bashrc .gitconfig .vimrc .vim"
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
