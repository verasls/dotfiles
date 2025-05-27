-- [[ Setting options ]]
-- See `:help vim.o`

-- Make line numbers default
vim.o.number = true
-- Make relative numbers
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Enables line wrapping
vim.o.wrap = true
-- Enable break indent
vim.o.breakindent = true
-- Wraps lines at convenient points (like at spaces), not in the middle of words
vim.o.linebreak = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Sets the width of a tab character to 2 spaces.
vim.opt.tabstop = 2
-- When editing, a tab feels like 2 spaces.
vim.opt.softtabstop = 2
-- Indentation levels (for >>, <<, auto-indent, etc.) use 2 spaces.
vim.opt.shiftwidth = 2
-- Converts tabs to spaces.
vim.opt.expandtab = true
-- Copies indent from current line when starting a new line.
vim.opt.autoindent = true
-- Automatically inserts extra indents in some cases (like after ⁠{ in C-like languages).
vim.opt.smartindent = true

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 5

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Uses the default block cursor in all modes
vim.opt.guicursor = ''

-- Prevents automatic comment insertion
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove { 'c', 'r', 'o' }
  end,
})
