# =====================================================================
# FUNÇÕES AUXILIARES DE FORMATAÇÃO
# =====================================================================
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
  if (length(x) != 1L || is.na(x) || !is.finite(x)) {
    return("")
  }

  p <- fmt_p(x)
  p_math <- gsub(",", "{,}", p, fixed = TRUE)

  if (grepl("^<", p)) {
    paste0("$p", p_math, "$")
  } else {
    paste0("$p=", p_math, "$")
  }
}

coef_lookup <- function(modelos, model_index, term) {
  if (
    length(model_index) != 1L ||
    is.na(model_index) ||
    model_index < 1L ||
    model_index > length(modelos$models)
  ) {
    stop("Índice de modelo inválido: ", model_index, call. = FALSE)
  }

  model_name <- names(modelos$models)[model_index]

  row <- modelos$robust_tidy |>
    dplyr::filter(modelo == model_name, termo == term)

  if (nrow(row) != 1L) {
    stop(
      "Coeficiente não encontrado de forma única.\n",
      "Modelo procurado: ", model_name, "\n",
      "Termo procurado: ", term, "\n",
      "Número de correspondências: ", nrow(row), "\n\n",
      "Modelos disponíveis:\n",
      paste(unique(modelos$robust_tidy$modelo), collapse = "\n"), "\n\n",
      "Termos disponíveis:\n",
      paste(unique(modelos$robust_tidy$termo), collapse = "\n"),
      call. = FALSE
    )
  }

  list(
    estimate = row$estimativa[[1]],
    p = row$p_valor[[1]]
  )
}

model_glance <- function(model) {
  s <- summary(model)
  list(r2 = s$r.squared, adj = s$adj.r.squared, n = stats::nobs(model))
}


all_reject_at <- function(p_values, alpha = 0.05) {
  valid <- p_values[is.finite(p_values)]
  length(valid) > 0L && all(valid < alpha)
}


max_valid_p <- function(p_values) {
  valid <- p_values[is.finite(p_values)]
  if (length(valid) == 0L) NA_real_ else max(valid)
}


significance_text <- function(p_value) {
  if (is.na(p_value) || !is.finite(p_value)) {
    "sem p-valor disponível"
  } else if (p_value < 0.001) {
    "estatisticamente significante a 0,1\\%"
  } else if (p_value < 0.01) {
    "estatisticamente significante a 1\\%"
  } else if (p_value < 0.05) {
    "estatisticamente significante a 5\\%"
  } else if (p_value < 0.10) {
    "marginalmente significante a 10\\%"
  } else {
    "não significante a 10\\%"
  }
}

# =====================================================================
# GERAÇÃO DE TABELAS (KABLE E modelosUMMARY)
# =====================================================================
write_kable_latex <- function(df, path, caption = NULL, label = NULL, digits = 3) {
  table_tex <- knitr::kable(
    df,
    format = "latex",
    booktabs = TRUE,
    caption = caption,
    label = label,
    digits = digits,
    linesep = "", 
    escape = TRUE
  )
  table_tex <- kableExtra::kable_styling(
    table_tex,
    latex_options = c("hold_position", "scale_down"),
    font_size = 9
  )
  writeLines(table_tex, path, useBytes = TRUE)
  path
}

write_all_tables <- function(cleaned, metadata, descriptives, modelos, diagnostics, out_dir = file.path("output", "tables")) {
  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
  unlink(file.path(out_dir, "normalidade.tex"), force = TRUE)
  
  old_options <- options(
    modelsummary_format_numeric_latex = "plain",
    modelsummary_factory_latex = "kableExtra"
  )
  on.exit(options(old_options), add = TRUE)
  
  # Hack para forçar o padrão da tabela exata do usuário
  format_regression_tex <- function(path, is_main = TRUE) {
    if (!file.exists(path)) return()
    lines <- readLines(path, encoding = "UTF-8")
    
    # 1. Decimais perfeitos (converte pontos para vírgulas apenas em números)
    lines <- gsub("([0-9])\\.([0-9])", "\\1,\\2", lines)
    
    # 2. Permite ao LaTeX posicionar a tabela sem deixar grandes espaços vazios.
    # A expressão também substitui argumentos anteriores, como [H], evitando
    # que um segundo argumento seja impresso literalmente no PDF.
    lines <- gsub(
      "\\\\begin\\{table\\}(\\[[^]]*\\])?",
      "\\\\begin{table}[!htbp]",
      lines,
      perl = TRUE
    )
    idx_cap <- grep("\\\\caption\\{", lines)
    if (length(idx_cap) > 0) {
      # CORREÇÃO: Usar apenas \\label e \\small (gera \label e \small no LaTeX)
      lines[idx_cap] <- paste0(lines[idx_cap], "\n\\label{tab:regressoes}\n\\small")
    }
    
    # 3. Transforma tabular em tabularx para não vazar a página
    lines <- gsub("\\\\begin\\{tabular\\}.*?\\{[^\\}]+\\}", "\\\\begin{tabularx}{\\\\textwidth}{>{\\\\raggedright\\\\arraybackslash}Xccc}", lines)
    lines <- gsub("\\\\end\\{tabular\\}", "\\\\end{tabularx}", lines)
    
    # 4. Preenche células vazias com -- (lookahead captura lacunas exatas)
    lines <- gsub("(&\\s*)(?=&)", "\\1 -- ", lines, perl = TRUE)
    lines <- gsub("(&\\s*)(?=\\\\\\\\)", "\\1 -- ", lines, perl = TRUE)
    
    if (is_main) {
      # 5. Cabeçalho duplo
      header_idx <- grep(
        "Modelo 1 & Modelo 2 & Modelo 3",
        lines,
        fixed = TRUE
      )

      if (length(header_idx) == 1L) {
        lines[header_idx] <- paste0(
          " & \\textbf{Modelo 1} & \\textbf{Modelo 2} & ",
          "\\textbf{Modelo 3} \\\\"
        )

        lines <- append(
          lines,
          paste0(
            " & Peso em nível & \\ensuremath{\\log(\\mathrm{peso})} & ",
            "\\ensuremath{\\log(\\mathrm{peso})} com controles \\\\"
          ),
          after = header_idx
        )
      }

      # 5.1. Move "Controles demográficos" para antes da linha de
      # separação das estatísticas de ajuste.
      ctrl_idx <- grep("Controles demogr", lines)
      obs_idx <- grep("^Observa", lines)

      if (length(ctrl_idx) == 1L && length(obs_idx) == 1L) {
        ctrl_line <- lines[ctrl_idx]
        lines <- lines[-ctrl_idx]

        obs_idx <- grep("^Observa", lines)
        midrules <- grep("\\\\midrule", lines)
        candidates <- midrules[midrules < obs_idx]

        if (length(candidates) > 0L) {
          mid_before_obs <- max(candidates)
          lines <- append(
            lines,
            ctrl_line,
            after = mid_before_obs - 1L
          )
        } else {
          warning(
            "Não foi encontrada uma \\\\midrule antes de Observações; ",
            "a linha de controles não foi reposicionada."
          )
        }
      }

      # 6. Remove as notas automáticas e injeta a nota customizada
      # fora do tabularx.
      idx_bottom <- grep("\\\\bottomrule", lines)
      idx_endtab <- grep("\\\\end\\{tabularx\\}", lines)

      if (
        length(idx_bottom) > 0L &&
        length(idx_endtab) > 0L &&
        idx_endtab[1] > idx_bottom[1]
      ) {
        if (idx_endtab[1] - idx_bottom[1] > 1L) {
          lines <- lines[
            -((idx_bottom[1] + 1L):(idx_endtab[1] - 1L))
          ]
        }
      }

      nota_str <- paste0(
        "\\nota{\\textit{Notas:} erros-padrão robustos à ",
        "heterocedasticidade, calculados com matriz HCCM do tipo HC1, ",
        "entre parênteses. + $p<0{,}10$, * $p<0{,}05$, ",
        "** $p<0{,}01$ e *** $p<0{,}001$. O Modelo 3 inclui idade, ",
        "idade ao quadrado, altura, sexo, cor/raça, alfabetização, ",
        "estado civil, região e tamanho do domicílio. Todas as ",
        "especificações usam a mesma amostra de casos completos.}"
      )

      # Insere a nota como nova linha após o tabularx. O uso de append()
      # evita que gsub interprete as barras invertidas do comando LaTeX.
      endtab_idx <- grep("\\\\end\\{tabularx\\}", lines)
      if (length(endtab_idx) == 1L) {
        lines <- append(lines, nota_str, after = endtab_idx)
      } else {
        warning("Não foi possível inserir a nota da tabela principal.")
      }
    } else {
      # Ajusta notas da tabela secundária
      lines <- gsub("\\\\multicolumn\\{([0-9]+)\\}\\{[lc]\\}", "\\\\multicolumn{\\1}{>{\\\\raggedright\\\\arraybackslash}p{\\\\textwidth}}", lines)
    }
    
    writeLines(lines, path, useBytes = TRUE)
  }
  
  # 1. Tabela Descritiva
  desc_table <- descriptives$desc |>
    dplyr::mutate(
      media = fmt_num(media, 2),
      desvio_padrao = fmt_num(desvio_padrao, 2),
      minimo = fmt_num(minimo, 2),
      maximo = fmt_num(maximo, 2),
      n = format(n, big.mark = ".", decimal.mark = ",")
    ) |>
    dplyr::rename(
      `Status de fumante` = status_fumante, Variável = variavel,
      Média = media, `Desvio-padrão` = desvio_padrao, Mínimo = minimo, Máximo = maximo, N = n
    )
  
  desc_path <- file.path(out_dir, "descritivas_status_fumante.tex")
  write_kable_latex(desc_table, desc_path, caption = "Estatísticas descritivas por status de fumante", label = "descritivas", digits = 2)
  
  # 2. Tabelas de Auditoria e Variáveis
  audit_table <- cleaned$audit |>
    dplyr::mutate(
      n_antes = format(n_antes, big.mark = ".", decimal.mark = ","),
      removidas = format(removidas, big.mark = ".", decimal.mark = ","),
      n_depois = format(n_depois, big.mark = ".", decimal.mark = ",")
    ) |>
    dplyr::rename(Etapa = etapa, `N antes` = n_antes, Removidas = removidas, `N depois` = n_depois, Observacao = observacao)
  
  audit_path <- file.path(out_dir, "auditoria_limpeza.tex")
  write_kable_latex(audit_table, audit_path, caption = "Auditoria da limpeza da base", label = "limpeza", digits = 0)
  
  var_table <- cleaned$variable_availability |>
    dplyr::rename(Item = item, Codigo = codigo_usado, Status = status, Tratamento = tratamento)
  
  var_path <- file.path(out_dir, "variaveis_usadas.tex")
  write_kable_latex(var_table, var_path, caption = "Variaveis procuradas, disponibilidade e tratamento", label = "variaveis", digits = 2)
  
  # 3. Tabelas de Regressão
  mod_list <- list(
    "Modelo 1" = modelos$models[[1]],
    "Modelo 2" = modelos$models[[2]],
    "Modelo 3" = modelos$models[[3]]
  )
  
  coef_map <- c(
    "TV" = "TV (horas/dia)",
    "cigarro" = "Cigarros/dia",
    "log_cigarro" = "\\ensuremath{\\log(1+\\mathrm{cigarros/dia})}",
    "refrigerante" = "Refrigerante (copos/semana)"
  )
  
  # Formatação nativa para colocar o separador de milhar direto no modelosummary
  gof_map <- list(
    list("raw" = "nobs", "clean" = "Observações", "fmt" = function(x) format(as.numeric(x), big.mark = ".", decimal.mark = ",")),
    list("raw" = "adj.r.squared", "clean" = "R\\textsuperscript{2} ajustado", "fmt" = function(x) fmt_num(as.numeric(x), 3))
  )
  
  ctrl_row <- data.frame(
    term = "Controles demográficos",
    m1 = "Não", m2 = "Não", m3 = "Sim",
    check.names = FALSE
  )
  names(ctrl_row) <- c("term", names(mod_list))
  attr(ctrl_row, "position") <- 9 
  
  
  main_reg_path <- file.path(out_dir, "regressoes_principais.tex")
  modelsummary::modelsummary(
    mod_list,
    vcov = modelos$robust_vcov,
    coef_map = coef_map,
    gof_map = gof_map,
    add_rows = ctrl_row,
    stars = TRUE,
    align = "lccc",
    statistic = "({std.error})",
    escape = FALSE,
    output = main_reg_path,
    title = "Regressões MQO com matriz HCCM/HC1"
  )
  format_regression_tex(main_reg_path, is_main = TRUE)
  
  full_reg_path <- file.path(out_dir, "regressoes_completas_robustas.tex")
  modelsummary::modelsummary(
    mod_list,
    vcov = modelos$robust_vcov,
    stars = TRUE,
    align = "lccc",
    statistic = "({std.error})",
    fmt = 4,
    # A tabela completa contém nomes como idade_c e altura_cm.
    # escape = TRUE protege os underscores para o LaTeX.
    escape = TRUE,
    output = full_reg_path,
    title = "Saída completa das regressões com matriz HCCM/HC1",
    notes = "Erros-padrão robustos à heterocedasticidade, calculados com matriz HCCM/HC1, entre parênteses."
  )
  format_regression_tex(full_reg_path, is_main = FALSE)
  
  # 4. Tabelas de Diagnóstico
  hetero <- diagnostics$white |>
    dplyr::mutate(
      decisao_5 = dplyr::if_else(p_valor < 0.05, "Rejeita homoced.", "Não rejeita"),
      estatistica = fmt_num(estatistica, 3), p_valor = fmt_p(p_valor)
    ) |>
    dplyr::rename(Modelo = modelo, Teste = teste, Estatística = estatistica, GL = gl, `p-valor` = p_valor, `Decisão 5%` = decisao_5)
  
  hetero_path <- file.path(out_dir, "heterocedasticidade.tex")
  write_kable_latex(hetero, hetero_path, caption = "Teste de White simplificado para heterocedasticidade", label = "hetero", digits = 3)
  
  vif_table <- diagnostics$vif |>
    dplyr::mutate(vif = fmt_num(vif, 2)) |>
    dplyr::rename(Modelo = modelo, Termo = termo, VIF = vif)
  
  vif_path <- file.path(out_dir, "vif.tex")
  write_kable_latex(vif_table, vif_path, caption = "VIF por coluna da matriz de desenho", label = "vif", digits = 2)
  
  influence_table <- diagnostics$influence |>
    dplyr::mutate(
      limite_4_n = fmt_num(limite_4_n, 6), max_cook = fmt_num(max_cook, 4), p99_cook = fmt_num(p99_cook, 4),
      n_acima_4_n = format(n_acima_4_n, big.mark = ".", decimal.mark = ","), n = format(n, big.mark = ".", decimal.mark = ",")
    ) |>
    dplyr::rename(Modelo = modelo, N = n, `Limite 4/N` = limite_4_n, `Cook máx.` = max_cook, `Cook p99` = p99_cook, `N acima 4/N` = n_acima_4_n)
  
  influence_path <- file.path(out_dir, "influencia_cook.tex")
  write_kable_latex(influence_table, influence_path, caption = "Resumo de influência por distância de Cook", label = "cook", digits = 4)
  
  normality_table <- diagnostics$normality |>
    dplyr::mutate(
      n = format(n, big.mark = ".", decimal.mark = ","),
      assimetria = fmt_num(assimetria, 3), curtose = fmt_num(curtose, 3), jb = fmt_num(jb, 2), p_valor = fmt_p(p_valor)
    ) |>
    dplyr::rename(Modelo = modelo, N = n, Assimetria = assimetria, Curtose = curtose, `Jarque-Bera` = jb, `p-valor` = p_valor)
  
  normality_path <- file.path(out_dir, "normalidade.tex")
  write_kable_latex(normality_table, normality_path, caption = "Diagnóstico secundário de normalidade dos resíduos", label = "normalidade", digits = 3)
  
  list(
    desc = desc_path, audit = audit_path, variables = var_path, reg_main = main_reg_path, 
    reg_full = full_reg_path, hetero = hetero_path, vif = vif_path, influence = influence_path, normality = normality_path
  )
}
# =====================================================================
# GERAÇÃO DO DOCUMENTO LATEX PRINCIPAL
# =====================================================================
write_latex_documents <- function(
  cleaned,
  metadata,
  descriptives,
  modelos,
  diagnostics,
  tables,
  out_dir = "latex"
) {
  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

  # Os argumentos metadata e tables são mantidos para compatibilidade com
  # o fluxo do main.R, embora não sejam usados diretamente nesta função.
  invisible(metadata)
  invisible(tables)

  m1_tv <- coef_lookup(modelos, 1, "TV")
  m1_cig <- coef_lookup(modelos, 1, "cigarro")
  m1_ref <- coef_lookup(modelos, 1, "refrigerante")

  m3_tv <- coef_lookup(modelos, 3, "TV")
  m3_cig <- coef_lookup(modelos, 3, "log_cigarro")
  m3_ref <- coef_lookup(modelos, 3, "refrigerante")

  g1 <- model_glance(modelos$models[[1]])
  g3 <- model_glance(modelos$models[[3]])

  n_original <- cleaned$audit$n_antes[[1]]
  n_final <- nrow(modelos$data)

  bp_p <- diagnostics$bp$p_valor
  white_p <- diagnostics$white$p_valor
  normality_p <- diagnostics$normality$p_valor

  bp_all_reject <- all_reject_at(bp_p, 0.05)
  white_all_reject <- all_reject_at(white_p, 0.05)
  normality_all_reject <- all_reject_at(normality_p, 0.05)

  bp_max <- max_valid_p(bp_p)
  white_max <- max_valid_p(white_p)
  normality_max <- max_valid_p(normality_p)

  n_models <- length(modelos$models)
  bp_rejections <- sum(bp_p < 0.05, na.rm = TRUE)
  white_rejections <- sum(white_p < 0.05, na.rm = TRUE)
  normality_rejections <- sum(normality_p < 0.05, na.rm = TRUE)

  hetero_result <- if (bp_all_reject && white_all_reject) {
    paste0(
      "O teste de Breusch--Pagan e a versão simplificada do teste de White ",
      "rejeitam a hipótese de homocedasticidade em todas as ",
      "especificações. Os maiores p-valores observados são ",
      p_inline(bp_max), " e ", p_inline(white_max),
      ", respectivamente"
    )
  } else {
    paste0(
      "O teste de Breusch--Pagan rejeita homocedasticidade em ",
      bp_rejections, " de ", n_models, " especificações, enquanto ",
      "a versão simplificada do teste de White rejeita em ",
      white_rejections, " de ", n_models, " especificações"
    )
  }

  normality_result <- if (normality_all_reject) {
    paste0(
      "O teste de Jarque--Bera rejeita normalidade dos resíduos em ",
      "todas as especificações; o maior p-valor é ",
      p_inline(normality_max)
    )
  } else {
    paste0(
      "O teste de Jarque--Bera rejeita normalidade dos resíduos em ",
      normality_rejections, " de ", n_models, " especificações"
    )
  }

  hetero_summary <- if (bp_all_reject && white_all_reject) {
    "o teste de Breusch--Pagan e a versão simplificada do teste de White rejeitam homocedasticidade em todas as especificações"
  } else {
    "os diagnósticos de Breusch--Pagan e da versão simplificada do teste de White indicam heterocedasticidade em parte das especificações"
  }

  m1_cig_direction <- if (m1_cig$estimate < 0) {
    "negativo"
  } else if (m1_cig$estimate > 0) {
    "positivo"
  } else {
    "nulo"
  }

  m1_cig_significance <- significance_text(m1_cig$p)

  tv_pct_m3 <- 100 * expm1(m3_tv$estimate)
  ref_pct_m3 <- 100 * expm1(m3_ref$estimate)
  cig_0_1_pct_m3 <- 100 * expm1(m3_cig$estimate * log(2))

  report <- c(
    "\\documentclass[10pt,a4paper]{article}",
    "% -----------------------------------------------------------------------------",
    "% Relatório econométrico profissional - PNS 2013",
    "% Compilação recomendada: pdfLaTeX",
    "% -----------------------------------------------------------------------------",
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
    "    pdfauthor={Roberto Crepaldi Neto, Pedro Henrique Zanetti, Augusto Júlio Camargo},",
    "    pdftitle={Maus hábitos e peso corporal na PNS 2013}",
    "}",
    "",
    "\\setlength{\\parindent}{0pt}",
    "\\setlength{\\parskip}{4pt}",
    "\\setlist[itemize]{leftmargin=*,topsep=2pt,itemsep=1pt}",
    "\\captionsetup{font=small,labelfont=bf,justification=centering}",
    "\\titleformat{\\section}{\\large\\bfseries\\color{SafraBlue}}{}{0pt}{}",
    "\\titleformat{\\subsection}{\\normalsize\\bfseries\\color{DarkGray}}{}{0pt}{}",
    "\\renewcommand{\\arraystretch}{1.12}",
    "",
    "\\newcommand{\\sym}[1]{\\rlap{#1}}",
    "\\newcommand{\\nota}[1]{\\vspace{2pt}\\begin{minipage}{0.96\\textwidth}\\footnotesize #1\\end{minipage}}",
    "\\newcommand{\\inputtable}[1]{\\IfFileExists{output/tables/#1}{\\input{output/tables/#1}}{\\input{../output/tables/#1}}}",
    "",
    "\\begin{document}",
    "",
    "\\begin{center}",
    "    {\\Large\\bfseries\\color{SafraBlue} Maus hábitos e peso corporal na PNS 2013}\\par",
    "    \\vspace{2pt}",
    "    {\\normalsize Uma análise econométrica descritiva de corte transversal}\\par",
    "    \\vspace{6pt}",
    "    {\\small",
    "    Roberto Crepaldi Neto -- 15487099 \\\\",
    "    Pedro Henrique Zanetti -- 15XXXXX \\\\",
    "    Augusto Júlio Camargo -- 15441852",
    "    }\\par",
    "\\end{center}",
    "\\vspace{-2pt}",
    "\\hrule",
    "\\vspace{6pt}",
    "",
    paste0(
      "\\textbf{Resumo.} Este relatório estima a associação entre três hábitos de risco -- ",
      "tempo diário de televisão, tabagismo e consumo semanal de refrigerante -- e o ",
      "peso corporal medido na PNS 2013 \\cite{ibge2015}. A amostra final contém ",
      format(n_final, big.mark = ".", decimal.mark = ","),
      " adultos após filtros de validade. A estratégia empírica usa MQO com matriz ",
      "de covariância robusta à heterocedasticidade HCCM/HC1, pois ",
      hetero_summary,
      ". Os resultados apontam associações estatisticamente significativas, ",
      "mas de magnitude modesta, e não autorizam interpretação causal forte."
    ),
    "",
    "\\textbf{Palavras-chave:} PNS 2013; peso corporal; hábitos de risco; MQO; heterocedasticidade; erros-padrão robustos.",
    "",
    "\\section{Problema empírico e escopo da inferência}",
    "",
    paste0(
      "A pergunta central é se indivíduos com maior exposição a televisão, cigarros ",
      "e refrigerante apresentam peso corporal distinto, condicionando em ",
      "características observáveis disponíveis no recorte da base. A interpretação ",
      "adotada é deliberadamente \\textbf{descritiva}: os coeficientes estimados ",
      "medem correlações parciais, não efeitos causais. Em corte transversal, a ",
      "hipótese de média condicional zero é forte porque hábitos alimentares, ",
      "tabagismo, saúde prévia, renda permanente e preferências individuais podem ",
      "afetar simultaneamente peso e escolhas de consumo."
    ),
    "",
    paste0(
      "Além disso, a PNS é uma pesquisa amostral complexa. Como o arquivo recebido ",
      "não contém pesos amostrais, estratos e unidades primárias de amostragem, os ",
      "resultados abaixo descrevem a amostra limpa usada na estimação, mas não devem ",
      "ser tratados como estimativas populacionais plenamente representativas do Brasil."
    ),
    "",
    "\\section{Dados, tratamento e especificação econométrica}",
    "",
    paste0(
      "A base original possui ",
      format(n_original, big.mark = ".", decimal.mark = ","),
      " registros. Após filtros de consistência, a amostra estimada contém ",
      format(n_final, big.mark = ".", decimal.mark = ","),
      " adultos com peso, altura, idade, sexo, cor/raça, estado civil, ",
      "alfabetização, região, tamanho do domicílio e variáveis de hábitos válidas. ",
      "O peso final medido \\texttt{w00103} foi convertido de quilogramas para ",
      "gramas no modelo em nível; essa mudança altera apenas a escala do coeficiente. ",
      "O tempo de TV foi aproximado pelos pontos médios das categorias de ",
      "\\texttt{p045}; cigarros/dia combina status de fumante e quantidade diária; ",
      "refrigerante foi construído como frequência semanal multiplicada por copos ",
      "por dia. Todas as especificações são estimadas na mesma amostra de casos ",
      "completos, definida pelas variáveis requeridas no modelo ampliado."
    ),
    "",
    "Foram estimadas três especificações:",
    "\\begin{align*}",
    "    peso_i &= \\alpha + \\beta_1 TV_i + \\beta_2 cigarro_i + \\beta_3 refri_i + u_i,\\\\",
    "    \\log(peso_i) &= \\alpha + \\beta_1 TV_i + \\beta_2 \\log(1+cigarro_i) + \\beta_3 refri_i + u_i,\\\\",
    "    \\log(peso_i) &= \\alpha + \\beta_1 TV_i + \\beta_2 \\log(1+cigarro_i) + \\beta_3 refri_i + \\gamma'Z_i + u_i.",
    "\\end{align*}",
    paste0(
      "No terceiro modelo, $Z_i$ inclui idade e idade ao quadrado, altura, sexo, ",
      "cor/raça, alfabetização, estado civil, região e tamanho do domicílio. A ",
      "transformação $\\log(1+cigarro)$ evita a perda dos não fumantes e torna o ",
      "coeficiente uma elasticidade em relação a $1+cigarro$. A especificação segue ",
      "a estrutura usual de regressão múltipla por MQO discutida em ",
      "\\cite{wooldridge2010}."
    ),
    "",
    "\\inputtable{regressoes_principais.tex}",
    "",
    "\\section{Resultados principais}",
    "",
    paste0(
      "No modelo em nível, uma hora adicional de televisão está associada a ",
      fmt_num(m1_tv$estimate, 0),
      " gramas a mais no peso corporal, enquanto um copo semanal adicional de ",
      "refrigerante está associado a ",
      fmt_num(m1_ref$estimate, 0),
      " gramas a mais. O coeficiente de cigarros/dia é ",
      m1_cig_direction,
      " e ",
      m1_cig_significance,
      " (",
      p_inline(m1_cig$p),
      "). Como o $R^2$ ajustado é ",
      fmt_num(g1$adj, 3),
      ", os três hábitos isolados explicam fração muito pequena da heterogeneidade ",
      "observada do peso."
    ),
    "",
    paste0(
      "A especificação logarítmica permite interpretação percentual. No modelo ",
      "ampliado, uma hora adicional de TV está associada a aproximadamente ",
      fmt_num(tv_pct_m3, 2),
      "\\% a mais no peso; um copo semanal adicional de refrigerante está associado a ",
      fmt_num(ref_pct_m3, 2),
      "\\% a mais no peso; e o coeficiente de $\\log(1+cigarro)$ é ",
      fmt_num(m3_cig$estimate, 4),
      ". A comparação entre zero e um cigarro por dia corresponde a uma variação ",
      "percentual exata de aproximadamente ",
      fmt_num(cig_0_1_pct_m3, 2),
      "\\%, mantidas constantes as covariáveis observadas. A inclusão de controles ",
      "eleva o $R^2$ ajustado para ",
      fmt_num(g3$adj, 3),
      ", compatível com a importância de altura, idade e composição individual para ",
      "explicar peso."
    ),
    "",
    "\\section{Diagnósticos, limitações e validade}",
    "",
    paste0(
      hetero_result,
      " \\cite{breuschpagan1979,white1980}. Por isso, a inferência reportada usa ",
      "erros-padrão robustos à heterocedasticidade calculados com matriz HCCM do ",
      "tipo HC1. Essa correção modifica os erros-padrão, as estatísticas de teste e ",
      "os p-valores, mas não altera os coeficientes de MQO. A heterocedasticidade ",
      "não torna o estimador de MQO viesado quando a hipótese de média condicional ",
      "zero é válida; seu principal efeito é invalidar os erros-padrão usuais."
    ),
    "",
    paste0(
      "Quanto à multicolinearidade, a preocupação central é a colinearidade perfeita, ",
      "pois ela impede a estimação por MQO. Correlação entre regressores não viola, ",
      "por si só, as hipóteses do modelo, embora possa aumentar a variância dos ",
      "estimadores. ",
      normality_result,
      " \\cite{jarquebera1987}. Dado o tamanho amostral, esse diagnóstico é ",
      "secundário em relação à robustez da inferência à heterocedasticidade."
    ),
    "",
    paste0(
      "A principal limitação substantiva é a ausência de variáveis centrais: renda, ",
      "escolaridade detalhada, atividade física, consumo total de calorias, álcool, ",
      "doenças prévias e estado de saúde. Essa omissão impede uma leitura causal e ",
      "pode distorcer sinais e magnitudes se tais fatores estiverem correlacionados ",
      "com os hábitos analisados."
    ),
    "",
    "\\section{Conclusão}",
    "",
    paste0(
      "A evidência é compatível com associações condicionais pequenas entre hábitos ",
      "de risco e peso corporal. TV e refrigerante apresentam associação positiva ",
      "nos modelos estimados; tabagismo apresenta associação negativa na especificação ",
      "logarítmica, mas sua interpretação requer cautela por potencial seleção, ",
      "causalidade reversa e confundimento por saúde prévia. O resultado mais ",
      "defensável é descritivo: na amostra limpa da PNS 2013, hábitos selecionados ",
      "estão correlacionados com peso, mas o desenho empírico não identifica efeitos causais."
    ),
    "",
    "\\begin{thebibliography}{9}",
    "\\footnotesize",
    "\\bibitem{breuschpagan1979} BREUSCH, T. S.; PAGAN, A. R. A simple test for heteroscedasticity and random coefficient variation. \\textit{Econometrica}, v. 47, n. 5, p. 1287--1294, 1979.",
    "\\bibitem{ibge2015} IBGE. \\textit{Pesquisa Nacional de Saúde 2013: percepção do estado de saúde, estilos de vida e doenças crônicas}. Rio de Janeiro: IBGE, 2014.",
    "\\bibitem{jarquebera1987} JARQUE, C. M.; BERA, A. K. A test for normality of observations and regression residuals. \\textit{International Statistical Review}, v. 55, n. 2, p. 163--172, 1987.",
    "\\bibitem{white1980} WHITE, H. A heteroskedasticity-consistent covariance matrix estimator and a direct test for heteroskedasticity. \\textit{Econometrica}, v. 48, n. 4, p. 817--838, 1980.",
    "\\bibitem{wooldridge2010} WOOLDRIDGE, J. M. \\textit{Econometric analysis of cross section and panel data}. 2. ed. Cambridge, MA: MIT Press, 2010.",
    "\\end{thebibliography}",
    "",
    "\\end{document}"
  )

  writeLines(
    report,
    file.path(out_dir, "relatorio.tex"),
    useBytes = TRUE
  )
  writeLines(
    report,
    file.path(out_dir, "relatorio_final.tex"),
    useBytes = TRUE
  )

  appendix <- c(
    "\\documentclass[10pt,a4paper]{article}",
    "\\usepackage[utf8]{inputenc}",
    "\\usepackage[T1]{fontenc}",
    "\\usepackage[brazil]{babel}",
    "\\usepackage{geometry,booktabs,graphicx,caption,float,longtable,xcolor,tabularx,array}",
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

  writeLines(
    appendix,
    file.path(out_dir, "apendice.tex"),
    useBytes = TRUE
  )
  writeLines(
    appendix,
    file.path(out_dir, "apendice_outputs_R.tex"),
    useBytes = TRUE
  )
}

# =====================================================================
# COMPILAÇÃO DO PDF
# =====================================================================
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
