packages <- c(
  # Dev
  "devtools", "roxygen2", "testthat", "knitr", "shiny",
  "microbenchmark", "sloop",
  # Main
  "tidyverse", "tidymodels", "here", "Rcpp", "RSQlite",
  "cowplot", "janitor", "lobstr", "data.table", "fst",
  # Stats
  "nlme", "lme4", "emmeans", "car", "MASS",
  # Accelerometry
  "PhysicalActivity", "GGIR"
)

install.packages(packages, repos = "http://cran.us.r-project.org")

devtools::install_github("THLfi/read.gt3x", "jalvesaq/colorout")
