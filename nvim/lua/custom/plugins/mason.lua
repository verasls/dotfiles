return {
  {
    'mason-org/mason.nvim',
    opts = {},
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      local installer = require 'mason-tool-installer'
      installer.setup {
        ensure_installed = {
          'lua-language-server',
          'marksman',
          'python-lsp-server',
          'stylua',
        },
        integrations = {
          ['mason-lspconfig'] = false,
          ['mason-null-ls'] = false,
          ['mason-nvim-dap'] = false,
        },
      }
    end,
  },
}
