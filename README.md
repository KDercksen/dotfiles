Dotfiles 
========

Contains my dotfiles and vim plugin setup as well as an install script to manage the setup.

## Installation
Using this setup is as simple as cloning the repository and running the installation script:

```bash
cd ~
git clone --recursive https://github.com/KDercksen/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
```
Do not forget the --recursive flag! It will ensure that the submodules containing the vim plugins will be cloned as well.
If you happen to forget the recursive flag, run 
```bash
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
```
and everything should be OK.

Your old dotfiles will be backed up in the ~/dotfiles.old directory.
