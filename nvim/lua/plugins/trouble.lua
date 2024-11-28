return {
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({
        icons = {
          error = "",
          warning = "",
          hint = "",
          information = "",
          other = "",
        },
      })

      vim.keymap.set("n", "<leader>tt", function()
        local trouble = require("trouble")
        if trouble.is_open() then
          trouble.close()
        else
          trouble.open("diagnostics")
        end
      end)

      vim.keymap.set("n", "[t", function()
        require("trouble").next({ skip_groups = true, jump = true });
      end)

      vim.keymap.set("n", "]t", function()
        require("trouble").previous({ skip_groups = true, jump = true });
      end)
    end
  },
}
