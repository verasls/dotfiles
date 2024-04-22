return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "windwp/nvim-ts-autotag" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "vimdoc", "javascript", "typescript", "tsx", "c", "lua", "rust",
        "jsdoc", "bash", "css", "html", "python", "r"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = {
        enable = true,
        filetypes = {
          "html", "javascript", "typescript",
          "javascriptreact", "typescriptreact",
          "jsx", "tsx"
        }
      }
    })
  end
}
