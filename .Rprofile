# Set default CRAN mirror
local({
  mirror <- getOption("repos")
  mirror["CRAN"] <- "https://cran.rstudio.com/"
  options(repos = mirror)
})

# Warn on partial matches
options(
  warnPartialMatchAttr = TRUE,
  warnPartialMatchDollar = TRUE,
  warnPartialMatchArgs = TRUE
)

# Package development options
options(
  usethis.description = list(
    `Authors@R` = 'person("Lucas", "Veras", email = "lucasdsveras@gmail.com",
                          role = c("aut", "cre"),
                          comment = c(ORCID = "0000-0003-0562-5803"))',
    License = "MIT + file LICENSE"
  )
)

# General options
options(max.print = 999)
