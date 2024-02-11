#!/bin/bash

echo "Setting up your Linux environment..."

# Install Git
# https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
echo "Installing Git..."
sudo apt-get update
sudo apt-get install git

# Install Stow
echo "Installing Stow..."
sudo apt-get install stow

# Install Neovim
mkdir ~/.git-clones
sudo apt-get install ninja-build gettext cmake unzip curl
git clone https://github.com/neovim/neovim ~/.git-clones/nvim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
git checkout stable
sudo make install
cd

# Install tmux
sudo apt-get install tmux

# Clone dotfiles repo
git clone https://github.com/jesuskcapellan/dotfiles.git ~/dotfiles
cd dotfiles
stow .
