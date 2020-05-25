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

options(max.print = 100)
