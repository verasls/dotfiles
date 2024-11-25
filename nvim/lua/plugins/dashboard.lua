return {
  'nvimdev/dashboard-nvim',
  dependencies = { {'nvim-tree/nvim-web-devicons'}},
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      shortcut_type = "number",
      config = {
        week_header = {
          enable = true
        },
        disable_move = true,
        shortcut = {
          { desc = 'New File ', group = '@property', action = 'enew', key = 'n' },
        },
      }
    }
  end
}
