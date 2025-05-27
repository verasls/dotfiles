return {
  {
    'Vigemus/iron.nvim',
    config = function()
      local iron = require 'iron.core'
      iron.setup {
        config = {
          scratch_repl = true,
          repl_definition = {
            R = { command = { 'radian' } },
            r = { command = { 'radian' } },
            python = { command = { 'ipython' } },
          },
          repl_open_cmd = require('iron.view').split.vertical.botright '50%',
        },
        keymaps = {
          visual_send = '<cr>',
          send_paragraph = '<cr>',
        },
        highlight = false,
        ignore_blank_lines = true,
      }

      vim.keymap.set(
        'n',
        '<localleader>is',
        '<cmd>IronRepl<cr>',
        { desc = '[I]ron REPL [S]tart' }
      )
      vim.keymap.set(
        'n',
        '<localleader>ir',
        '<cmd>IronRestart<cr>',
        { desc = '[I]ron REPL [R]estart' }
      )
      vim.keymap.set(
        'n',
        '<localleader>iq',
        '<cmd>lua require("iron.core").close_repl()<cr>',
        { desc = '[I]ron REPL [Q]uit' }
      )
      vim.keymap.set(
        'n',
        '<localleader>if',
        '<cmd>lua require("iron.core").send_file()<cr>',
        { desc = '[I]ron REPL Send [F]ile' }
      )
    end,
  },
}
