#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Zsh
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Git
rm -rf $HOME/.gitconfig
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

rm -rf $HOME/.gitignore_global
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global

# Mackup
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Neovim
rm -rf $HOME/.config/nvim
ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim

# Ghostty
rm -rf $HOME/.config/ghostty/config
if [ ! -d "$HOME/.config/ghostty" ]; then
  mkdir -p "$HOME/.config/ghostty"
fi
ln -s $HOME/.dotfiles/ghostty-config $HOME/.config/ghostty/config

# Tmux
rm -rf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf

# Starship
rm -rf $HOME/.config/starship.toml
ln -s $HOME/.dotfiles/starship.toml $HOME/.config/starship.toml

# Fzf
rm -rf $HOME/.fzf.zsh
ln -s $HOME/.dotfiles/.fzf.zsh $HOME/.fzf.zsh

# R
rm -rf $HOME/.Rprofile
ln -s $HOME/.dotfiles/.Rprofile $HOME/.Rprofile

# Aerospace
mkdir -p $HOME/.config/aerospace
rm -rf $HOME/.config/aerospace/aerospace.toml
ln -s $HOME/.dotfiles/aerospace.toml $HOME/.config/aerospace/aerospace.toml

# Set macOS preferences
source .macos
