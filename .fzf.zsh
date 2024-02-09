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

# Set Catppuccin macchiato theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
