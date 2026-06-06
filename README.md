# Trabalho de Econometria 1 - PNS 2013

Projeto R reproduzivel para avaliar a associacao entre maus habitos e peso dos individuos na PNS 2013.

## Como rodar

No R ou RStudio, a partir da raiz do projeto:

```r
source("main.R")
```

O script cria uma biblioteca local em `R_libs/`, instala pacotes faltantes, le `Dados pns 2013.dta` com `haven::read_dta()`, limpa a base, estima os modelos, executa diagnosticos e gera tabelas/LaTeX.

## Saidas geradas

- `output/tables/`: tabelas em LaTeX.
- `output/models/`: objetos `.rds` e coeficientes robustos.
- `output/diagnostics/`: `names()`, `str()`, `glimpse()`, testes, VIF, Cook's distance e graficos.
- `latex/relatorio.tex`: corpo principal do trabalho.
- `latex/apendice.tex`: apendice com as saidas usadas.

Para compilar manualmente, rode o LaTeX a partir da raiz do projeto, por exemplo:

```bash
pdflatex -interaction=nonstopmode -output-directory=latex latex/relatorio.tex
pdflatex -interaction=nonstopmode -output-directory=latex latex/apendice.tex
```

## Variaveis centrais

- Peso: `w00103`, peso final em kg, convertido para `peso_gramas`.
- TV: `p045`, faixas de horas convertidas para pontos medios.
- Fumante/cigarro: `p050` e `p05402`; nao fumantes recebem `cigarro = 0`.
- Refrigerante: `p020 * p022`, interpretado como copos por semana.
- Controles disponiveis no recorte: idade, sexo, altura, cor/raca, alfabetizacao, estado civil, regiao e tamanho do domicilio.

O arquivo `.dta` recebido tem 18 colunas; variaveis como renda, escolaridade detalhada, atividade fisica, alcool e estado de saude aparecem no guia, mas nao estao nesse recorte da base.
