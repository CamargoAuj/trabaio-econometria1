estimate_models <- function(data, out_dir = file.path("output", "models")) {
  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

  modelo_1 <- stats::lm(peso_gramas ~ TV + cigarro, data = data)
  modelo_2 <- stats::lm(log_peso ~ TV + log_cigarro, data = data)
  modelo_3 <- stats::lm(
    log_peso ~ TV + log_cigarro + refrigerante + idade_c + idade_c2 +
      altura_cm + sexo + cor_raca + alfabetizado + estado_civil +
      regiao + tamanho_dom,
    data = data
  )

  models <- list(
    "Modelo 1: nivel" = modelo_1,
    "Modelo 2: log" = modelo_2,
    "Modelo 3: ampliado" = modelo_3
  )

  robust_vcov <- lapply(models, sandwich::vcovHC, type = "HC1")
  robust_coeftest <- Map(lmtest::coeftest, models, robust_vcov)

  robust_tidy <- Map(
    function(ct, name) {
      mat <- as.matrix(ct)
      data.frame(
        modelo = name,
        termo = rownames(mat),
        estimativa = mat[, 1],
        erro_padrao = mat[, 2],
        estatistica = mat[, 3],
        p_valor = mat[, 4],
        row.names = NULL
      )
    },
    robust_coeftest,
    names(robust_coeftest)
  ) |>
    dplyr::bind_rows()

  safe_save_rds <- function(object, path) {
    tmp <- paste0(path, ".tmp")
    if (file.exists(tmp)) unlink(tmp, force = TRUE)
    saveRDS(object, tmp, compress = FALSE)
    if (file.exists(path)) unlink(path, force = TRUE)
    ok <- file.rename(tmp, path)
    if (!ok) {
      stop("Nao foi possivel gravar o arquivo: ", path, call. = FALSE)
    }
  }

  compact_models <- lapply(models, function(model) {
    model_summary <- summary(model)
    list(
      call = model$call,
      coefficients = model_summary$coefficients,
      r_squared = model_summary$r.squared,
      adj_r_squared = model_summary$adj.r.squared,
      sigma = model_summary$sigma,
      df = model_summary$df,
      nobs = stats::nobs(model)
    )
  })

  safe_save_rds(compact_models, file.path(out_dir, "modelos_lm.rds"))
  safe_save_rds(robust_vcov, file.path(out_dir, "vcov_robusta_hc1.rds"))
  readr::write_csv(robust_tidy, file.path(out_dir, "coeficientes_robustos_hc1.csv"))

  list(
    models = models,
    robust_vcov = robust_vcov,
    robust_coeftest = robust_coeftest,
    robust_tidy = robust_tidy,
    data = data
  )
}

compute_vif <- function(model) {
  x <- stats::model.matrix(model)
  x <- x[, colnames(x) != "(Intercept)", drop = FALSE]
  keep <- apply(x, 2, stats::sd, na.rm = TRUE) > 0
  x <- x[, keep, drop = FALSE]

  if (ncol(x) == 0) {
    return(data.frame(termo = character(), vif = numeric()))
  }
  if (ncol(x) == 1) {
    return(data.frame(termo = colnames(x), vif = 1))
  }

  vifs <- vapply(
    seq_len(ncol(x)),
    function(j) {
      y <- x[, j]
      others <- x[, -j, drop = FALSE]
      fit <- stats::lm(y ~ others)
      r2 <- summary(fit)$r.squared
      if (is.na(r2) || r2 >= 1) Inf else 1 / (1 - r2)
    },
    numeric(1)
  )

  data.frame(termo = colnames(x), vif = as.numeric(vifs), row.names = NULL)
}

white_test_fitted <- function(model) {
  residual_sq <- stats::residuals(model)^2
  fitted_values <- stats::fitted(model)
  aux <- stats::lm(residual_sq ~ fitted_values + I(fitted_values^2))
  statistic <- length(residual_sq) * summary(aux)$r.squared
  p_value <- stats::pchisq(statistic, df = 2, lower.tail = FALSE)
  data.frame(statistic = statistic, parameter = 2, p.value = p_value)
}

normality_diagnostic <- function(model) {
  residuals <- stats::residuals(model)
  n <- length(residuals)
  centered <- residuals - mean(residuals)
  sd_res <- stats::sd(residuals)
  skewness <- mean((centered / sd_res)^3)
  kurtosis <- mean((centered / sd_res)^4)
  jb <- n / 6 * (skewness^2 + ((kurtosis - 3)^2 / 4))
  p_value <- stats::pchisq(jb, df = 2, lower.tail = FALSE)
  data.frame(n = n, assimetria = skewness, curtose = kurtosis, jb = jb, p_valor = p_value)
}

plot_residuals <- function(model, name, out_dir) {
  plot_data <- data.frame(
    ajustado = stats::fitted(model),
    residuo = stats::residuals(model)
  )

  p <- ggplot2::ggplot(plot_data, ggplot2::aes(x = ajustado, y = residuo)) +
    ggplot2::geom_point(alpha = 0.16, size = 0.45, color = "#2f5f73") +
    ggplot2::geom_hline(yintercept = 0, color = "#9b2d30", linewidth = 0.4) +
    ggplot2::labs(x = "Valores ajustados", y = "Residuos") +
    ggplot2::theme_minimal(base_size = 10)

  ggplot2::ggsave(
    filename = file.path(out_dir, paste0("residuos_ajustados_", name, ".png")),
    plot = p,
    width = 7,
    height = 4,
    dpi = 150
  )
}

plot_cooks <- function(model, name, out_dir) {
  cooks <- stats::cooks.distance(model)
  threshold <- 4 / length(cooks)
  plot_data <- data.frame(indice = seq_along(cooks), cook = cooks)

  p <- ggplot2::ggplot(plot_data, ggplot2::aes(x = indice, y = cook)) +
    ggplot2::geom_point(alpha = 0.45, size = 0.4, color = "#5f4b8b") +
    ggplot2::geom_hline(yintercept = threshold, color = "#9b2d30", linewidth = 0.4) +
    ggplot2::labs(x = "Observacao", y = "Distancia de Cook") +
    ggplot2::theme_minimal(base_size = 10)

  ggplot2::ggsave(
    filename = file.path(out_dir, paste0("cooks_distance_", name, ".png")),
    plot = p,
    width = 7,
    height = 4,
    dpi = 150
  )
}

run_model_diagnostics <- function(model_objects, out_dir = file.path("output", "diagnostics")) {
  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
  models <- model_objects$models
  simple_names <- paste0("modelo", seq_along(models))

  bp <- Map(
    function(model, label) {
      test <- lmtest::bptest(model)
      data.frame(
        modelo = label,
        teste = "Breusch-Pagan",
        estatistica = unname(test$statistic),
        gl = unname(test$parameter),
        p_valor = test$p.value,
        row.names = NULL
      )
    },
    models,
    names(models)
  ) |>
    dplyr::bind_rows()

  white <- Map(
    function(model, label) {
      test <- white_test_fitted(model)
      data.frame(
        modelo = label,
        teste = "White (ajustado e ajustado^2)",
        estatistica = test$statistic,
        gl = test$parameter,
        p_valor = test$p.value,
        row.names = NULL
      )
    },
    models,
    names(models)
  ) |>
    dplyr::bind_rows()

  vif <- Map(
    function(model, label) {
      compute_vif(model) |>
        dplyr::mutate(modelo = label, .before = 1)
    },
    models,
    names(models)
  ) |>
    dplyr::bind_rows()

  influence <- Map(
    function(model, label) {
      cooks <- stats::cooks.distance(model)
      threshold <- 4 / length(cooks)
      top <- sort(cooks, decreasing = TRUE)[1:min(10, length(cooks))]
      readr::write_csv(
        data.frame(indice = as.integer(names(top)), cooks_distance = as.numeric(top)),
        file.path(out_dir, paste0("top_cooks_", make.names(label), ".csv"))
      )
      data.frame(
        modelo = label,
        n = length(cooks),
        limite_4_n = threshold,
        max_cook = max(cooks, na.rm = TRUE),
        p99_cook = as.numeric(stats::quantile(cooks, 0.99, na.rm = TRUE)),
        n_acima_4_n = sum(cooks > threshold, na.rm = TRUE),
        row.names = NULL
      )
    },
    models,
    names(models)
  ) |>
    dplyr::bind_rows()

  normality <- Map(
    function(model, label) {
      normality_diagnostic(model) |>
        dplyr::mutate(modelo = label, .before = 1)
    },
    models,
    names(models)
  ) |>
    dplyr::bind_rows()

  invisible(Map(plot_residuals, models, simple_names, MoreArgs = list(out_dir = out_dir)))
  invisible(Map(plot_cooks, models, simple_names, MoreArgs = list(out_dir = out_dir)))

  readr::write_csv(bp, file.path(out_dir, "breusch_pagan.csv"))
  readr::write_csv(white, file.path(out_dir, "white_fitted.csv"))
  readr::write_csv(vif, file.path(out_dir, "vif.csv"))
  readr::write_csv(influence, file.path(out_dir, "influencia_cook.csv"))
  readr::write_csv(normality, file.path(out_dir, "normalidade_residuos.csv"))

  list(
    bp = bp,
    white = white,
    vif = vif,
    influence = influence,
    normality = normality
  )
}
