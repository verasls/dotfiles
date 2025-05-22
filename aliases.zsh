# Shortcuts
alias reloadshell='source $HOME/.zshrc'
alias c='clear'
alias lsa='ls -la'
alias ll='eza -l -a --icons'
alias vim='nvim'
alias v='nvim'
alias vf='vim $(fzf --preview "bat --style=numbers --color=always --line-range :500 {}")'
alias aic='aicommits'

# Directories
alias dot='cd $DOTFILES'
alias prj='cd $HOME/Documents/Projects'

# Tmux
alias tm='tmux'
alias tma='tmux attach'
alias tmd='tmux detach'
alias tmls='tmux list-sessions'
alias tmk='tmux kill-session'
alias tmka='tmux kill-server'
alias w='bash ~/.dotfiles/tmux_sessions.sh'

# Git
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gd='git diff'
alias gl='git log --pretty=format:"%C(blue)%h%C(red)%d %C(white)%s - %C(cyan)%cn, %C(green)%cr"'
alias gb='git branch'
alias gco='git checkout'
alias gp='git push'

# Python
alias python='python3'
alias ipy='ipython'

# R
alias R='R --no-save'
alias r='radian'
