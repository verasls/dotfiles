function StartREPL()
  local repl = vim.fn.input("Enter the desired program: ")

  if string.lower(repl) == "r" then
    repl = "R --no-save"
  end

  if repl ~= "" then
    vim.cmd("vsplit | wincmd l")
    vim.cmd("enew")
    vim.fn.termopen(repl)
    vim.cmd("wincmd h")
  end
end

return {
  "jpalardy/vim-slime",
  init = function()
    vim.g.slime_no_mappings = 1
    vim.g.slime_target = "neovim"
  end,
  config = function()
    vim.keymap.set("n", "<leader>t", ":lua StartREPL()<CR>")
    vim.keymap.set("n", "<Space>", "<Plug>SlimeParagraphSend")
    vim.keymap.set("v", "<Space>", "<Plug>SlimeRegionSend")
  end
}
