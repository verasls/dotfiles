return {
  'stevearc/aerial.nvim',
  opts = {},
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('aerial').setup {
      layout = {
        min_width = 40,
      },
    }

    vim.keymap.set('n', '<leader>a', function()
      vim.cmd 'AerialToggle!'
      vim.schedule(function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].filetype == 'aerial' then
            vim.api.nvim_set_current_win(win)
            break
          end
        end
      end)
    end, { desc = '[A]erial' })
  end,
}
