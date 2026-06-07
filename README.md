# Trabalho de Econometria 1 - PNS 2013

Projeto R reproduzível para avaliar a associação entre maus hábitos e peso dos indivíduos na PNS 2013.

## Como rodar

No R ou RStudio, a partir da raiz do projeto:

```r
source("main.R")
```

O script cria uma biblioteca local em `R_libs/`, instala pacotes faltantes, lê `Dados pns 2013.dta` com `haven::read_dta()`, limpa a base, estima os modelos, executa diagnósticos, gera tabelas/LaTeX e compila os PDFs quando `pdflatex` está disponível no PATH.

Pacotes usados: `haven`, `dplyr`, `tidyr`, `ggplot2`, `lmtest`, `sandwich`, `broom`, `modelsummary`, `knitr`, `kableExtra`, `readr` e `stringr`.

## Nota Sobre Os Slides

O relatório final foi revisado para aderir aos conceitos dos slides de Econometria 1: interpretação dos coeficientes de MQO múltiplo como efeitos parciais mantidas constantes as demais variáveis, distinção entre significância estatística e relevância econômica, uso de R² e R² ajustado, cautela com variável omitida e interpretação causal, testes de heterocedasticidade e correção da inferência por erros-padrão robustos.

## Saídas Geradas

- `output/tables/`: tabelas em LaTeX.
- `output/models/`: objetos `.rds` compactos e coeficientes robustos.
- `output/diagnostics/`: `names()`, `str()`, `glimpse()`, testes, VIF, Cook's distance e gráficos.
- `latex/relatorio_final.tex` e `latex/relatorio_final.pdf`: corpo principal do trabalho.
- `latex/apendice_outputs_R.tex` e `latex/apendice_outputs_R.pdf`: apêndice com as saídas efetivamente usadas.

Os arquivos `latex/relatorio.tex` e `latex/apendice.tex` também são mantidos como aliases de compatibilidade.

Para compilar manualmente, rode o LaTeX a partir da raiz do projeto, por exemplo:

```bash
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=latex latex/relatorio_final.tex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=latex latex/apendice_outputs_R.tex
```

## Variáveis Centrais

- Peso: `w00103`, peso final em kg, convertido para `peso_gramas`.
- TV: `p045`, faixas de horas convertidas para pontos médios.
- Fumante/cigarro: `p050` e `p05402`; não fumantes recebem `cigarro = 0`.
- Refrigerante: `p020 * p022`, interpretado como copos por semana.
- Controles disponíveis no recorte: idade, sexo, altura, cor/raça, alfabetização, estado civil, região e tamanho do domicílio.

O arquivo `.dta` recebido tem 18 colunas; variáveis como renda, escolaridade detalhada, atividade física, álcool e estado de saúde aparecem no guia, mas não estão nesse recorte da base.
