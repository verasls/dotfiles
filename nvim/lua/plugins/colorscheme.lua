return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 100,
  config = function()
    require("catppuccin").setup({ flavour = "macchiato" })
    vim.cmd("colorscheme catppuccin")
  end
}
