#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# And installs all plugins using vim8 native package system
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc tmux.conf zshrc"    # list of files/folders to symlink in homedir
optdir=~/.vim/pack/git-plugins/opt           # opt plugin directory
startdir=~/.vim/pack/git-plugins/start      # start plugin directory

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# vim plugins

# create vim 8 package directories
mkdir -p $startdir
mkdir -p $optdir

# Ale
git clone --depth 1 https://github.com/dense-analysis/ale.git $startdir/ale 

# Nerdree
git clone https://github.com/preservim/nerdtree.git $startdir/nerdtree
vim -u NONE -c "$startdir/nerdtree/doc" -c q

# Color Scheme
git clone https://github.com/morhetz/gruvbox.git $startdir/gruvbox

# CTRLP
git clone https://github.com/ctrlpvim/ctrlp.vim.git $startdir/ctrlp.vim

#VIM-JAVASCRIPT
git clone https://github.com/pangloss/vim-javascript.git $startdir/vim-javascript

#VIM-Airline
git clone https://github.com/vim-airline/vim-airline $startdir/vim-airline

# VIM-TMUX-Navigator
git clone https://github.com/christoomey/vim-tmux-navigator $startdir/vim-tmux-navigator
