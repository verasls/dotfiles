return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      -- Do NOT override LSP popups or completion docs
      lsp = {
        override = {},
      },
      presets = {
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
      },
      views = {
        cmdline_popup = {
          position = {
            row = '40%',
            column = '50%',
          },
        },
      },
    }
  end,
}
