#!/bin/bash

# Install dotfiles by backing up any old ones and creating symlinks to the ones in this repository

dir=~/dotfiles
olddir=~/dotfiles.old
files=".bashrc .vimrc .vim .bashrc .bash_profile .Xresources .gitconfig"

# First create dotfiles.old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "Completed."

# Change to dotfiles directory
echo -n "Changing to $dir directory"
cd $dir
echo "Completed."

# Move any existing dotfiles in homedir into olddir and create symlinks to new dotfiles
for file in $files; do
    echo "Moving old dotfiles from ~ to $olddir..."
    mv ~/$file $olddir
    echo "Creating symlink to $file in ~ ..."
    ln -s $dir/$file ~/$file
done

echo "All done!"
