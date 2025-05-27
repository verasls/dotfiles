-- [[ Snippets ]]
local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- R code section

ls.add_snippets('r', {
  s('sect', {
    t '# ',
    i(1, 'SECT_NAME'),
    t ' ',
    f(function(args)
      local sect_name = args[1][1]
      local total_len = 80
      local prefix = '# '
      local space = ' '
      local dash_count = total_len - (#prefix + #sect_name + #space)
      if dash_count < 0 then
        dash_count = 0
      end
      return string.rep('-', dash_count)
    end, { 1 }),
  }),
})

-- R assignment operator
ls.add_snippets('r', {
  s(',,', {
    t '<- ',
    i(0),
  }),
})

-- R pipe operator
ls.add_snippets('r', {
  s('>>', {
    t '|>',
    i(0),
  }),
})

-- Quarto R code block
ls.add_snippets('all', {
  s('ccr', {
    t '```{r}',
    t { '', '' },
    i(0),
    t { '', '```' },
  }),
})

-- Quarto python code block
ls.add_snippets('all', {
  s('ccp', {
    t '```{python}',
    t { '', '' },
    i(0),
    t { '', '```' },
  }),
})
