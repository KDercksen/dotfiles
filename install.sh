#!/bin/bash

# Install dotfiles by backing up any old ones and creating symlinks to the ones in this repository
dir=$(dirname $0)
olddir=$HOME/dotfiles.old/

# First create dotfiles.old in homedir
mkdir -pv $olddir

# Move any existing dotfiles in ~ into olddir and create symlinks to new dotfiles
for file in $(ls -a1 $dir | grep -xv "\.*\($\|git\(modules\)\+$\)\|README.md\|install.sh")
do
    if [ -e $HOME/$file ]; then
        mv -v $HOME/$file $olddir$file
    fi
    ln -sv $dir/$file $HOME/$file
done

echo "All done!"
