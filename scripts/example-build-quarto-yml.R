#
# DO NOT RUN THIS SCRIPT.
# IT IS MERELY AN EXAMPLE!
#
# This script provides an example
# for how to build the _quarto.yml file
# for each website.
# This script should be duplicated and saved to 
#
# scripts/build-quarto-yml.R
#
# Then, adjust as needed for each website.
#
# For example, a different navbar.yml
# file can be used for each website, 
# overriding the default provided at
#
# _theme/assets/default-quarto-yml/default-navbar.yml
#
# A website could have a different navbar at
#
# assets/quarto-yml/navbar.yml
# 
# In that event, the copy of this script 
# should replace the line
# 
# write_quarto_yml(base_quarto_yml_path = "_quarto-template.yml")
#
# with
#
# write_quarto_yml(base_quarto_yml_path = "_quarto-template.yml", 
#                  navbar_path = file.path("assets", "quarto-yml", "navbar.yml")

library(yaml)

# Load the function in the write-quarto-yml-function.R file.
source(file.path("_theme", "scripts", "write-quarto-yml-function.R"))

# Using the quarto-template.yml file, 
# stitch together the
# _quarto.yml file.
write_quarto_yml(base_quarto_yml_path = "_quarto-template.yml")
