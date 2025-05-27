return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      preset = {
        pick = nil,
        keys = {
          {
            icon = ' ',
            key = 'f',
            desc = 'Search [F]ile',
            action = ":lua require('telescope.builtin').find_files()",
          },
          {
            icon = ' ',
            key = 't',
            desc = 'Search [T]ext',
            action = ":lua require('telescope.builtin').live_grep()",
          },
          {
            icon = ' ',
            key = 'r',
            desc = 'Search [R]ecent Files',
            action = ":lua require('telescope.builtin').oldfiles()",
          },
          {
            icon = ' ',
            key = 'e',
            desc = 'File [E]xplorer',
            action = ':Neotree',
          },
          {
            icon = ' ',
            key = 'n',
            desc = '[N]ew File',
            action = ':ene | startinsert',
          },
          {
            icon = ' ',
            key = 'c',
            desc = 'Neovim [C]onfig',
            action = ":lua require('telescope.builtin').find_files({cwd = vim.fn.stdpath('config')})",
          },
          {
            icon = '󰒲 ',
            key = 'l',
            desc = '[L]azy',
            action = ':Lazy',
            enabled = package.loaded.lazy ~= nil,
          },
          {
            icon = '',
            key = 'g',
            desc = '[G]it',
            action = ':LazyGit',
          },
          { icon = ' ', key = 'q', desc = '[Q]uit', action = ':qa' },
        },
      },
      sections = {
        { section = 'header' },
        {
          section = 'keys',
          gap = 1,
          padding = 1,
        },
        { section = 'startup' },
      },
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
  },
}
