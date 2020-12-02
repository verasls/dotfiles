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

# Install python libraries
./python.sh

# Install R packages
Rscript packages.R

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

# Removes .gitignore_global from $HOME (if it exists) and symlinks the .gitignore_global file from the .dotfiles
rm -rf $HOME/.gitignore_global
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Removes init.vim from $HOME/.config/nvim/init.vim (if it exists) and symlinks the
# init.vim file from the .dotfiles
if [ ! -d "$HOME/.config/nvim" ]; then
  mkdir -p $HOME/.config/nvim
fi
rm -rf $HOME/.config/nvim/init.vim
ln -s $HOME/.dotfiles/init.vim $HOME/.config/nvim/init.vim

# Removes .tmux.conf from $HOME (if it exists) and symlinks the .tmux.conf from the .dotfiles
rm -rf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf

# Removes .Rprofile from $HOME (if it exists) and symlinks the .Rprofile from the .dotfiles
rm -rf $HOME/.Rprofile
ln -s $HOME/.dotfiles/.Rprofile $HOME/.Rprofile

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
