make_descriptives <- function(data) {
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
      media = mean(valor, na.rm = TRUE),
      desvio_padrao = stats::sd(valor, na.rm = TRUE),
      minimo = min(valor, na.rm = TRUE),
      maximo = max(valor, na.rm = TRUE),
      n = sum(!is.na(valor)),
      .groups = "drop"
    ) |>
    dplyr::arrange(status_fumante, variavel)

  status_summary <- data |>
    dplyr::group_by(status_fumante) |>
    dplyr::summarise(
      n = dplyr::n(),
      peso_medio_kg = mean(peso_kg),
      tv_media = mean(TV),
      cigarro_medio = mean(cigarro),
      refrigerante_medio = mean(refrigerante),
      .groups = "drop"
    )

  list(desc = desc, status_summary = status_summary)
}
