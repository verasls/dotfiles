#!/bin/sh
set -e

echo "Setting up your Mac..."

# Define the dotfiles directory path
DOTFILES="$HOME/projects/.dotfiles"

# Check for Homebrew and install if we don't have it
if ! command -v brew >/dev/null 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Git
rm -f "$HOME/.gitconfig"
ln -s "$DOTFILES/.config" "$HOME/.gitconfig"

# Zsh
rm -f "$HOME/.zshrc"
ln -s "$DOTFILES/.zshrc" "$HOME/.zshrc"

# Neovim
rm -rf "$HOME/.config/nvim"
mkdir -p "$HOME/.config"
ln -s "$DOTFILES/nvim" "$HOME/.config/nvim"

# Ghostty
rm -f "$HOME/.config/ghostty/config"
mkdir -p "$HOME/.config/ghostty"
ln -s "$DOTFILES/ghostty-config" "$HOME/.config/ghostty/config"

# Tmux
rm -f "$HOME/.tmux.conf"
ln -s "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
# Install tmux plugin manager (tpm) if not already installed
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi
# Reload tmux configuration to apply changes
tmux source-file "$HOME/.tmux.conf" || echo "tmux not running, skipping reload"

# Starship
rm -f "$HOME/.config/starship.toml"
mkdir -p "$HOME/.config"
ln -s "$DOTFILES/starship.toml" "$HOME/.config/starship.toml"

# R
rm -f "$HOME/.Rprofile"
ln -s "$DOTFILES/.Rprofile" "$HOME/.Rprofile"

# Aerospace
mkdir -p "$HOME/.config/aerospace"
rm -f "$HOME/.config/aerospace/aerospace.toml"
ln -s "$DOTFILES/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"

# Set macOS preferences
source "$DOTFILES/.macos"
