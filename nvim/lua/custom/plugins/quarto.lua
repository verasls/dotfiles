return {
  'quarto-dev/quarto-nvim',
  dependencies = {
    'jmbuhr/otter.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('quarto').setup {
      closePreviewOnExit = true,
      lspFeatures = {
        enabled = true,
        chunks = 'curly',
        languages = { 'r', 'python' },
        diagnostics = {
          enabled = true,
          triggers = { 'BufWritePost' },
        },
        completion = {
          enabled = true,
        },
      },
      codeRunner = {
        enabled = true,
        default_method = 'iron',
        never_run = { 'yaml' },
      },

      vim.keymap.set(
        'n',
        '<leader>qp',
        ':QuartoPreview<cr>',
        { desc = '[Q]uarto [P]review' }
      ),
    }
  end,
}
