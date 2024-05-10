return {
  "folke/zen-mode.nvim",
  config = function()
    vim.keymap.set("n", "<leader>z", function()
      require("zen-mode").toggle({
        plugins = {
          twilight = { enabled = false },
          gitsigns = { enabled = true },
          tmux = { enabled = true },
          alacritty = {
            enabled = true,
            font = "14",
          },
        },
      })
    end)
  end
}
