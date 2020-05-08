# Dev packages
install.packages(c(
  "devtools", "roxygen2", "testthat", "knitr", "shiny"
  ),
  repos = "http://cran.us.r-project.org")
)

# Other packages
packages <- c(
  # Main
  "tidyverse", "tidymodels", "here", "Rcpp", "RSQlite",
  "cowplot", "janitor",
  # Stats
  "nlme", "lme4", "emmeans", "car",
  # Accelerometry
  "PhysicalActivity", "GGIR"
)

install.packages(packages, repos = "http://cran.us.r-project.org")

devtools::install_github("THLfi/read.gt3x", "jalvesaq/colorout")
