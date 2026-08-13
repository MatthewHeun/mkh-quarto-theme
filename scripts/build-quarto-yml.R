# This script builds the _quarto.yml
# file for this book.
# I'm use this script, because 
# I want to re-use various parts 
# for my websites, including navbars and 
# page-footers.

# We use the R package yaml to do this work.
library(yaml)

# Load the function in the write-quarto-yml-function.R file.
file.path("_theme", "R", "write-quarto-yml-function.R") |> 
  source()

# Using the quarto-template.yml file, 
# stitch together the
# _quarto.yml file.
file.path("_quarto-template.yml") |> 
  write_quarto_yml()
