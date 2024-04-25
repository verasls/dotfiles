# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_DISABLE_COMPFIX=true

# Enable completions
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

DISABLE_UNTRACKED_FILES_DIRTY="true"
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mmm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES

source $ZSH/oh-my-zsh.sh
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

# User configuration
# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Setting PATH for Python
# The original version is saved in .bash_profile.pysave
PATH="/usr/local/opt/python@3.11/libexec/bin:${PATH}"
export PATH

# Enable syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Setting path to R
PATH="/Library/Frameworks/R.framework/Resources:${PATH}"
export PATH
export HOMEBREW_GITHUB_API_TOKEN=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

# Configure fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
