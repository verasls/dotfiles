-- [[ Snippets ]]
local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

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
