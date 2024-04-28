vim.o.shortmess = vim.o.shortmess .. "I"

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.updatetime = 50

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = ">-" }

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
