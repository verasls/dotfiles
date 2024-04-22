-- R
vim.api.nvim_command(
  "autocmd FileType r,rmd inoremap <buffer> >> <Esc>:normal! a <Bar>><CR>a"
)
vim.api.nvim_command(
  "autocmd FileType r,rmd inoremap <buffer> ,, <Esc>:normal! a <- <CR>a"
)

function CreateSection()
  local section_name = vim.fn.input("Enter section name: ")

  if section_name ~= "" then
    local section_length = 80 - string.len(section_name) - 3
    local section_line = "# " .. section_name .. " " .. string.rep("-", section_length)
    vim.api.nvim_call_function("append", { vim.fn.line("."), section_line })
  end
end

vim.api.nvim_command(
  "autocmd FileType r nnoremap <buffer> <leader>s :lua CreateSection()<CR>"
)

-- Javascript/Typescript
vim.api.nvim_command(
  "autocmd FileType javascript,typescript,typescriptreact" ..
  " inoremap <buffer> ,, <Esc>:normal! a => <CR>a"
)

