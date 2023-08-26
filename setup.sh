#!/bin/bash

# Author: Pedro Augusto Ennes de Martino Camargo
# Created at: 07/07/2023
# Last change: 07/07/2023 

# This script will take all folders in the current directory and seed the computer with the configurations

custom_page_dir=$HOME/.local/share/tealdeer/pages
tldrcmds_dir=./tldrcmds/
cfgscripts_dir=./cfgscripts/

# Install Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
# End

# Copy the .zshrc file to home
sudo cp ./zsh/.zshrc $HOME
sudo source $HOME/.zshrc
# End

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/zsh-syntax-highlighting
mv ~/zsh-autosuggestions/ ~/.oh-my-zsh/plugins/
mv ~/zsh-syntax-highlighting/ ~/.oh-my-zsh/plugins/
# End



# Install tldr
echo "Installing tldr using pacman..."
echo "You will need to type your password for sudo privileges"
yes y | sudo pacman -Sy tealdeer
# End



# Create the custom tldr commands folder
if [ ! -d "$custom_page_dir" ]; then
  echo ""
  mkdir -p "$custom_page_dir"
  echo "Directory created: $custom_page_dir"
  echo ""
else
  echo ""
  echo "Directory already exists: $custom_page_dir"
  echo ""
fi
# End



# Putting every custom tldr commands in the folder
echo ""
echo "Copying all files in $tldrcmds_dir to $custom_page_dir ..."
cp -v $tldrcmds_dir/* $custom_page_dir
echo ""
echo "All files copied successfully!"
# End



# Create my scripts folder
scriptsDirectory=$HOME/cfgscripts/

if [ ! -d "$scriptsDirectory" ]; then
  mkdir -p "$scriptsDirectory"
  echo "Directory created: $scriptsDirectory"
else
  echo "Directory already exists: $scriptsDirectory"
fi
# End



# Add the scripts path to the system to create global variables
export_path='export PATH="$PATH:$HOME/cfgscripts/"'

echo "Increasing the PATH system variable range..."
if [ -f "$HOME/.zshrc" ]; then
  sudo echo "$export_path" >> "$HOME/.zshrc"
  echo "ZSH path refactored successfully!"
fi

if [ -f "$HOME/.bashrc" ]; then
  sudo echo "$export_path" >> "$HOME/.bashrc"
  echo "Bash path refactored successfully!"
fi
echo ""
# End



# Create the custom scripts in the directory
echo "Creating the scripts in $scriptsDirectory ..."
cp -v $cfgscripts_dir/* $scriptsDirectory
echo "Scripts created successfully!"
# End

# TODO: Github CLI
# TODO: Install nvm with curl
# TODO: Install node with nvm
# TODO: Setup vim