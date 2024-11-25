return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.swiftlint,
        null_ls.builtins.formatting.swiftformat.with({
          extra_args = {
            "--maxwidth", "80",
            "--wrapcollections", "before-first",
            "--wraparguments", "before-first",
            "--wrapconditions", "before-first",
            "--wraptypealiases", "before-first",
            "--commas", "inline",
          },
        }),
      },
    })

    local swift_format_group = vim.api.nvim_create_augroup("SwiftFormat", { clear = true })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.swift",
      group = swift_format_group,
      callback = function()
        vim.lsp.buf.format({ timeout_ms = 2000 })
      end,
    })
  end
}

