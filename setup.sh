#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# And installs all plugins using vim8 native package system
# sets up oh-my-zsh
############################

########## Variables

# check distro
uname_out="$(uname -s)"
if [ $uname_out == "Darwin" ] then
    platform="mac"
elif [ $uname_out == "Linux" ] then
    platform="linux"
else
    echo "No appropriate platform found. Exiting."
    exit 1
fi

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

home_dir="~"
home_files="bashrc vimrc tmux.conf zshrc"    # list of files/folders to symlink in homedir

vim_plugin_dir="~/.vim
vim_plugin_files"plugins.vim"

nvim_dir="~/.config/nvim"
nvim_files="coc-settings.json init.vim" 

alacritty_dir="~/.config/alacritty"
alacritty_files = "alacritty.yml"

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $home_files; do
    echo "Moving any existing home dotfiles from $home_dir to $olddir"
    mv $home_dir/.$file $home_dir/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file $home_dir/.$file
done

for file in $vim_plugin_files; do
    echo "Moving any existing vim plugin dotfiles from $vim_plugin_dir to $olddir"
    mv $vim_plugin_dir/$file $home_dir/dotfiles_old
done

for file in $nvim_files; do
    echo "Moving any existing nvim files from $nvim_dir to $olddir"
done

for file in $alacritty_files; do
    echo "Moving any existing alacritty files from $alacritty_dir to $olddir"
done

# zsh and oh-my-zsh setup
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# create vim .undo .swp .backup
mkdir ~/.vim/.undo 
mkdir ~/.vim/.swp 
mkdir ~/.vim/.backup
