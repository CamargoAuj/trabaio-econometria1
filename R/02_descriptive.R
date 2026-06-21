safe_mean <- function(x) {
  if (all(is.na(x))) NA_real_ else mean(x, na.rm = TRUE)
}


safe_sd <- function(x) {
  if (sum(!is.na(x)) <= 1) NA_real_ else stats::sd(x, na.rm = TRUE)
}


safe_min <- function(x) {
  if (all(is.na(x))) NA_real_ else min(x, na.rm = TRUE)
}


safe_max <- function(x) {
  if (all(is.na(x))) NA_real_ else max(x, na.rm = TRUE)
}


make_descriptives <- function(data) {
  required <- c(
    "status_fumante", "peso_kg", "peso_gramas",
    "TV", "cigarro", "refrigerante"
  )

  missing_required <- setdiff(required, names(data))

  if (length(missing_required) > 0) {
    stop(
      "Variáveis ausentes para as estatísticas descritivas: ",
      paste(missing_required, collapse = ", "),
      call. = FALSE
    )
  }

  long <- data |>
    dplyr::transmute(
      status_fumante,
      `Peso (gramas)` = peso_gramas,
      `TV (horas/dia)` = TV,
      `Cigarros/dia` = cigarro,
      `Refrigerante (copos/semana)` = refrigerante
    ) |>
    tidyr::pivot_longer(
      cols = -status_fumante,
      names_to = "variavel",
      values_to = "valor"
    )

  desc <- long |>
    dplyr::group_by(status_fumante, variavel) |>
    dplyr::summarise(
      media = safe_mean(valor),
      desvio_padrao = safe_sd(valor),
      minimo = safe_min(valor),
      maximo = safe_max(valor),
      n = sum(!is.na(valor)),
      .groups = "drop"
    ) |>
    dplyr::arrange(status_fumante, variavel)

  status_summary <- data |>
    dplyr::group_by(status_fumante) |>
    dplyr::summarise(
      n = dplyr::n(),
      peso_medio_kg = safe_mean(peso_kg),
      tv_media = safe_mean(TV),
      cigarro_medio = safe_mean(cigarro),
      refrigerante_medio = safe_mean(refrigerante),
      .groups = "drop"
    )

  list(
    desc = desc,
    status_summary = status_summary
  )
}
