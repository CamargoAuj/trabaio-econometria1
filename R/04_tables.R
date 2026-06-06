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
  ifelse(grepl("^<", p), paste0("p", p), paste0("p=", p))
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
      Variavel = variavel,
      Media = media,
      `Desvio-padrao` = desvio_padrao,
      Minimo = minimo,
      Maximo = maximo,
      N = n
    )

  desc_path <- file.path(out_dir, "descritivas_status_fumante.tex")
  write_kable_latex(
    desc_table,
    desc_path,
    caption = "Estatisticas descritivas por status de fumante",
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
    title = "Regressoes MQO com erros-padrao robustos HC1",
    notes = c(
      "Erros-padrao robustos HC1 entre parenteses.",
      "O modelo 3 tambem inclui cor/raca, alfabetizacao, estado civil, regiao e tamanho do domicilio."
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
    title = "Saida completa das regressoes usadas no relatorio",
    notes = "Erros-padrao robustos HC1 entre parenteses."
  )

  hetero <- dplyr::bind_rows(diagnostics$bp, diagnostics$white) |>
    dplyr::mutate(
      decisao_5 = dplyr::if_else(p_valor < 0.05, "Rejeita homoced.", "Nao rejeita"),
      estatistica = fmt_num(estatistica, 3),
      p_valor = fmt_p(p_valor)
    ) |>
    dplyr::rename(
      Modelo = modelo,
      Teste = teste,
      Estatistica = estatistica,
      GL = gl,
      `p-valor` = p_valor,
      `Decisao 5%` = decisao_5
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
    caption = "Fatores de inflacao da variancia",
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
      `Cook max.` = max_cook,
      `Cook p99` = p99_cook,
      `N acima 4/N` = n_acima_4_n
    )

  influence_path <- file.path(out_dir, "influencia_cook.tex")
  write_kable_latex(
    influence_table,
    influence_path,
    caption = "Resumo de influencia por distancia de Cook",
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
    caption = "Diagnostico secundario de normalidade dos residuos",
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

  m1_tv <- coef_lookup(models, "Modelo 1: nivel", "TV")
  m1_cig <- coef_lookup(models, "Modelo 1: nivel", "cigarro")
  m2_tv <- coef_lookup(models, "Modelo 2: log", "TV")
  m2_cig <- coef_lookup(models, "Modelo 2: log", "log_cigarro")
  m3_tv <- coef_lookup(models, "Modelo 3: ampliado", "TV")
  m3_cig <- coef_lookup(models, "Modelo 3: ampliado", "log_cigarro")
  m3_ref <- coef_lookup(models, "Modelo 3: ampliado", "refrigerante")

  g1 <- model_glance(models$models[[1]])
  g2 <- model_glance(models$models[[2]])
  g3 <- model_glance(models$models[[3]])

  bp_min <- min(diagnostics$bp$p_valor, na.rm = TRUE)
  white_min <- min(diagnostics$white$p_valor, na.rm = TRUE)
  max_vif_m3 <- diagnostics$vif |>
    dplyr::filter(modelo == "Modelo 3: ampliado") |>
    dplyr::summarise(max_vif = max(vif, na.rm = TRUE)) |>
    dplyr::pull(max_vif)

  report <- c(
    "\\documentclass[10pt,a4paper]{article}",
    "\\usepackage[utf8]{inputenc}",
    "\\usepackage[T1]{fontenc}",
    "\\usepackage[brazil]{babel}",
    "\\usepackage{geometry,booktabs,graphicx,caption,float,xcolor}",
    "\\geometry{margin=1.25cm}",
    "\\setlength{\\parindent}{0pt}",
    "\\setlength{\\parskip}{2pt}",
    "\\captionsetup{font=small,labelfont=bf}",
    "\\newcommand{\\inputtable}[1]{\\IfFileExists{output/tables/#1}{\\input{output/tables/#1}}{\\input{../output/tables/#1}}}",
    "\\begin{document}",
    "\\small",
    "\\begin{center}\\textbf{Maus habitos e peso na PNS 2013}\\end{center}",
    paste0(
      "\\textbf{Objetivo e dados.} O objetivo e verificar se horas de TV, cigarros por dia e consumo de refrigerante se associam ao peso dos individuos na PNS 2013. ",
      "Usei o peso final medido (w00103), convertido em \\textit{peso\\_gramas}; TV (p045) foi recodificada pelo ponto medio das faixas; ",
      "cigarro combina p050 e p05402, com zero para nao fumantes; refrigerante e p020$\\times$p022, em copos por semana. ",
      "A limpeza removeu codigos nao aplicaveis/ignorados e valores fora dos intervalos do dicionario, chegando a ",
      format(nrow(cleaned$data), big.mark = ".", decimal.mark = ","), " observacoes na amostra comum."
    ),
    paste0(
      "\\textbf{Descritivas.} A Tabela \\ref{tab:descritivas} mostra que nao fumantes pesam em media ",
      fmt_num(status_value("Nao fumante", "peso_medio_kg"), 1), " kg, contra ",
      fmt_num(status_value("Fumante diario", "peso_medio_kg"), 1), " kg entre fumantes diarios e ",
      fmt_num(status_value("Fumante ocasional", "peso_medio_kg"), 1), " kg entre ocasionais. ",
      "Fumantes diarios assistem em media ", fmt_num(status_value("Fumante diario", "tv_media"), 2),
      " horas de TV e fumam ", fmt_num(status_value("Fumante diario", "cigarro_medio"), 2),
      " cigarros/dia; nos nao fumantes, a variavel cigarro e mecanicamente zero. ",
      "Essas diferencas brutas misturam habitos, composicao demografica e altura, por isso as regressoes abaixo controlam parcialmente esses fatores."
    ),
    "\\inputtable{descritivas_status_fumante.tex}",
    paste0(
      "\\textbf{Especificacao.} Estimei MQO para: (1) $peso\\_gramas_i=\\beta_0+\\beta_1TV_i+\\beta_2cigarro_i+u_i$; ",
      "(2) $\\log(peso_i)=\\alpha_0+\\alpha_1TV_i+\\alpha_2\\log(cigarro_i+1)+e_i$; ",
      "e (3) o modelo log ampliado com refrigerante, idade centrada, idade centrada ao quadrado, altura, sexo, cor/raca, alfabetizacao, estado civil, regiao e tamanho do domicilio. ",
      "Esses controles reduzem vies por caracteristicas correlacionadas simultaneamente com peso e habitos."
    ),
    "\\inputtable{regressoes_principais.tex}",
    paste0(
      "\\textbf{Resultados.} No modelo em nivel, uma hora adicional de TV esta associada a ",
      fmt_num(m1_tv$estimate, 0), " gramas no peso, mantido cigarro constante (", p_inline(m1_tv$p), "), enquanto um cigarro/dia adicional se associa a ",
      fmt_num(m1_cig$estimate, 0), " gramas (", p_inline(m1_cig$p), "). O ajuste e baixo (R$^2$=",
      fmt_num(g1$r2, 3), "), logo maus habitos isolados explicam pouco da variacao individual do peso. ",
      "No modelo log, TV implica aproximadamente ", fmt_num(100 * m2_tv$estimate, 2),
      "\\% no peso por hora (", p_inline(m2_tv$p), ") e $\\log(cigarro+1)$ tem coeficiente ",
      fmt_num(m2_cig$estimate, 4), " (", p_inline(m2_cig$p), "). ",
      "Com controles, TV passa a ", fmt_num(100 * m3_tv$estimate, 2), "\\% (", p_inline(m3_tv$p),
      "), $\\log(cigarro+1)$ a ", fmt_num(m3_cig$estimate, 4), " (", p_inline(m3_cig$p),
      ") e refrigerante a ", fmt_num(100 * m3_ref$estimate, 3), "\\% por copo/semana (", p_inline(m3_ref$p),
      "). O R$^2$ ajustado sobe de ", fmt_num(g2$adj, 3), " para ", fmt_num(g3$adj, 3),
      ", principalmente pela inclusao de altura e demografia."
    ),
    paste0(
      "\\textbf{Diagnosticos.} Os graficos de residuos versus ajustados e as distancias de Cook foram gerados em \\texttt{output/diagnostics}. ",
      "O maior VIF do modelo ampliado foi ", fmt_num(max_vif_m3, 2), ", sem sinal forte de multicolinearidade severa. ",
      "Breusch--Pagan rejeitou homocedasticidade em pelo menos um modelo (menor ", p_inline(bp_min),
      "; White: menor ", p_inline(white_min), "), por isso a inferencia reportada usa erros-padrao robustos HC1. ",
      "Heterocedasticidade afeta erros-padrao e testes t/F, mas nao torna MQO viesado se houver exogeneidade condicional."
    ),
    "\\textbf{Conclusao.} Os resultados indicam associacoes condicionais pequenas entre maus habitos e peso, nao efeitos causais fortes. O modelo ampliado sugere que parte da correlacao simples era composicional. As principais limitacoes sao o desenho transversal, possiveis variaveis omitidas, aproximacoes em categorias de TV/refrigerante, ausencia de pesos amostrais no recorte recebido e medida de cigarro restrita a cigarros industrializados por dia.",
    "\\end{document}"
  )

  writeLines(report, file.path(out_dir, "relatorio.tex"), useBytes = TRUE)

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
    "\\begin{center}\\textbf{Apendice: saidas do R usadas no relatorio}\\end{center}",
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
}
