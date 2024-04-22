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

# Clone Github repositories
./clone.sh

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Removes .p10k.zsh from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.p10k.zsh
ln -s $HOME/.dotfiles/.p10k.zsh $HOME/.p10k.zsh
# Install powerlevel10k
echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

# Removes .gitconfig from $HOME (if it exists) and symlinks the .gitconfig file from the .dotfiles
rm -rf $HOME/.gitconfig
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# Removes .gitignore_global from $HOME (if it exists) and symlinks the .gitignore_global file from the .dotfiles
rm -rf $HOME/.gitignore_global
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Removes neovim config files from $HOME/.config/nvim (if it exists) and symlinks from
# the dotfiles
rm -rf $HOME/.config/nvim
ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim

# Removes .tmux.conf from $HOME (if it exists) and symlinks the .tmux.conf from the .dotfiles
rm -rf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf

# Removes .fzf.zsh from $HOME (if it exists) and symlinks the .fzf.zsh from the .dotfiles
rm -rf $HOME/.fzf.zsh
ln -s $HOME/.dotfiles/.fzf.zsh $HOME/.fzf.zsh

# Removes .Rprofile from $HOME (if it exists) and symlinks the .Rprofile from the .dotfiles
rm -rf $HOME/.Rprofile
ln -s $HOME/.dotfiles/.Rprofile $HOME/.Rprofile

# Removes yabairc from $HOME (if it exists) and symlinks the yabairc from the .dotfiles
mkdir $HOME/.config/yabai
rm -rf $HOME/.config/yabai/yabairc
ln -s $HOME/.dotfiles/yabairc $HOME/.config/yabai/yabairc

# Removes skhdrc from $HOME (if it exists) and symlinks the skhdrc from the .dotfiles
mkdir $HOME/.config/skhd
rm -rf $HOME/.config/skhd/skhdrc
ln -s $HOME/.dotfiles/skhdrc $HOME/.config/skhd/skhdrc

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
