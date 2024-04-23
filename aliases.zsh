# Shortcuts
alias reloadshell='source $HOME/.zshrc'
alias c='clear'
alias lsa='ls -la'
alias ll='eza -l -a --icons'
alias vim='nvim'
alias v='nvim .'
alias vf='vim $(fzf --preview "bat --style=numbers --color=always --line-range :500 {}")'
alias sg='sgpt'
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
alias gst='git status'
alias gs='git status'
alias gl='git log --pretty=format:"%C(blue)%h%C(red)%d %C(white)%s - %C(cyan)%cn, %C(green)%cr"'
alias gb='git branch'
alias gc='git checkout'
alias amend='git add . && git commit --amend --no-edit'
alias commit='git add . && git commit -m'
alias diff='git diff'
alias force='git push --force'
alias nuke='git clean -df && git reset --hard'
alias pop='git stash pop'
alias pull='git pull'
alias push='git push'
alias resolve='git add . && git commit --no-edit'
alias stash='git stash -u'
alias unstage='git restore --staged .'
alias wip='commit wip'

# Python
alias python='python3'
alias ipy='ipython'

# R
alias R='R --no-save'
