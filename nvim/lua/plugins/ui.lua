return {
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup()
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        sections = {
          lualine_b = {
            {
              "diagnostics",
              sections = { "error", "warn", "info", "hint" },
              symbols = { error = "E", warn = "W", info = "I", hint = "H" },
              colored = true,
              update_in_insert = false,
              always_visible = false
            }
          },
          lualine_c = { { 'filename', path = 1 } }
        }
      })
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup({
        exclude = {
          filetypes = { "dashboard" },
        },
      })
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
        },
        views = {
          cmdline_popup = {
            position = {
              row = "40%",
              column = "50%",
            }
          },
          hover = {
            border = {
              style = "rounded"
            },
            win_options = {
              winhighlight = {
                Normal = "NoiceCmdlinePopup",
              },
            },
          }
        }
      })
    end
  }
}
