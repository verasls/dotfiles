# Install and setup pak
install.packages("pak", repos = "https://cran.rstudio.com/")
pak::pak_setup()

packages <- c(
  # Dev
  "devtools", "roxygen2", "testthat", "knitr", "shiny",
  "microbenchmark", "sloop", "lintr",
  # Main
  "tidyverse", "tidymodels", "here", "Rcpp", "RSQlite",
  "patchwork", "ragg", "janitor", "lobstr", "data.table", "fst",
  # Stats
  "nlme", "lme4", "lmerTest", "emmeans", "car", "MASS", "psych"
  # Accelerometry
  "PhysicalActivity", "GGIR",
  # Github
  "THLfi/read.gt3x", "jalvesaq/colorout", "rileytwo/darkstudio",
  # Mine
  "lvmisc", "impactr"
)

pak::pkg_install(packages)

# Config RStudio theme
darkstudio::activate()
