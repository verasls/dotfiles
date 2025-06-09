return {
  cmd = { 'R', '--no-echo', '-e', 'languageserver::run()' },
  filetypes = { 'r' },
  root_dir = function(bufnr, on_dir)
    on_dir(vim.fs.root(bufnr, '.git') or vim.uv.os_homedir())
  end,
  settings = {
    r = {
      lsp = {
        rich_documentation = false,
      },
      server_capabilities = {
        documentFormattingProvider = false,
        documentRangeFormattingProvider = false,
      },
    },
  },
}
