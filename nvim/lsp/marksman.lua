local bin_name = 'marksman'
local cmd = { bin_name, 'server' }

return {
  cmd = cmd,
  filetypes = { 'markdown', 'quarto' },
  root_markers = { '.marksman.toml', '_quarto.yml', '.git' },
}
