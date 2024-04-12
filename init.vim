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

" enable indentation
set breakindent

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
" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>

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
" au FileType * setlocal fo-=cro
" autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
" set formatoptions-=cro
" autocmd FileType typescript setlocal formatoptions-=cro

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
tnoremap <Esc> <C-\><C-n>

" Set termguicolors
if has('termguicolors')
    set termguicolors
endif

" Plugins ---------------------------------------------------------------------
" Automatic instalation of vim-plug
call plug#begin('~/.config/nvim/plugins')

" General
Plug 'Raimondi/delimitMate'
Plug 'psliwka/vim-smoothie'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-surround'
Plug 'mattn/webapi-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Appearance
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'arecarn/vim-clean-fold'
Plug 'sakshamgupta05/vim-todo-highlight'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Linting
Plug 'w0rp/ale'
" REPL
Plug 'jpalardy/vim-slime'

" Language-specific
" Python
Plug 'vim-python/python-syntax'
Plug 'tell-k/vim-autopep8'
" R
Plug 'vim-pandoc/vim-rmarkdown'
" Matlab
Plug 'raingo/vim-matlab'
" C++
Plug 'octol/vim-cpp-enhanced-highlight'
" HTML
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'
Plug 'mattn/emmet-vim'
" CSS
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'yaegassy/coc-tailwindcss',  {'do': 'npm install && npm run build', 'branch': 'feat/support-v3-and-use-server-pkg'}
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Javascript
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'
" General web dev
Plug 'manzeloth/live-server'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
" Markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'JamshedVesuna/vim-markdown-preview'
" JSON
Plug 'neoclide/jsonc.vim'
call plug#end()


" Plugin Related Settings -----------------------------------------------------

" delimitMate
" Disable delimitMate autoclose for < in html files
autocmd FileType html let b:delimitMate_matchpairs = "(:),[:],{:}"

" vim-smoothie
" Allow smooth scrolling with gg and G
let g:smoothie_experimental_mappings = 1

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Define custom delimiters for jsx (toggle with <leader>ca)
let g:NERDCustomDelimiters={
  \ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" nerdtree
" Shortcut to open nerdtree
map <C-q> :NERDTreeToggle<CR>
" Show hidden files by default
let NERDTreeShowHidden=1
" Enable line numbers
let NERDTreeShowLineNumbers=1
" Make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" tagbar
" Remap tagbar
nmap <C-w> :TagbarToggle<CR>
let g:tagbar_left=1
let g:tagbar_show_linenumbers=2

" FZF key bindings
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'
let $FZF_DEFAULT_OPTS="--preview-window 'right:57%' --preview 'bat --style=numbers --line-range :300 {}'
\ctrl-u:preview-half-page-up,ctrl-b:preview-half-page-down"
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-s': 'vsplit'}
nnoremap <C-f> :Files<CR>
nnoremap <C-g> :GFiles?<CR>
nnoremap <C-i> :RG<CR>

" Catppuccin machiatto colorscheme
colorscheme catppuccin-macchiato
let g:airline_theme = 'catppuccin'

" Also disable indentLine plugin for markdown and Rmd files as this
" plugin set conceallevel = 2
autocmd FileType markdown let g:indentLine_enabled = 0
autocmd FileType rmd let g:indentLine_enabled = 0

" Rainbow parentheses
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" vim-todo-highlight
let g:todo_highlight_config = {
      \   'TODO': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#1c7ed6',
      \     'cterm_fg_color': 'white',
      \     'cterm_bg_color': '39'
      \   },
      \   'BUG': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#e03131',
      \     'cterm_fg_color': 'white',
      \     'cterm_bg_color': '160'
      \   },
      \   'NOTE': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#f59f00',
      \     'cterm_fg_color': 'white',
      \     'cterm_bg_color': '220'
      \   }
      \ }

" coc.nvim
" Remap coc-nvim autocomplete
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Autoformat R code on save
augroup AutoFormat
  autocmd!
  autocmd BufWritePre *.R call CocActionAsync('format')
augroup END

" ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

" vim-slime
let g:slime_target = "neovim"
autocmd FileType python,r vmap <Space> <Plug>SlimeRegionSend
autocmd FileType python,r nmap <Space> <Plug>SlimeParagraphSend
function! StartREPL()
  let repl = input("Enter the desired program: ")
  if tolower(repl) == "r"
    let repl = "R --no-save"
  endif

  if !empty(repl)
    vsplit
    enew
    call termopen(repl)
    execute 'normal!' . "\<c-w>p"
  endif
endfunction
noremap <buffer> vt :call StartREPL()<CR>

" vim-autopep8
" Set autopep8 to be aggressive
let g:autopep8_aggressive=2
" Remap autopep8 command
" autocmd FileType python nmap <C-a> call :Autopep8<CR>
autocmd FileType python map <buffer> <C-a> :call Autopep8()<CR>

" vim-closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,js'
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
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" emmet-vim
" Change emmet leader
let g:user_emmet_leader_key='<C-Z>'

" vim-jsx-pretty
" Change close tag highlight
let g:vim_jsx_pretty_highlight_close_tag = 1
hi link jsxCloseString Function

" vim-prettier
" Remap Prettier shortcut
nmap <C-p> :Prettier<CR>
" Autoformat on save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" vim-pandoc and vim-rmarkdown and vim-markdown-preview
let g:pandoc#modules#disabled = ["folding", "spell"]
let g:pandoc#syntax#conceal#use = 0
let vim_markdown_preview_github = 1

" Language specific settings --------------------------------------------------

" Python syntax highlighting
let g:python_highlight_all = 1

" R
autocmd FileType r inoremap <buffer> >> <Esc>:normal! a <Bar>><CR>a
autocmd FileType rmd inoremap <buffer> >> <Esc>:normal! a <Bar>><CR>a
autocmd FileType r inoremap <buffer> ,, <Esc>:normal! a <- <CR>a
autocmd FileType rmd inoremap <buffer> ,, <Esc>:normal! a <- <CR>a
" Function to add a section to the code
function! CreateSection(section_name)
  let section_length = 80 - len(a:section_name) - 3
  let section_line = '# ' . a:section_name . ' ' . repeat('-', section_length)
  call append(line('.'), section_line)
endfunction
" Input the name of the section
function! InputSectionName()
  let section_name = input("Enter section name: ")
  if !empty(section_name)
    call CreateSection(section_name)
  endif
endfunction
" Mapping to call this function
autocmd FileType r nnoremap <buffer> <leader>s :call InputSectionName()<CR>

" Set tabs in .m files
autocmd FileType matlab setlocal noexpandtab

" Highlight column 81 in html files
autocmd FileType html set colorcolumn=81
nmap <C-c> :set colorcolumn=0<CR>

" Remap arrow symbol in javascript
autocmd FileType javascript inoremap <buffer> ,, <Esc>:normal! a => <CR>a
autocmd FileType typescript inoremap <buffer> ,, <Esc>:normal! a => <CR>a
autocmd FileType typescriptreact inoremap <buffer> ,, <Esc>:normal! a => <CR>a

" For the most accurate but slowest result, set the syntax synchronization method to fromstart. This can be done with an autocmd in your vimrc:
autocmd BufEnter * :syntax sync fromstart

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
