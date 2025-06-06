# dotfiles

Dotfiles to configure and maintain my mac(s).

---

## A clean installation and setup of macOS

**Before reinstalling**

- Back up your important documents, either on cloud or on a hard drive.
- Commit and push any changes to your git repositories.
- Update mackup (`brew upgrade mackup` if you use homebrew) and run `mackup backup`.

**Installing macOS**

- Follow the steps in this [article](https://support.apple.com/en-us/HT204904)

**Setting up**

- Update the macOS to the latest version.
- Install macOS command line tools (`xcode-select --install`).
- [Generate a new SSH key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and add to Github.
- Create a `projects` directory in the root directory (`mkdir ~/projects`)
- Clone this repo to `~/projects/.dotfiles` (`git clone git@github.com:verasls/dotfiles ~/projects/.dotfiles`).
- Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh#getting-started).
- Run `install.sh` script.
- Restart your computer.
- Install karabiner elements (https://karabiner-elements.pqrs.org/)
- Install Command X, Dozer and Toothfairy from the mac App Store
