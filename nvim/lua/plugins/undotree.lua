return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<C-q>", vim.cmd.UndotreeToggle)
  end
}
