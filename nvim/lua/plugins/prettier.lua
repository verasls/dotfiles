return {
  "prettier/vim-prettier",
  config = function()
    vim.g["prettier#autoformat"] = 1
    vim.g["prettier#autoformat_require_pragma"] = 0
  end
}
