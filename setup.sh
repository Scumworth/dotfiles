#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# And installs all plugins using vim8 native package system
# sets up oh-my-zsh
############################

############################
######## Variables #########
############################

uname_out="$(uname -s)"
if [ $uname_out == "Darwin" ]; then
    echo "Platform is mac."
    platform="mac"
elif [ $uname_out == "Linux" ]; then
    echo "Platform is linux."
    platform="linux"
else
    echo "No appropriate platform found. Exiting."
    exit 1
fi

new_dir="$HOME/repos/dotfiles/$platform"       # dotfiles directory

home_files="bashrc vimrc tmux.conf zshrc"    # list of files/folders to symlink in homedir

vim_plugin_dir="$HOME/.vim"
vim_plugin_files="plugins.vim"

nvim_dir="$HOME/.config/nvim"
nvim_files="coc-settings.json init.vim" 

alacritty_dir="$HOME/.config/alacritty"
alacritty_files="alacritty.yml"

ranger_dir="$HOME/.config/ranger"
ranger_files="rc.conf"

############################
####### Directories ########
############################

# move any existing dotfiles in home directory to dotfiles_old directory, then create symlinks 
for file in $home_files; do
    if [ -L "$HOME/.${file}" ]; then
        echo "Removing existing symlink ${file}"
        rm $HOME/.$file 
    fi
    echo "Creating new symlink to ${file} in home directory."
    echo $new_dir/$file
    ln -s $new_dir/$file $HOME/.$file
done
echo "...done"

for file in $vim_plugin_files; do
    if [ -L $vim_plugin_dir/$file ]; then
        echo "Removing Moving existing symlink ${file}"
        rm $vim_plugin_dir/$file
    fi
    echo "Creating new symlink to $file in vim plugins directory."
    ln -s $new_dir/$file $vim_plugin_dir/$file
done
echo "...done"

for file in $nvim_files; do
    if [ -L $nvim_dir/$file ]; then
        echo "Removing existing symlink ${file} from ${nvim_dir}"
        rm $nvim_dir/$file 
    fi
    echo "Creating new symlink to $file in neovim config directory."
    ln -s $new_dir/$file $nvim_dir/$file
done
echo "...done"

for file in $alacritty_files; do
    if [ -L $alacritty_dir/$file ]; then
        echo "Removing existing symlink ${file} from ${alacritty_dir}"
        rm $alacritty_dir/$file
    fi
    echo "Creating new symlink to $file in alacritty config directory."
    ln -s $new_dir/$file $alacritty_dir/$file
done
echo "...done"

for file in $ranger_files; do
    if [ -L $ranger_dir/$file ]; then
        echo "Removing existing symlink ${file} from ${ranger_dir}"
        rm $ranger_dir/$file
    fi
    echo "Creating new symlink to $file in ranger config directory."
    ln -s $new_dir/$file $ranger_dir/$file
done
echo "...done"

# zsh and oh-my-zsh setup
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# create vim .undo .swp .backup
mkdir -p ~/.vim/.undo 
mkdir -p ~/.vim/.swp 
mkdir -p ~/.vim/.backup
