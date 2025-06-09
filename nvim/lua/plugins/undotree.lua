return {
  'mbbill/undotree',
  config = function()
    vim.keymap.set('n', '<localleader>u', function()
      vim.cmd 'UndotreeToggle'
      vim.schedule(function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].filetype == 'undotree' then
            vim.api.nvim_set_current_win(win)
            break
          end
        end
      end)
    end, { desc = '[U]ndotree' })

    -- Line numbers for undotree
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'undotree',
      callback = function()
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
      end,
    })
  end,
}
