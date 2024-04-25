function OpenNeoTree()
  vim.cmd("Neotree")
  vim.api.nvim_win_set_option(0, 'relativenumber', true)
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<C-q>", ":lua OpenNeoTree()<CR>", { silent = true })
  end
}
