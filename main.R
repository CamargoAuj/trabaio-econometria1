this_file <- tryCatch(normalizePath(sys.frame(1)$ofile), error = function(e) NA_character_)
if (!is.na(this_file) && nzchar(this_file)) {
  setwd(dirname(this_file))
}

local_lib <- file.path(getwd(), "R_libs")
dir.create(local_lib, recursive = TRUE, showWarnings = FALSE)
.libPaths(c(normalizePath(local_lib, mustWork = FALSE), .libPaths()))

options(
  repos = c(CRAN = "https://cloud.r-project.org"),
  encoding = "UTF-8"
)

required_packages <- c(
  "haven", "dplyr", "tidyr", "ggplot2", "lmtest", "sandwich",
  "broom", "modelsummary", "knitr", "kableExtra", "readr", "stringr"
)

missing_packages <- required_packages[
  !vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)
]

if (length(missing_packages) > 0) {
  install.packages(
    missing_packages,
    lib = local_lib,
    dependencies = c("Depends", "Imports", "LinkingTo")
  )
}

invisible(lapply(required_packages, library, character.only = TRUE))

source(file.path("R", "01_import_clean.R"), encoding = "UTF-8")
source(file.path("R", "02_descriptive.R"), encoding = "UTF-8")
source(file.path("R", "03_models.R"), encoding = "UTF-8")
source(file.path("R", "04_tables.R"), encoding = "UTF-8")

paths <- list(
  data = "Dados pns 2013.dta",
  guide = "GUIA.md",
  tables = file.path("output", "tables"),
  diagnostics = file.path("output", "diagnostics"),
  models = file.path("output", "models"),
  latex = "latex"
)

ensure_project_dirs(paths)

raw_data <- import_pns(paths$data, paths$diagnostics)
metadata <- inspect_pns_metadata(raw_data, paths$diagnostics)
cleaned <- clean_pns(raw_data)

descriptives <- make_descriptives(cleaned$data)
models <- estimate_models(cleaned$data, paths$models)
diagnostics <- run_model_diagnostics(models, paths$diagnostics)

tables <- write_all_tables(
  cleaned = cleaned,
  metadata = metadata,
  descriptives = descriptives,
  models = models,
  diagnostics = diagnostics,
  out_dir = paths$tables
)

write_latex_documents(
  cleaned = cleaned,
  metadata = metadata,
  descriptives = descriptives,
  models = models,
  diagnostics = diagnostics,
  tables = tables,
  out_dir = paths$latex
)

message("Projeto executado com sucesso.")
message("Relatorio principal: ", normalizePath(file.path(paths$latex, "relatorio.tex")))
message("Apendice: ", normalizePath(file.path(paths$latex, "apendice.tex")))
message("Tabelas: ", normalizePath(paths$tables))
message("Diagnosticos: ", normalizePath(paths$diagnostics))
