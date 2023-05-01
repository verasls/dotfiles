" Turn off auto comment insertion
"
" Setting this only on init.vim doesn't work for all the cases
" This is a workaround solution bases on the following links:
" https://vi.stackexchange.com/questions/9366/set-formatoptions-in-vimrc-is-being-ignored
" https://blog.hqcodeshop.fi/archives/442-Vims-comment-line-leaking-fix!-Part-3.html
"
" For this to work for a given filetype, do this (e.g. for javascript):
" ln -s $HOME/.dotfiles/.after.vim $HOME/.config/nvim/after/ftplugin/javascript.vim
set formatoptions-=cro
