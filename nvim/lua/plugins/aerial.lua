return {
  {
    'stevearc/aerial.nvim',
    opts = {
      layout = { min_width = 40 },
    },
    keys = {
      { '<C-p>', "<cmd>AerialToggle<CR>" },
    },
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').r_language_server.setup{}
    end,
  },
}
