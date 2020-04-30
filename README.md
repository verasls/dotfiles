# dotfiles

Dotfiles to configure and maintain my Mac and to [survive a laptop fire](https://milesmcbain.xyz/how-to-survive-a-laptop-fire/#fnref2). 

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
- Clone this repo to `~/.dotfiles` (`git clone git@github.com:verasls/dotfiles ~/.dotfiles`).
- Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh#getting-started).
- Run `install.sh` script.
- After mackup is synced with your cloud storage, restore preferences (`mackup restore`).
- Restart your computer.

--- 

## My setup

All the apps I use are installed through the [`Brewfile`](Brewfile). 

My preferred shell is the zsh and I used it with the [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh#getting-started) framework and the [iTerm2](https://www.iterm2.com). I also use the [tmux](https://github.com/tmux/tmux/wiki) terminal multiplexer. The zsh configuration is on the [`.zshrc`](.zshrc) file and the tmux on the [`.tmux.conf`](.tmux.conf).

I mostly code in R and Python, so these dotfiles are set to install my most used R packages ([`packages.R`](packages.R)) and Python modules ([`python.sh`](python.sh)).

Finally is the [`init.vim`](init.vim) file with my [neovim]((https://neovim.io)) configuration. I set it up to support R coding with the [Nvim-R](https://github.com/jalvesaq/Nvim-R) plugin, mostly following the instructions on this [article](https://www.freecodecamp.org/news/turning-vim-into-an-r-ide-cd9602e8c217/).

---

## Thank you..

I started this project by reading the [Dries Vints](https://github.com/driesvints) [blog post](https://driesvints.com/blog/getting-started-with-dotfiles/) and by looking at his [dotfiles repo](https://github.com/driesvints/dotfiles). Also, [Github does dotfiles](https://dotfiles.github.io) provided great resources. I would like to further thank [Mathias Bynens](https://github.com/mathiasbynens) for his aewsome [`.macos`](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) file.