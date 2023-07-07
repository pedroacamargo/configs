#!/bin/bash

# Author: Pedro Augusto Ennes de Martino Camargo
# Created at: 07/07/2023
# Last change: 07/07/2023 

# This script will take all folders in the current directory and seed the computer with the configurations

custom_page_dir=$HOME/.local/share/tealdeer/pages
tldrcmds_dir=./tldrcmds/
cfgscripts_dir=./cfgscripts/
scriptsDirectory=$HOME/cfgscripts


echo "Installing tldr using pacman..."
echo "You will need to type your password for sudo privileges"
yes y | sudo pacman -Sy tealdeer

if [ ! -d "$custom_page_dir" ]; then
  mkdir -p "$custom_page_dir"
  echo "Directory created: $custom_page_dir"
else
  echo "Directory already exists: $custom_page_dir"
fi

echo ""
echo "Copying all files in $tldrcmds_dir to $custom_page_dir ..."
cp -v $tldrcmds_dir/* $custom_page_dir

echo ""
echo "All files copied successfully!"

if [ ! -d "$scriptsDirectory" ]; then
  mkdir -p "$scriptsDirectory"
  echo "Directory created: $scriptsDirectory"
else
  echo "Directory already exists: $scriptsDirectory"
fi

echo "Increasing the PATH system variable range..."
echo 'export PATH="$PATH:$HOME/cfgscripts/"' >> $HOME/.zshrc
echo 'export PATH="$PATH:$HOME/cfgscripts/"' >> $HOME/.bashrc
echo "Path refactored successfully!"
echo ""

echo "Creating the scripts in $scriptsDirectory ..."
cp -v $cfgscripts_dir/* $scriptsDirectory
echo "Scripts created successfully!"
