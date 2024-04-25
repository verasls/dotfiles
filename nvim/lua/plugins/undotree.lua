return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<C-w>", vim.cmd.UndotreeToggle)
  end
}
