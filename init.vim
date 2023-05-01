" Comments in Vimscript start with a `"`.
"
" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Set default values for ts and sw
set ts=2
set sw=2
set expandtab

" Display tabs
set list
set listchars=tab:>-

" Turn on syntax highlighting.
syntax on

" Access system clipboard
set clipboard=unnamed

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Decrease updatetime
set updatetime=100

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable filetype plugin
filetype plugin on

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Autosave when lose focus
" au FocusLost * silent! :wa
autocmd BufLeave,FocusLost * silent! wall
set autowriteall

" Put new buffers on the right (vertical) or bottom (horizontal) of the screen
set splitright
set splitbelow

" Do not insert a comment when pressing o or O in normal mode
au FileType * setlocal fo-=cro

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" Facilitate split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" Remap buffer and tabs commands
map bn :bn<CR>
map bp :bp<CR>
map bx :BD!<CR>
map tc :tabclose<CR>

" Files & Backup
set nobackup                     " Turn off backup.
set nowb                         " Don't backup before overwriting a file.
set noswapfile                   " Don't create a swap file.
set ffs=unix,dos,mac             " Use Unix as the standard file type.

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Remove search highligh
map nh :nohlsearch<CR>

" Terminal mode
map vt :vsplit term://zsh<CR>
tnoremap <Esc> <C-\><C-n>

" Highlight column 81 in html files
autocmd FileType html set colorcolumn=81
nmap <C-c> :set colorcolumn=0<CR>    

" Automatic instalation of vim-plug
call plug#begin('~/.config/nvim/plugins')

Plug 'jalvesaq/Nvim-R'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'psliwka/vim-smoothie'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'Raimondi/delimitMate'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'itchyny/lightline.vim'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'w0rp/ale'
Plug 'raingo/vim-matlab'
Plug 'airblade/vim-gitgutter'
Plug 'qpkorr/vim-bufkill'
Plug 'vim-python/python-syntax'
Plug 'luochen1990/rainbow'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'sainnhe/sonokai'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jpalardy/vim-slime'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'github/copilot.vim'
Plug 'tell-k/vim-autopep8'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'arecarn/vim-clean-fold'
Plug 'manzeloth/live-server'
Plug 'pangloss/vim-javascript'
Plug 'ryanoasis/vim-devicons'

call plug#end()


" Plugin Related Settings

" Allow smooth scrolling with gg and G
let g:smoothie_experimental_mappings = 1

" NCM2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Set autopep8 to be aggressive
let g:autopep8_aggressive=2
" Remap autopep8 command
" autocmd FileType python nmap <C-a> call :Autopep8<CR>
autocmd FileType python map <buffer> <C-a> :call Autopep8()<CR>

" Monokai-tasty
" let g:vim_monokai_tasty_italic = 1
" colorscheme vim-monokai-tasty

if has('termguicolors')
    set termguicolors
endif
" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'atlantis'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

" LightLine.vim 
set laststatus=2
let g:lightline = {
   \ 'colorscheme':'sonokai',
   \ }

" Insert comments config
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Shortcut to open nerdtree
map <C-q> :NERDTreeToggle<CR>
" Show hidden files by default
let NERDTreeShowHidden=1
" Enable line numbers
let NERDTreeShowLineNumbers=1
" Make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

" Remap coc-nvim autocomplete
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" Nvim-R
" Press ,, to have Nvim-R insert the assignment operator (<-)
let R_assign_map = ",,"

" Don't expand a dataframe to show columns by default (\ro)
let R_obj_opendf = 0

" Set console width to be half the vim window width
let R_rconsole_width = winwidth(0) / 2
autocmd VimResized * let R_rconsole_width = winwidth(0) / 2
" let R_external_term = 1

" Set position of R documentation and object browser
let R_nvimpager = 'horizontal'
let R_objbr_place = 'script,below'
let R_objbr_h = 20

" Press the space bar to send lines and selection to R console
vmap <Space> <Plug>RESendSelection
nmap <Space> <Plug>RESendParagraph

" Keybind >> to the pipe operator (|>)
autocmd FileType r inoremap <buffer> >> <Esc>:normal! a <Bar>><CR>a
autocmd FileType rmd inoremap <buffer> >> <Esc>:normal! a <Bar>><CR>a

" Set tab identation to 2 spaces in .R and .Rmd files
autocmd FileType r setlocal ts=2 sw=2 expandtab
autocmd FileType rmd setlocal ts=2 sw=2 expandtab
autocmd FileType cpp setlocal ts=4 sw=4 expandtab

" Set tabs in .m files
autocmd FileType matlab setlocal noexpandtab

" R commands in R output are highlighted
let g:Rout_more_colors = 1

" vim-pandoc and vim-rmarkdown and vim-markdown-preview
let g:pandoc#modules#disabled = ["folding", "spell"]
let g:pandoc#syntax#conceal#use = 0
let vim_markdown_preview_github = 1
" Also disable indentLine plugin for markdown and Rmd files as this
" plugin set conceallevel = 2
autocmd FileType markdown let g:indentLine_enabled = 0
autocmd FileType rmd let g:indentLine_enabled = 0

" Python syntax highlighting
let g:python_highlight_all = 1

" Rainbow parentheses
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" Vim-slime
let g:slime_target = "neovim"
autocmd FileType python vmap <Space> <Plug>SlimeRegionSend
autocmd FileType python nmap <Space> <Plug>SlimeParagraphSend
autocmd FileType javascript vmap <Space> <Plug>SlimeRegionSend
autocmd FileType javascript nmap <Space> <Plug>SlimeParagraphSend

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Disable delimitMate autoclose for < in html files
autocmd FileType html let b:delimitMate_matchpairs = "(:),[:],{:}"

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" Change emmet leader
let g:user_emmet_leader_key='<C-Z>'

" Remap Prettier shortcut
nmap <C-p> :Prettier<CR>    
" Autoformat on save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Set tab identation to 2 spaces in html and css files
autocmd FileType html setlocal ts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sw=2 expandtab

" Remap tagbar
nmap <C-w> :TagbarToggle<CR>


