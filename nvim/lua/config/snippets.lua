local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- R
ls.add_snippets("rmd", {
  s("cb", {
    t("```{r}"),
    t({"", ""}),
    i(0),
    t({"", "```"}),
  }),
})
