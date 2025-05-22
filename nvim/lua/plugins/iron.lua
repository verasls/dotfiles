return {
  {
    "Vigemus/iron.nvim",
    config = function()
      local iron = require("iron.core")
      iron.setup {
        config = {
          scratch_repl = true,
          repl_definition = {
            R = { command = { "radian" } },
            r = { command = { "radian" } },
            quarto = { command = { "radian" } },
          },
          repl_open_cmd = require('iron.view').split.vertical.botright("50%"),
        },
        keymaps = {
          visual_send = "<space>",
          send_paragraph = "<space>",
          send_file = "<space>f",
          send_line = "<space>l",
          clear = "<space>c",
          exit = "<localleader>q",
        },
        highlight = false,
        ignore_blank_lines = true,
      }

      vim.keymap.set('n', "<localleader>t", '<cmd>IronRepl<cr>')
      vim.keymap.set('n', "<localleader>r", '<cmd>IronRestart<cr>')
    end,
  },
}
