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

# Set gruvbox dark theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
--color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
'
