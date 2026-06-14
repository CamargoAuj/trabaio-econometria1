fmt_num <- function(x, digits = 2) {
  out <- formatC(x, format = "f", digits = digits, big.mark = ".", decimal.mark = ",")
  out[is.na(x)] <- ""
  out
}

fmt_p <- function(x) {
  dplyr::case_when(
    is.na(x) ~ "",
    x < 0.001 ~ "<0,001",
    TRUE ~ fmt_num(x, 3)
  )
}

p_inline <- function(x) {
  p <- fmt_p(x)
  p_math <- gsub(",", "{,}", p, fixed = TRUE)
  ifelse(grepl("^<", p), paste0("$p", p_math, "$"), paste0("$p=", p_math, "$"))
}

write_kable_latex <- function(df, path, caption = NULL, label = NULL, digits = 3) {
  table_tex <- knitr::kable(
    df,
    format = "latex",
    booktabs = TRUE,
    caption = caption,
    label = label,
    digits = digits,
    escape = TRUE
  )
  table_tex <- kableExtra::kable_styling(
    table_tex,
    latex_options = "scale_down",
    font_size = 8
  )
  writeLines(table_tex, path, useBytes = TRUE)
  path
}

write_all_tables <- function(cleaned, metadata, descriptives, models, diagnostics, out_dir = file.path("output", "tables")) {
  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
  unlink(file.path(out_dir, "normalidade.tex"), force = TRUE)
  old_options <- options(
    modelsummary_format_numeric_latex = "plain",
    modelsummary_factory_latex = "kableExtra"
  )
  on.exit(options(old_options), add = TRUE)

  desc_table <- descriptives$desc |>
    dplyr::mutate(
      media = fmt_num(media, 2),
      desvio_padrao = fmt_num(desvio_padrao, 2),
      minimo = fmt_num(minimo, 2),
      maximo = fmt_num(maximo, 2),
      n = format(n, big.mark = ".", decimal.mark = ",")
    ) |>
    dplyr::rename(
      `Status de fumante` = status_fumante,
      Variável = variavel,
      Média = media,
      `Desvio-padrão` = desvio_padrao,
      Mínimo = minimo,
      Máximo = maximo,
      N = n
    )

  desc_path <- file.path(out_dir, "descritivas_status_fumante.tex")
  write_kable_latex(
    desc_table,
    desc_path,
    caption = "Estatísticas descritivas por status de fumante",
    label = "descritivas",
    digits = 2
  )

  audit_table <- cleaned$audit |>
    dplyr::mutate(
      n_antes = format(n_antes, big.mark = ".", decimal.mark = ","),
      removidas = format(removidas, big.mark = ".", decimal.mark = ","),
      n_depois = format(n_depois, big.mark = ".", decimal.mark = ",")
    ) |>
    dplyr::rename(
      Etapa = etapa,
      `N antes` = n_antes,
      Removidas = removidas,
      `N depois` = n_depois,
      Observacao = observacao
    )

  audit_path <- file.path(out_dir, "auditoria_limpeza.tex")
  write_kable_latex(
    audit_table,
    audit_path,
    caption = "Auditoria da limpeza da base",
    label = "limpeza",
    digits = 0
  )

  var_table <- cleaned$variable_availability |>
    dplyr::rename(
      Item = item,
      Codigo = codigo_usado,
      Status = status,
      Tratamento = tratamento
    )

  var_path <- file.path(out_dir, "variaveis_usadas.tex")
  write_kable_latex(
    var_table,
    var_path,
    caption = "Variaveis procuradas, disponibilidade e tratamento",
    label = "variaveis",
    digits = 2
  )

  coef_map <- c(
    "TV" = "TV (horas/dia)",
    "cigarro" = "Cigarros/dia",
    "log_cigarro" = "log(cigarros+1)",
    "refrigerante" = "Refrigerante (copos/semana)",
    "idade_c" = "Idade centrada",
    "idade_c2" = "Idade centrada ao quadrado",
    "altura_cm" = "Altura (cm)",
    "sexoMulher" = "Mulher"
  )

  gof_map <- data.frame(
    raw = c("nobs", "r.squared", "adj.r.squared"),
    clean = c("N", "R2", "R2 ajustado"),
    fmt = c(0, 3, 3)
  )

  main_reg_path <- file.path(out_dir, "regressoes_principais.tex")
  modelsummary::modelsummary(
    models$models,
    vcov = models$robust_vcov,
    coef_map = coef_map,
    gof_map = gof_map,
    stars = TRUE,
    statistic = "({std.error})",
    fmt = 3,
    output = main_reg_path,
    title = "Regressões MQO com erros-padrão robustos HC1",
    notes = c(
      "Erros-padrão robustos HC1 entre parênteses.",
      "O modelo 3 também inclui cor/raça, alfabetização, estado civil, região e tamanho do domicílio."
    )
  )

  full_reg_path <- file.path(out_dir, "regressoes_completas_robustas.tex")
  modelsummary::modelsummary(
    models$models,
    vcov = models$robust_vcov,
    gof_map = gof_map,
    stars = TRUE,
    statistic = "({std.error})",
    fmt = 4,
    output = full_reg_path,
    title = "Saída completa das regressões usadas no relatório",
    notes = "Erros-padrão robustos HC1 entre parênteses."
  )

  hetero <- dplyr::bind_rows(diagnostics$bp, diagnostics$white) |>
    dplyr::mutate(
      decisao_5 = dplyr::if_else(p_valor < 0.05, "Rejeita homoced.", "Não rejeita"),
      estatistica = fmt_num(estatistica, 3),
      p_valor = fmt_p(p_valor)
    ) |>
    dplyr::rename(
      Modelo = modelo,
      Teste = teste,
      Estatística = estatistica,
      GL = gl,
      `p-valor` = p_valor,
      `Decisão 5%` = decisao_5
    )

  hetero_path <- file.path(out_dir, "heterocedasticidade.tex")
  write_kable_latex(
    hetero,
    hetero_path,
    caption = "Testes de heterocedasticidade",
    label = "hetero",
    digits = 3
  )

  vif_table <- diagnostics$vif |>
    dplyr::mutate(vif = fmt_num(vif, 2)) |>
    dplyr::rename(Modelo = modelo, Termo = termo, VIF = vif)

  vif_path <- file.path(out_dir, "vif.tex")
  write_kable_latex(
    vif_table,
    vif_path,
    caption = "Fatores de inflação da variância",
    label = "vif",
    digits = 2
  )

  influence_table <- diagnostics$influence |>
    dplyr::mutate(
      limite_4_n = fmt_num(limite_4_n, 6),
      max_cook = fmt_num(max_cook, 4),
      p99_cook = fmt_num(p99_cook, 4),
      n_acima_4_n = format(n_acima_4_n, big.mark = ".", decimal.mark = ","),
      n = format(n, big.mark = ".", decimal.mark = ",")
    ) |>
    dplyr::rename(
      Modelo = modelo,
      N = n,
      `Limite 4/N` = limite_4_n,
      `Cook máx.` = max_cook,
      `Cook p99` = p99_cook,
      `N acima 4/N` = n_acima_4_n
    )

  influence_path <- file.path(out_dir, "influencia_cook.tex")
  write_kable_latex(
    influence_table,
    influence_path,
    caption = "Resumo de influência por distância de Cook",
    label = "cook",
    digits = 4
  )

  normality_table <- diagnostics$normality |>
    dplyr::mutate(
      n = format(n, big.mark = ".", decimal.mark = ","),
      assimetria = fmt_num(assimetria, 3),
      curtose = fmt_num(curtose, 3),
      jb = fmt_num(jb, 2),
      p_valor = fmt_p(p_valor)
    ) |>
    dplyr::rename(
      Modelo = modelo,
      N = n,
      Assimetria = assimetria,
      Curtose = curtose,
      `Jarque-Bera` = jb,
      `p-valor` = p_valor
    )

  normality_path <- file.path(out_dir, "normalidade.tex")
  write_kable_latex(
    normality_table,
    normality_path,
    caption = "Diagnóstico secundário de normalidade dos resíduos",
    label = "normalidade",
    digits = 3
  )

  list(
    desc = desc_path,
    audit = audit_path,
    variables = var_path,
    reg_main = main_reg_path,
    reg_full = full_reg_path,
    hetero = hetero_path,
    vif = vif_path,
    influence = influence_path,
    normality = normality_path
  )
}

coef_lookup <- function(models, model_name, term) {
  row <- models$robust_tidy |>
    dplyr::filter(modelo == model_name, termo == term)
  if (nrow(row) == 0) {
    return(list(estimate = NA_real_, p = NA_real_))
  }
  list(estimate = row$estimativa[1], p = row$p_valor[1])
}

model_glance <- function(model) {
  s <- summary(model)
  list(r2 = s$r.squared, adj = s$adj.r.squared, n = stats::nobs(model))
}

write_latex_documents <- function(cleaned, metadata, descriptives, models, diagnostics, tables, out_dir = "latex") {
  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

  status <- descriptives$status_summary
  status_value <- function(status_name, col) {
    status[[col]][match(status_name, status$status_fumante)]
  }

  m1_tv <- coef_lookup(models, "Modelo 1: nível", "TV")
  m1_cig <- coef_lookup(models, "Modelo 1: nível", "cigarro")
  m1_ref <- coef_lookup(models, "Modelo 1: nível", "refrigerante")
  m2_tv <- coef_lookup(models, "Modelo 2: log", "TV")
  m2_cig <- coef_lookup(models, "Modelo 2: log", "log_cigarro")
  m2_ref <- coef_lookup(models, "Modelo 2: log", "refrigerante")
  m2_max_p <- max(m2_tv$p, m2_cig$p, m2_ref$p, na.rm = TRUE)
  m1_cig_sig <- if (is.na(m1_cig$p)) {
    ""
  } else if (m1_cig$p < 0.05) {
    "estatisticamente diferente de zero a 5%"
  } else if (m1_cig$p < 0.10) {
    "evidência apenas marginal a 10%"
  } else {
    "sem significância estatística a 10%"
  }
  m3_tv <- coef_lookup(models, "Modelo 3: ampliado", "TV")
  m3_cig <- coef_lookup(models, "Modelo 3: ampliado", "log_cigarro")
  m3_ref <- coef_lookup(models, "Modelo 3: ampliado", "refrigerante")

  g1 <- model_glance(models$models[[1]])
  g2 <- model_glance(models$models[[2]])
  g3 <- model_glance(models$models[[3]])

  # Apenas White agora
  white_min <- min(diagnostics$white$p_valor, na.rm = TRUE)
  normality_min <- min(diagnostics$normality$p_valor, na.rm = TRUE)
  max_vif_m3 <- diagnostics$vif |>
    dplyr::filter(modelo == "Modelo 3: ampliado") |>
    dplyr::summarise(max_vif = max(vif, na.rm = TRUE)) |>
    dplyr::pull(max_vif)

  report <- c(
    "\\documentclass[10pt,a4paper]{article}",
    "\\usepackage[utf8]{inputenc}",
    "\\usepackage[T1]{fontenc}",
    "\\usepackage[brazil]{babel}",
    "\\usepackage[a4paper,margin=1.75cm]{geometry}",
    "\\usepackage{lmodern}",
    "\\usepackage{microtype}",
    "\\usepackage{amsmath,amssymb}",
    "\\usepackage{booktabs,array,tabularx}",
    "\\usepackage{caption,float}",
    "\\usepackage{xcolor}",
    "\\usepackage{enumitem}",
    "\\usepackage{titlesec}",
    "\\usepackage{hyperref}",
    "",
    "\\definecolor{SafraBlue}{HTML}{17324D}",
    "\\definecolor{SoftGray}{HTML}{F4F6F8}",
    "\\definecolor{DarkGray}{HTML}{30343B}",
    "",
    "\\hypersetup{",
    "    colorlinks=true,",
    "    linkcolor=SafraBlue,",
    "    urlcolor=SafraBlue,",
    "    citecolor=SafraBlue,",
    "    pdftitle={Maus hábitos e peso corporal na PNS 2013}",
    "}",
    "",
    "\\setlength{\\parindent}{0pt}",
    "\\setlength{\\parskip}{4pt}",
    "\\captionsetup{font=small,labelfont=bf,justification=centering}",
    "\\titleformat{\\section}{\\large\\bfseries\\color{SafraBlue}}{}{0pt}{}",
    "\\renewcommand{\\arraystretch}{1.12}",
    "",
    "\\newcommand{\\inputtable}[1]{\\IfFileExists{output/tables/#1}{\\input{output/tables/#1}}{\\input{../output/tables/#1}}}",
    "",
    "\\begin{document}",
    "",
    "\\begin{center}",
    "    {\\Large\\bfseries\\color{SafraBlue} Maus hábitos e peso corporal na PNS 2013}\\par",
    "    \\vspace{2pt}",
    "    {\\normalsize Uma análise econométrica descritiva de corte transversal}\\par",
    "\\end{center}",
    "\\vspace{-2pt}",
    "\\hrule",
    "\\vspace{6pt}",
    "",
    "\\section{Introdução e Dados}",
    paste0(
      "Este relatório avalia se três hábitos de risco -- assistir televisão, fumar cigarros e consumir refrigerante ou suco artificial -- estão associados ao peso dos indivíduos na PNS 2013. ",
      "A pergunta é descritiva e econométrica, não causal. A base recebida contém ", format(nrow(models$data), big.mark = ".", decimal.mark = ","),
      " observações válidas. O peso medido foi convertido em gramas; TV foi transformada nos pontos médios das faixas; ",
      "cigarros/dia combina status de fumante e quantidade diária, com zero para não fumantes; refrigerante é medido em copos por semana. ",
      "O modelo ampliado usa controles demográficos como idade, sexo, altura, cor/raça, alfabetização, estado civil, região e tamanho do domicílio."
    ),
    "",
    "\\section{Estatísticas Descritivas e Estratégia Empírica}",
    paste0(
      "A Tabela \\ref{tab:descritivas} sugere diferenças brutas pequenas no peso: não fumantes pesam em média ",
      fmt_num(status_value("Não fumante", "peso_medio_kg"), 1), " kg, contra ",
      fmt_num(status_value("Fumante diário", "peso_medio_kg"), 1), " kg entre fumantes diários. ",
      "Fumantes diários assistem mais TV (", fmt_num(status_value("Fumante diário", "tv_media"), 2),
      " h/dia) e fumam ", fmt_num(status_value("Fumante diário", "cigarro_medio"), 2),
      " cigarros/dia."
    ),
    "\\inputtable{descritivas_status_fumante.tex}",
    paste0(
      "Em MQO múltiplo, foram estimadas três especificações: um modelo em nível com os três hábitos; uma versão log com $\\log(peso)$ e $\\log(1+cigarro)$; ",
      "e um modelo log ampliado com controles para reduzir viés de variável omitida observável."
    ),
    "",
    "\\section{Resultados}",
    "\\inputtable{regressoes_principais.tex}",
    paste0(
      "No modelo em nível, uma hora adicional de TV está associada a ",
      fmt_num(m1_tv$estimate, 0), " g no peso (", p_inline(m1_tv$p), "); um cigarro/dia adicional a ",
      fmt_num(m1_cig$estimate, 0), " g (", p_inline(m1_cig$p), ", ", m1_cig_sig, "); e um copo semanal de refrigerante a ",
      fmt_num(m1_ref$estimate, 0), " g (", p_inline(m1_ref$p), "). O R$^2$ é baixo (",
      fmt_num(g1$r2, 3), "). ",
      "Com controles (Modelo 3), TV implica cerca de ", fmt_num(100 * (exp(m3_tv$estimate) - 1), 2), "\\% no peso por hora (", p_inline(m3_tv$p),
      "), $\\log(1+cigarro)$ em ", fmt_num(m3_cig$estimate, 4), " (", p_inline(m3_cig$p),
      ") e refrigerante em ", fmt_num(100 * (exp(m3_ref$estimate) - 1), 3), "\\% por copo/semana (", p_inline(m3_ref$p),
      "). O R$^2$ ajustado sobe para ", fmt_num(g3$adj, 3), "."
    ),
    "",
    "\\section{Diagnóstico e Conclusão}",
    paste0(
      "O teste de White rejeita a hipótese nula de homocedasticidade (menor ", p_inline(white_min),
      "). Por isso, a inferência utiliza erros-padrão robustos HC1. O VIF máximo no modelo ampliado é ",
      fmt_num(max_vif_m3, 2), ", sem evidência de multicolinearidade severa. ",
      "Jarque--Bera rejeita normalidade dos resíduos (menor ", p_inline(normality_min), "), esperado para $N$ elevado."
    ),
    paste0(
      "\\textbf{Conclusão:} A evidência é compatível com associações condicionais pequenas entre os hábitos e o peso. ",
      "A ausência de controles para dieta, atividade física e renda impede uma leitura causal, limitando a interpretação às correlações parciais estimadas por MQO."
    ),
    "\\end{document}"
  )

  writeLines(report, file.path(out_dir, "relatorio.tex"), useBytes = TRUE)
  writeLines(report, file.path(out_dir, "relatorio_final.tex"), useBytes = TRUE)

  # Apêndice mantido limpo com o layout padrão do R
  appendix <- c(
    "\\documentclass[10pt,a4paper]{article}",
    "\\usepackage[utf8]{inputenc}",
    "\\usepackage[T1]{fontenc}",
    "\\usepackage[brazil]{babel}",
    "\\usepackage{geometry,booktabs,graphicx,caption,float,longtable,xcolor}",
    "\\geometry{margin=1.7cm}",
    "\\setlength{\\parindent}{0pt}",
    "\\setlength{\\parskip}{4pt}",
    "\\newcommand{\\inputtable}[1]{\\IfFileExists{output/tables/#1}{\\input{output/tables/#1}}{\\input{../output/tables/#1}}}",
    "\\begin{document}",
    "\\begin{center}\\textbf{Apêndice: saídas do R usadas no relatório}\\end{center}",
    "\\inputtable{variaveis_usadas.tex}",
    "\\inputtable{auditoria_limpeza.tex}",
    "\\inputtable{descritivas_status_fumante.tex}",
    "\\inputtable{regressoes_completas_robustas.tex}",
    "\\inputtable{heterocedasticidade.tex}",
    "\\inputtable{vif.tex}",
    "\\inputtable{influencia_cook.tex}",
    "\\inputtable{normalidade.tex}",
    "\\end{document}"
  )

  writeLines(appendix, file.path(out_dir, "apendice.tex"), useBytes = TRUE)
  writeLines(appendix, file.path(out_dir, "apendice_outputs_R.tex"), useBytes = TRUE)
}

compile_latex_documents <- function(out_dir = "latex") {
  pdflatex <- Sys.which("pdflatex")
  if (!nzchar(pdflatex)) {
    message("pdflatex não encontrado no PATH; arquivos .tex gerados, PDFs não compilados.")
    return(invisible(FALSE))
  }

  docs <- c("relatorio_final.tex", "apendice_outputs_R.tex")
  for (doc in docs) {
    for (i in 1:2) {
      result <- system2(
        pdflatex,
        args = c(
          "-interaction=nonstopmode",
          "-halt-on-error",
          "-output-directory", out_dir,
          file.path(out_dir, doc)
        ),
        stdout = TRUE,
        stderr = TRUE
      )
      status <- attr(result, "status")
      if (!is.null(status) && status != 0) {
        writeLines(result)
        stop("Falha ao compilar ", doc, call. = FALSE)
      }
    }
  }

  invisible(TRUE)
}
