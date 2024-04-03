# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/lucasveras/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/lucasveras/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/lucasveras/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/lucasveras/.fzf/shell/key-bindings.zsh"

# Use ,, as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER=',,'

export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"

export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
