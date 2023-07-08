#!/bin/bash

# Author: Pedro Augusto Ennes de Martino Camargo
# Created at: 07/07/2023
# Last change: 07/07/2023 

# This script will take all folders in the current directory and seed the computer with the configurations

custom_page_dir=$HOME/.local/share/tealdeer/pages
tldrcmds_dir=./tldrcmds/
cfgscripts_dir=./cfgscripts/

# Install zshrc
#sudo pacman -Sy zsh
# End

# install oh-my-zsh
#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
#chsh -s $(which zsh)

#exec zsh
# source $HOME/.zshrc
# End

# Install Powerlevel10k theme
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
# End

sudo cp .zshrc $HOME
#sudo mv $HOME/.zshrc_backup .zshrc
# sudo mv $HOME/.zshrc .zshrc_old
sudo source $HOME/.zshrc

# paste .zshrc
# y y n y 1 y 1 1 1 2 2 1 1 2 2 1 y 1

git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/plugins





# Install tldr
echo "Installing tldr using pacman..."
echo "You will need to type your password for sudo privileges"
yes y | sudo pacman -Sy tealdeer
# End



# Create the custom tldr commands folder
if [ ! -d "$custom_page_dir" ]; then
  mkdir -p "$custom_page_dir"
  echo "Directory created: $custom_page_dir"
else
  echo "Directory already exists: $custom_page_dir"
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
  echo "Path refactored successfully!"
fi

if [ -f "$HOME/.bashrc" ]; then
  sudo echo "$export_path" >> "$HOME/.bashrc"
  echo "Path refactored successfully!"
fi
echo ""
# End



# Create the custom scripts in the directory
scriptsDirectory=$HOME/cfgscripts

echo "Creating the scripts in $scriptsDirectory ..."
cp -v $cfgscripts_dir/* $scriptsDirectory
echo "Scripts created successfully!"
# End
