

#' @title Make Project Template
#' @description Create a new project template in RStudio.
#'
#' @param path The path to the new project.
#'
#' @return R project with the proper folder structure
#' @export
#'
#' @examples
#' try(make_project_template("path/to/new/project"))
#' @importFrom usethis create_project
make_project_template <- function(path) {

  # stop if no path is provided
  if (path == "") {
    stop("You must provide a path for the new project.")
  }
  # create the project
  usethis::create_project(path, open = FALSE)

  # create the necessary directories
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # create the 01_data, 02_script, 03_output structure subdirectories
  dir.create(file.path(path, "01_data"), recursive = TRUE, showWarnings = FALSE)
  dir.create(file.path(path, "02_scripts"), recursive = TRUE, showWarnings = FALSE)
  dir.create(file.path(path, "03_output"), recursive = TRUE, showWarnings = FALSE)

  # create the _settings folder
  dir.create(file.path(path, "_settings"), recursive = TRUE, showWarnings = FALSE)


  # copy the script to the project
  script_source <- system.file("extdata", "dependencies.R", package = "RProjtemplates")
  script_dest <- file.path(path, "_settings", "dependencies.R")
  file.copy(script_source, script_dest, overwrite = TRUE)

  unlink(file.path(path, "R"), recursive = T)

}
