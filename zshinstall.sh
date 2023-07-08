#!/bin/bash

# Install zshrc
sudo pacman -Sy zsh
# End

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
chsh -s $(which zsh)
exec zsh
source $HOME/.zshrc
# End


