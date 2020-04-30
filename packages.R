# Dev packages
install.packages(c(
  "devtools", "roxygen2", "testthat", "knitr"
  ),
  repos = "http://cran.dcc.fc.up.pt/")
)

# Other packages
packages <- c(
  # Main
  "tidyverse", "tidymodels", "here", "Rcpp", "RSQlite",
  # Stats
  "nlme", "lme4", "emmeans", "car",
  # Accelerometry
  "PhysicalActivity", "GGIR"
)

install.packages(packages, repos = "http://cran.dcc.fc.up.pt/")

devtools::install_github("THLfi/read.gt3x", "jalvesaq/colorout")
