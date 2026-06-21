ensure_project_dirs <- function(paths) {
  dirs <- c("R", paths$tables, paths$diagnostics, paths$models, paths$latex)
  invisible(lapply(dirs, dir.create, recursive = TRUE, showWarnings = FALSE))
}


import_pns <- function(path, diagnostics_dir = file.path("output", "diagnostics")) {
  if (!file.exists(path)) {
    stop(
      "Arquivo de dados não encontrado: ", path,
      ". Coloque 'Dados pns 2013.dta' na raiz do projeto e rode source('main.R').",
      call. = FALSE
    )
  }

  dados <- haven::read_dta(path)
  names(dados) <- tolower(names(dados))

  dir.create(diagnostics_dir, recursive = TRUE, showWarnings = FALSE)
  writeLines(capture.output(names(dados)), file.path(diagnostics_dir, "01_names.txt"))
  writeLines(capture.output(str(dados)), file.path(diagnostics_dir, "02_str.txt"))
  writeLines(
    capture.output(dplyr::glimpse(dados)),
    file.path(diagnostics_dir, "03_glimpse.txt")
  )

  dados
}


inspect_pns_metadata <- function(dados, diagnostics_dir = file.path("output", "diagnostics")) {
  candidate_codes <- c(
    "w00103", "w00203", "p045", "p050", "p05402", "p020", "p022",
    "c008", "c006", "c009", "c011", "d001", "v0001", "v0022",
    "vdd004", "e01602", "p034", "p035", "p027", "p028", "n001"
  )

  labels <- vapply(
    candidate_codes,
    function(x) {
      if (x %in% names(dados)) {
        label <- attr(dados[[x]], "label")
        if (is.null(label)) "" else as.character(label)
      } else {
        NA_character_
      }
    },
    character(1)
  )

  metadata <- data.frame(
    codigo = candidate_codes,
    presente = candidate_codes %in% names(dados),
    label = labels,
    stringsAsFactors = FALSE,
    row.names = NULL
  )

  dir.create(diagnostics_dir, recursive = TRUE, showWarnings = FALSE)
  readr::write_csv(metadata, file.path(diagnostics_dir, "variaveis_candidatas.csv"))
  metadata
}


as_num <- function(x) {
  as.numeric(haven::zap_labels(x))
}


valid_between <- function(x, lower, upper) {
  x <- as_num(x)
  dplyr::if_else(!is.na(x) & x >= lower & x <= upper, x, NA_real_)
}


valid_integer_set <- function(x, values) {
  x <- as_num(x)
  dplyr::if_else(!is.na(x) & x %in% values, x, NA_real_)
}


recode_tv_hours <- function(x) {
  x <- valid_integer_set(x, 1:8)

  dplyr::case_when(
    x == 8 ~ 0,
    x == 1 ~ 0.5,
    x == 2 ~ 1.5,
    x == 3 ~ 2.5,
    x == 4 ~ 3.5,
    x == 5 ~ 4.5,
    x == 6 ~ 5.5,
    x == 7 ~ 6.5,
    TRUE ~ NA_real_
  )
}


uf_to_region <- function(uf) {
  uf <- as_num(uf)

  dplyr::case_when(
    uf %in% c(11, 12, 13, 14, 15, 16, 17) ~ "Norte",
    uf %in% c(21, 22, 23, 24, 25, 26, 27, 28, 29) ~ "Nordeste",
    uf %in% c(31, 32, 33, 35) ~ "Sudeste",
    uf %in% c(41, 42, 43) ~ "Sul",
    uf %in% c(50, 51, 52, 53) ~ "Centro-Oeste",
    TRUE ~ NA_character_
  )
}


clean_pns <- function(dados) {
  # Todas estas variáveis são efetivamente necessárias para a amostra comum
  # usada nos três modelos, inclusive o modelo ampliado.
  required <- c(
    "w00103", "w00203",
    "p045", "p050", "p05402", "p020", "p022",
    "c008", "c006", "c009", "c011", "d001", "v0001", "v0022"
  )

  missing_required <- setdiff(required, names(dados))

  if (length(missing_required) > 0) {
    stop(
      "Variáveis obrigatórias ausentes na base: ",
      paste(missing_required, collapse = ", "),
      ". Os três modelos foram definidos para usar uma amostra comum de casos completos.",
      call. = FALSE
    )
  }

  has_refrigerante <- TRUE

  base <- dplyr::tibble(
    row_id = seq_len(nrow(dados)),

    uf = valid_integer_set(
      dados$v0001,
      c(11:17, 21:29, 31:33, 35, 41:43, 50:53)
    ),

    regiao = factor(
      uf_to_region(uf),
      levels = c("Norte", "Nordeste", "Sudeste", "Sul", "Centro-Oeste")
    ),

    sexo = factor(
      dplyr::case_when(
        as_num(dados$c006) == 1 ~ "Homem",
        as_num(dados$c006) == 2 ~ "Mulher",
        TRUE ~ NA_character_
      ),
      levels = c("Homem", "Mulher")
    ),

    idade = valid_between(dados$c008, 18, 109),

    cor_raca = factor(
      dplyr::case_when(
        as_num(dados$c009) == 1 ~ "Branca",
        as_num(dados$c009) == 2 ~ "Preta",
        as_num(dados$c009) == 3 ~ "Amarela",
        as_num(dados$c009) == 4 ~ "Parda",
        as_num(dados$c009) == 5 ~ "Indígena",
        TRUE ~ NA_character_
      ),
      levels = c("Parda", "Branca", "Preta", "Amarela", "Indígena")
    ),

    estado_civil = factor(
      dplyr::case_when(
        as_num(dados$c011) == 1 ~ "Casado",
        as_num(dados$c011) == 2 ~ "Separado",
        as_num(dados$c011) == 3 ~ "Divorciado",
        as_num(dados$c011) == 4 ~ "Viúvo",
        as_num(dados$c011) == 5 ~ "Solteiro",
        TRUE ~ NA_character_
      ),
      levels = c("Solteiro", "Casado", "Separado", "Divorciado", "Viúvo")
    ),

    alfabetizado = factor(
      dplyr::case_when(
        as_num(dados$d001) == 1 ~ "Sim",
        as_num(dados$d001) == 2 ~ "Não",
        TRUE ~ NA_character_
      ),
      levels = c("Sim", "Não")
    ),

    tamanho_dom = valid_between(dados$v0022, 1, 30),

    peso_kg = valid_between(dados$w00103, 30, 200),
    peso_gramas = peso_kg * 1000,
    altura_cm = valid_between(dados$w00203, 120, 210),

    TV = recode_tv_hours(dados$p045),
    tv_codigo = valid_integer_set(dados$p045, 1:8),

    status_codigo = valid_integer_set(dados$p050, 1:3),

    status_fumante = factor(
      dplyr::case_when(
        status_codigo == 1 ~ "Fumante diário",
        status_codigo == 2 ~ "Fumante ocasional",
        status_codigo == 3 ~ "Não fumante",
        TRUE ~ NA_character_
      ),
      levels = c("Fumante diário", "Fumante ocasional", "Não fumante")
    ),

    cigarro_reportado = valid_between(dados$p05402, 0, 100),

    cigarro = dplyr::case_when(
      status_codigo == 3 ~ 0,
      status_codigo %in% c(1, 2) & !is.na(cigarro_reportado) ~ cigarro_reportado,
      TRUE ~ NA_real_
    ),

    refrigerante_dias = valid_integer_set(dados$p020, 0:7),

    refrigerante_copos_dia = dplyr::case_when(
      refrigerante_dias == 0 ~ 0,
      refrigerante_dias > 0 & as_num(dados$p022) %in% 1:3 ~ as_num(dados$p022),
      TRUE ~ NA_real_
    ),

    refrigerante = refrigerante_dias * refrigerante_copos_dia,

    log_peso = log(peso_gramas),
    log_cigarro = log1p(cigarro)
  )

  audit <- dplyr::tibble(
    etapa = "Base original",
    n_antes = nrow(base),
    removidas = 0L,
    n_depois = nrow(base),
    observacao = "Microdados recebidos no arquivo .dta"
  )

  current <- base

  add_step <- function(condition, etapa, observacao) {
    before <- nrow(current)
    current <<- dplyr::filter(current, {{ condition }})
    after <- nrow(current)

    audit <<- dplyr::bind_rows(
      audit,
      dplyr::tibble(
        etapa = etapa,
        n_antes = before,
        removidas = before - after,
        n_depois = after,
        observacao = observacao
      )
    )
  }

  add_step(
    !is.na(peso_gramas),
    "Peso válido",
    "w00103 entre 30 e 200 kg; convertido para gramas"
  )

  add_step(
    !is.na(TV),
    "TV válida",
    "p045 em 1--8; faixas convertidas em horas aproximadas"
  )

  add_step(
    !is.na(status_fumante),
    "Status de fumante válido",
    "p050 em 1--3"
  )

  add_step(
    !is.na(cigarro),
    "Cigarro válido",
    "não fumantes recebem 0; fumantes precisam de p05402 válido"
  )

  add_step(
    !is.na(refrigerante),
    "Refrigerante válido",
    "p020 e p022 combinados em copos por semana; p020=0 recebe 0"
  )

  # Base contendo as variáveis centrais do estudo, antes da exigência dos controles.
  core_data <- current

  add_step(
    !is.na(idade),
    "Idade adulta válida",
    "c008 entre 18 e 109 anos"
  )

  add_step(
    !is.na(altura_cm),
    "Altura válida",
    "w00203 entre 120 e 210 cm"
  )

  add_step(
    !is.na(sexo),
    "Sexo válido",
    "c006 em 1--2"
  )

  add_step(
    !is.na(cor_raca),
    "Cor/raça válida",
    "c009 em 1--5; código ignorado removido"
  )

  add_step(
    !is.na(estado_civil),
    "Estado civil válido",
    "c011 em 1--5"
  )

  add_step(
    !is.na(alfabetizado),
    "Alfabetização válida",
    "d001 em 1--2"
  )

  add_step(
    !is.na(regiao) & !is.na(tamanho_dom),
    "Região e domicílio válidos",
    "UF convertida em região; total de moradores entre 1 e 30"
  )

  if (nrow(current) == 0) {
    stop(
      "A limpeza eliminou todas as observações. Verifique os códigos e intervalos usados.",
      call. = FALSE
    )
  }

  final_data <- current |>
    dplyr::mutate(
      idade_c = idade - mean(idade, na.rm = TRUE),
      idade_c2 = idade_c^2
    )

  code_groups <- list(
    c("w00103"),
    c("p045"),
    c("p05402"),
    c("p050"),
    c("p020", "p022"),
    c("w00203"),
    c("c008"),
    c("c006"),
    c("c009"),
    c("c011"),
    c("d001"),
    c("v0001"),
    c("v0022"),
    c("vdd004"),
    c("e01602"),
    c("p034", "p035"),
    c("p027", "p028"),
    c("n001")
  )

  used_in_models <- c(rep(TRUE, 13), rep(FALSE, 5))

  present_all <- vapply(
    code_groups,
    function(codes) all(codes %in% names(dados)),
    logical(1)
  )

  present_any <- vapply(
    code_groups,
    function(codes) any(codes %in% names(dados)),
    logical(1)
  )

  availability_status <- dplyr::case_when(
    used_in_models & present_all ~ "Disponível e usada",
    used_in_models & !present_all ~ "Obrigatória, mas ausente",
    !used_in_models & present_all ~ "Disponível, não usada",
    !used_in_models & present_any ~ "Disponível parcialmente, não usada",
    TRUE ~ "Não disponível no .dta recebido"
  )

  variable_availability <- dplyr::tibble(
    item = c(
      "Peso medido", "TV", "Cigarros por dia", "Status de fumante",
      "Refrigerante", "Altura", "Idade", "Sexo", "Cor/raça",
      "Estado civil", "Alfabetização", "Região", "Tamanho do domicílio",
      "Escolaridade detalhada", "Renda", "Atividade física", "Álcool",
      "Estado de saúde"
    ),

    codigo_usado = vapply(
      code_groups,
      function(codes) paste(codes, collapse = "+"),
      character(1)
    ),

    status = availability_status,

    tratamento = c(
      "kg válidos em 30--200; peso_gramas=w00103*1000; log_peso=log(peso_gramas)",
      "faixas recodificadas em horas: 0, 0,5, 1,5, ..., 6,5",
      "p05402 válido para fumantes; não fumantes recebem zero",
      "1 diário, 2 ocasional, 3 não fumante",
      "p020 dias/semana * p022 copos/dia; categoria 3 tratada no limite inferior",
      "cm válidos em 120--210",
      "adultos 18--109",
      "fator Homem/Mulher",
      "fator; código ignorado removido",
      "fator com cinco categorias",
      "proxy educacional binária: sabe ler/escrever",
      "UF agregada em cinco regiões",
      "controle para composição domiciliar",
      "não utilizada no modelo atual",
      "não utilizada no modelo atual",
      "não utilizada no modelo atual",
      "não utilizada no modelo atual",
      "não utilizada no modelo atual"
    )
  )

  list(
    data = final_data,
    core_data = core_data,
    audit = audit,
    variable_availability = variable_availability,
    has_refrigerante = has_refrigerante
  )
}
