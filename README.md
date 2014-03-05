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

Some of the plugins require their own setup. The pep8 plugin for instance requires a Python library called pep8 
which can easily be installed, upgraded or uninstalled using the following commands:
```
pip install pep8
pip install --upgrade pep8
pip uninstall pep8
```

Your old dotfiles will be backed up in the ~/dotfiles.old directory.
