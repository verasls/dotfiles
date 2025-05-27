-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set(
  'n',
  '<leader>d',
  vim.diagnostic.setloclist,
  { desc = 'Open [D]iagnostics' }
)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set(
  'n',
  '<C-h>',
  '<C-w><C-h>',
  { desc = 'Move focus to the left window' }
)
vim.keymap.set(
  'n',
  '<C-l>',
  '<C-w><C-l>',
  { desc = 'Move focus to the right window' }
)
vim.keymap.set(
  'n',
  '<C-j>',
  '<C-w><C-j>',
  { desc = 'Move focus to the lower window' }
)
vim.keymap.set(
  'n',
  '<C-k>',
  '<C-w><C-k>',
  { desc = 'Move focus to the upper window' }
)

-- Makes moving lines easier
-- Move selected lines down with J in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
-- Move selected lines up with K in visual mode
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })

-- Join lines in normal mode, keeping the cursor in place
vim.keymap.set('n', 'J', 'mzJ`z')

-- Centers the cursor after completing some actions
-- Scroll half-page down and center the cursor
vim.keymap.set('n', '<C-d>', '<C-d>zz')
-- Scroll half-page up and center the cursor
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- Next search result, center the cursor and open folds if needed
vim.keymap.set('n', 'n', 'nzzzv')
-- Previous search result, center the cursor and open folds if needed
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paste over selection in visual mode without yanking replaced text
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Clipboard management
vim.keymap.set(
  { 'n', 'v' },
  '<leader>y',
  [["+y]],
  { desc = '[Y]ank selection to sys clipboard' }
)
vim.keymap.set(
  'n',
  '<leader>Y',
  [["+Y]],
  { desc = '[Y]ank line to sys clipboard' }
)

-- Buffer navigation
-- Go to next buffer with bn in normal mode
vim.api.nvim_set_keymap('n', 'bn', ':bn<CR>', { noremap = true, silent = true })
-- Go to previous buffer with bp in normal mode
vim.api.nvim_set_keymap('n', 'bp', ':bp<CR>', { noremap = true, silent = true })
-- Close current buffer and switch to alternate buffer with bx in normal mode
vim.api.nvim_set_keymap(
  'n',
  'bx',
  ':b#|bd!#<CR>',
  { noremap = true, silent = true }
)

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup(
    'kickstart-highlight-yank',
    { clear = true }
  ),
  callback = function()
    vim.hl.on_yank()
  end,
})
