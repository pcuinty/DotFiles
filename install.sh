#!/bin/bash
############################
# install.sh
# adopted from Michael Smalley
# This script backs up existing dotfiles in a dotfiles_old directory, and creates symlinks to the dotfiles in this repository
############################

###### Variables
dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc spacemacs vimrc gitconfig inputrc xinitrc xmodmap"
######

# check if the following tools are installed, if not, install them
# htop
# ncdu
# check whether bash is installed
# if yes, istall bash-it and liquidprompt
# check if vim and emacs is installed
# if yes, install spacemacs

# Creating dotfiles_old directory
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to dotfile directory
echo -n "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old, then create symlinks in homedir for any file specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/$olddir
    echo "Creating symlink to $file in home directory"
    ln -sv $dir/$file ~/.$file
done
echo "...done"

# linking .xsession to .xinitrc
