return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<C-s>"] = "select_vertical",
            ["<C-h>"] = "select_horizontal"
          }
        }
      }
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-f>", builtin.find_files, {})
    vim.keymap.set("n", "<C-g>", builtin.git_files, {})
    vim.keymap.set("n", "<C-s>", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
  end
}
