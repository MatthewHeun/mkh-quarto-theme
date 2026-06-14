

write_quarto_yml <- function(base_quarto_yml_path,
                             output_yml_path = file.path("_quarto.yml"),
                             favicon_path = file.path("_theme", "common-yml", "common-favicon.yml"), 
                             navbar_path = file.path("_theme", "common-yml", "common-navbar.yml"), 
                             page_footer_path = file.path("_theme", "common-yml", "common-page-footer.yml"), 
                             format_path = file.path("_theme", "common-yml", "common-format.yml"), 
                             execute_path = file.path("_theme", "common-yml", "common-execute.yml")) {

  base_quarto_yml <- yaml::yaml.load_file(base_quarto_yml_path)
  favicon_yml <- yaml::yaml.load_file(favicon_path)
  nabvar_yml <- yaml::yaml.load_file(navbar_path)
  page_footer_yml <- yaml::yaml.load_file(page_footer_path)
  format_yml <- yaml::yaml.load_file(format_path)
  execute_yml <- yaml::yaml.load_file(execute_path)

  project_type <- base_quarto_yml$project$type

  out_yml <- base_quarto_yml
  out_yml[[project_type]][["favicon"]] <- favicon_yml
  out_yml[[project_type]][["navbar"]] <- nabvar_yml
  out_yml[[project_type]][["page-footer"]] <- page_footer_yml
  out_yml[["format"]] <- format_yml
  out_yml[["execute"]] <- execute_yml

  out_yml |> 
    # Turn the data into a long string.
    yaml::as.yaml() |> 
    # Fix a problem where the yaml package
    # writes "yes" and "no" for 
    # "true" and "false". <<eyeroll emoji>>
    gsub(pattern = ": yes\n", replacement = ": true\n") |> 
    gsub(pattern = ": no\n", replacement = ": false\n") |> 
    # Write the modified string to the desired file.
    cat(file = output_yml_path)
}
