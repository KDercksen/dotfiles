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

# Move any existing dotfiles in ~ into olddir and create symlinks to new dotfiles
for file in $files; do
    if [ -f ~/$file ]; then
        echo "Moving old $file from ~ to $olddir..."
        mv ~/$file $olddir
    fi
    echo "Creating symlink to $file in ~ ..."
    ln -s $dir/$file ~/$file
done

# Initialize all submodules
echo "Symlinking done, initializing vim plugins..."

git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update

echo "All done!"
