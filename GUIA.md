# EAE1221 - Econometria 1

## Regras e diretrizes

O trabalho
- Não é possível ultrapassar duas páginas.
- O arquivo de dados que vocês receberam está em dta (arquivo do Stata que também pode ser lido pelo R)
- Você deve colocar num anexo as saídas do R, comprovando que foram feitas as estimações e testes apresentados no corpo principal (as tais duas páginas).
- NÃO coloque como anexo resultados que você acabou não utilizando.

---

## O Trabalho

Dentre as muitas dificuldades envolvidas nos trabalhos empíricos estão a formulação da questão e a construção do banco de dados. Para facilitar a vida de vocês eu já vou resolver esses dois aspectos.

Objetivo do trabalho

A questão de interesse é verificar se maus hábitos (consumo de refrigerante, horas passadas na frente da televisão e quantidade de cigarros fumada) explicam o peso dos indivíduos. Para tanto vocês terão à disposição a base da Pesquisa Nacional de Saúde (PNS) de 2013, elaborada pelo IBGE.

Todo trabalho empírico, antes de apresentar os resultados econométricos, deve apresentar algumas estatísticas descritivas.

Assim, vocês devem inicialmente calcular as estatísticas descritivas (média, desvio-padrão, máximo, mínimo, quantidade), por status de fumante (fumante diário, fumante ocasional e não fumante) para as variáveis que serão utilizadas na primeira regressão múltipla que vocês vão estimar (equação abaixo):

Em que peso_gramas é o peso do indivíduo em gramas, TV é a quantidade de horas diárias gastas assistindo televisão e cigarro é a quantidade de cigarros consumida por dia. A variável cigarro assume o valor 0 para os indivíduos que não fumam.

Vocês devem não só apresentar essas estatísticas descritivas, mas também comentá-las.

Depois disso vocês vão começar a rodar as regressões, começando pela equação acima. Vocês devem apresentar os resultados, interpretar os coeficientes estimados e avaliar o grau de ajuste da regressão.

Em seguida vocês vão reestimar a equação, com a variável dependente em log, assim como a variável cigarro. Interpretem novamente os resultados e comparem com os obtidos do modelo com as variáveis em nível.

Que outra variável (variáveis) que faz (fazem) parte da PNS 2013 vocês poderiam adicionar ao modelo? Vocês devem então reestimar o modelo incluindo esta variável ou variáveis. Obviamente devem interpretar e comentar os novos resultados. A partir daqui vocês estão por conta própria e devem usar seus conhecimentos de Economia e de Econometria.

Vocês suspeitam que os erros não são homocedásticos? Façam um teste para heterocedasticidade. Caso vocês encontrem evidência de heterocedasticidade, resolvam de alguma forma o problema. Expliquem que alternativa vocês escolheram.

De posse dos resultados vocês vão finalmente começar a escrever o trabalho. Vocês devem explicitar o objetivo do trabalho, descrever a fonte de dados e apresentar e discutir os diferentes resultados obtidos como se estivessem escrevendo um artigo. NÃO é obrigado fazer seções como num artigo acadêmico, mas as tabelas devem ser feitas de forma correta no R (existe um comando para isso) e não simplesmente copiadas e coladas as saídas dos resultados uma vez que não é assim que os resultados são apresentados em iniciações científicas, monografias, dissertações ou teses. Como dito anteriormente, as saídas do software servirão somente para verificar se de fato você estimou os modelos e nada mais, devendo ser anexadas como apêndice.

---

## DICIONÁRIO DE VARIÁVEIS DA PNS 2013 - ARQUIVO DE PESSOAS - MICRODADO DA PESQUISA NACIONAL DE SAÚDE


**Aba:** PNS 2013

| CÓDIGO DA VARIÁVEL | POSIÇÃO INICIAL | TAMANHO | TIPO | DESCRIÇÃO |
| --- | --- | --- | --- | --- |
| IDENTIFICAÇÃO E CONTROLE |  |  |  |  |
| V0001 | 1 | 2 |  | Unidade da Federação |
|  |  |  | 11 | Rondônia |
|  |  |  | 12 | Acre |
|  |  |  | 13 | Amazonas |
|  |  |  | 14 | Roraima |
|  |  |  | 15 | Pará |
|  |  |  | 16 | Amapá |
|  |  |  | 17 | Tocantins |
|  |  |  | 21 | Maranhão |
|  |  |  | 22 | Piauí |
|  |  |  | 23 | Ceará |
|  |  |  | 24 | Rio Grande do Norte |
|  |  |  | 25 | Paraíba |
|  |  |  | 26 | Pernambuco |
|  |  |  | 27 | Alagoas |
|  |  |  | 28 | Sergipe |
|  |  |  | 29 | Bahia |
|  |  |  | 31 | Minas Gerais |
|  |  |  | 32 | Espírito Santo |
|  |  |  | 33 | Rio de Janeiro |
|  |  |  | 35 | São Paulo |
|  |  |  | 41 | Paraná |
|  |  |  | 42 | Santa Catarina |
|  |  |  | 43 | Rio Grande do Sul |
|  |  |  | 50 | Mato Grosso do Sul |
|  |  |  | 51 | Mato Grosso |
|  |  |  | 52 | Goiás |
|  |  |  | 53 | Distrito Federal |
| V0024 | 3 | 8 |  | Estrato |
| UPA_PNS | 11 | 7 |  | UPA |
| V0006_PNS | 18 | 4 |  | Número de ordem do domicílio na PNS |
| UPA | 22 | 9 |  | Código da UPA das Pesquisas Domiciliares do Sistema Integrado |
| V0025 | 31 | 1 |  | Seleção do morador de 18 anos ou mais para responder o questionário individual |
|  |  |  | 0 | Não selecionada |
|  |  |  | 1 | Selecionada |
|  |  |  | 9 | Não aplicável |
| MÓDULO C – CARACTERÍSTICAS GERAIS DOS MORADORES |  |  |  |  |
| C001 | 32 | 2 |  | Quantas pessoas moram neste domicílio? |
| C00301 | 34 | 2 |  | Número de ordem do morador |
| C004 | 36 | 2 |  | Condição no domicílio: |
|  |  |  | 01 | Pessoa responsável pelo domicílio |
|  |  |  | 02 | Cônjuge ou companheiro(a) de sexo diferente |
|  |  |  | 03 | Cônjuge ou companheiro(a) do mesmo sexo |
|  |  |  | 04 | Filho(a) do responsável e do cônjuge |
|  |  |  | 05 | Filho(a) somente do responsável |
|  |  |  | 06 | Enteado(a) |
|  |  |  | 07 | Genro ou nora |
|  |  |  | 08 | Pai, mãe, padrasto ou madrasta |
|  |  |  | 09 | Sogro(a) |
|  |  |  | 10 | Neto(a) |
|  |  |  | 11 | Bisneto(a) |
|  |  |  | 12 | Irmão ou irmã |
|  |  |  | 13 | Avô ou avó |
|  |  |  | 14 | Outro parente |
|  |  |  | 15 | Agregado(a) – Não parente que não compartilha despesas |
|  |  |  | 16 | Convivente – Não parente que compartilha despesas |
|  |  |  | 17 | Pensionista |
|  |  |  | 18 | Empregado(a) doméstico(a) |
|  |  |  | 19 | Parente do(a) empregado(a)  doméstico(a) |
| C006 | 38 | 1 |  | Sexo |
|  |  |  | 1 | Masculino |
|  |  |  | 2 | Feminino |
| C00701 | 39 | 2 |  | Dia de nascimento |
| C00702 | 41 | 2 |  | Mês de nascimento |
| C00703 | 43 | 4 |  | Ano de nascimento ou idade presumida |
| C008 | 47 | 3 |  | Idade |
| C009 | 50 | 1 |  | Cor ou raça |
|  |  |  | 1 | Branca |
|  |  |  | 2 | Preta |
|  |  |  | 3 | Amarela |
|  |  |  | 4 | Parda |
|  |  |  | 5 | Indígena |
|  |  |  | 9 | Ignorado |
| C010 | 51 | 1 |  | _______ vive com cônjuge ou companheiro(a)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| C011 | 52 | 1 |  | Qual o estado civil de _________? |
|  |  |  | 1 | Casado(a) |
|  |  |  | 2 | Separado(a) ou desquitado(a) judicialmente |
|  |  |  | 3 | Divorciado(a) |
|  |  |  | 4 | Viúvo(a) |
|  |  |  | 5 | Solteiro(a) |
|  |  |  |  | Não aplicável |
| C012 | 53 | 1 |  | O informante desta parte foi: |
|  |  |  | 1 | A própria pessoa |
|  |  |  | 2 | Outro morador |
|  |  |  | 3 | Não morador |
| MÓDULO D – CARACTERÍSTICAS DE EDUCAÇÃO DAS PESSOAS DE 5 ANOS OU MAIS DE IDADE |  |  |  |  |
| D001 | 54 | 1 |  | Sabe ler e escrever? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| D002 | 55 | 1 |  | ______ frequenta escola? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| D003 | 56 | 1 |  | Qual é o curso que _____ frequenta? |
|  |  |  | 1 | Pré-escolar (maternal e jardim de infância) |
|  |  |  | 2 | Alfabetização de jovens e adultos |
|  |  |  | 3 | Regular do ensino fundamental |
|  |  |  | 4 | Educação de jovens e adultos (EJA) ou supletivo do ensino fundamental |
|  |  |  | 5 | Regular do ensino médio |
|  |  |  | 6 | Educação de jovens e adultos (EJA) ou supletivo do ensino médio |
|  |  |  | 7 | Superior - graduação |
|  |  |  | 8 | Mestrado |
|  |  |  | 9 | Doutorado |
|  |  |  |  | Não aplicável |
| D004 | 57 | 1 |  | A duração deste curso que _____ frequenta é de: |
|  |  |  | 1 | 8 anos |
|  |  |  | 2 | 9 anos |
|  |  |  |  | Não aplicável |
| D005 | 58 | 1 |  | Este curso que _____ frequenta é seriado? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| D006 | 59 | 1 |  | Qual é a série / ano que frequenta? |
|  |  |  | 1 | Primeira (o) |
|  |  |  | 2 | Segunda (o) |
|  |  |  | 3 | Terceira (o) |
|  |  |  | 4 | Quarta (o) |
|  |  |  | 5 | Quinta (o) |
|  |  |  | 6 | Sexta (o) |
|  |  |  | 7 | Sétima (o) |
|  |  |  | 8 | Oitava (o) |
|  |  |  | 9 | Nona(o) |
|  |  |  |  | Não aplicável |
| D007 | 60 | 1 |  | _____ já concluiu algum outro curso superior de graduação? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| D008 | 61 | 1 |  | Anteriormente _____ frequentou escola? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| D009 | 62 | 2 |  | Qual foi o curso mais elevado que _____ frequentou anteriormente? |
|  |  |  | 01 | Classe de alfabetização – CA |
|  |  |  | 02 | Alfabetização de jovens e adultos |
|  |  |  | 03 | Antigo primário (elementar) |
|  |  |  | 04 | Antigo ginásio (médio 1º ciclo) |
|  |  |  | 05 | Regular do ensino fundamental ou do 1º grau |
|  |  |  | 06 | Educação de jovens e adultos (EJA) ou supletivo do ensino fundamental |
|  |  |  | 07 | Antigo científico, clássico etc. (médio 2º ciclo) |
|  |  |  | 08 | Regular do ensino médio ou do 2º grau |
|  |  |  | 09 | Educação de jovens e adultos (EJA) ou supletivo do ensino médio |
|  |  |  | 10 | Superior - graduação |
|  |  |  | 11 | Mestrado |
|  |  |  | 12 | Doutorado |
|  |  |  |  | Não aplicável |
| D010 | 64 | 1 |  | A duração deste curso que _____ frequentou anteriormente era de: |
|  |  |  | 1 | 8 anos |
|  |  |  | 2 | 9 anos |
|  |  |  |  | Não aplicável |
| D011 | 65 | 1 |  | Este curso que _____ frequentou anteriormente era seriado? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| D012 | 66 | 1 |  | _____ concluiu, com aprovação, pelo menos a primeira série deste curso que _____ frequentou anteriormente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| D013 | 67 | 1 |  | Qual foi a última série / ano que _____ concluiu, com aprovação, neste curso que frequentou anteriormente? |
|  |  |  | 1 | Primeira (o) |
|  |  |  | 2 | Segunda (o) |
|  |  |  | 3 | Terceira (o) |
|  |  |  | 4 | Quarta (o) |
|  |  |  | 5 | Quinta (o) |
|  |  |  | 6 | Sexta (o) |
|  |  |  | 7 | Sétima (o) |
|  |  |  | 8 | Oitava (o) |
|  |  |  | 9 | Nona(o) |
|  |  |  |  | Não aplicável |
| D014 | 68 | 1 |  | ____ concluiu este curso que frequentou anteriormente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| D015 | 69 | 1 |  | O informante desta parte foi: |
|  |  |  | 1 | A própria pessoa |
|  |  |  | 2 | Outro morador |
|  |  |  | 3 | Não morador |
| MÓDULO E – TRABALHO DOS MORADORES DO DOMICÍLIO |  |  |  |  |
| E001 | 70 | 1 |  | Na semana de 21 a 27 de julho de 2013 (semana de referência), ________________ trabalhou ou estagiou, durante pelo menos uma hora, em alguma atividade remunerada em dinheiro? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| E002 | 71 | 1 |  | Na semana de 21 a 27 de julho de 2013 (semana de referência), ________________ trabalhou ou estagiou, durante pelo menos uma hora, em alguma atividade remunerada em produtos, mercadorias, moradia, etc.? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| E003 | 72 | 1 |  | Apesar do que acaba de dizer, na semana de 21 a 27 de julho de 2013 (semana de referência), ________________ fez algum bico ou trabalhou em alguma atividade ocasional remunerada durante pelo menos 1 hora? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| E004 | 73 | 1 |  | Na semana de 21 a 27 de julho de 2013 (semana de referência), ________________ ajudou durante pelo menos 1 hora, sem receber pagamento, no trabalho remunerado de algum morador do domicílio? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| E005 | 74 | 1 |  | Na semana de 21 a 27 de julho de 2013 (semana de referência), ________________ tinha algum trabalho remunerado do qual estava temporariamente afastado? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| E006 | 75 | 1 |  | Na semana de 21 a 27 de julho de 2013 (semana de referência), porque motivo ________________ estava afastado desse trabalho? |
|  |  |  | 1 | Férias, folga ou jornada de trabalho variável |
|  |  |  | 2 | Licença maternidade |
|  |  |  | 3 | Licença remunerada por motivo de doença ou acidente da própria pessoa |
|  |  |  | 4 | Outro tipo de licença remunerada (estudo, paternidade, casamento, licença prêmio etc.) |
|  |  |  | 5 | Afastamento do próprio negócio/empresa por motivo de gestação, doença, acidente etc., sem ser remunerado por instituto de previdência |
|  |  |  | 6 | Fatores ocasionais (tempo, paralisação nos serviços de transporte etc.) |
|  |  |  | 7 | Greve ou paralisação |
|  |  |  | 8 | Outro motivo |
|  |  |  |  | Não aplicável |
| E007 | 76 | 1 |  | Durante o tempo de afastamento, ________________ continuou a receber ao menos uma parte do pagamento? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| E008 | 77 | 1 |  | A doença ou acidente foi relacionado ao trabalho? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| E01001 | 78 | 2 |  | Em 27 de julho de 2013 (último dia da semana de referência), fazia quantos dias que ________________ estava afastado desse trabalho? |
|  |  |  | 00 a 30 | Dias |
|  |  |  |  | Não aplicável |
| E01002 | 80 | 2 |  | Em 27 de julho de 2013 (último dia da semana de referência), fazia quantos meses que ________________ estava afastado desse trabalho? |
|  |  |  | 00 a 11 | Meses |
|  |  |  |  | Não aplicável |
| E01003 | 82 | 2 |  | Em 27 de julho de 2013 (último dia da semana de referência), fazia quantos anos que ________________ estava afastado desse trabalho? |
|  |  |  | 00 a 30 | Anos |
|  |  |  |  | Não aplicável |
| E011 | 84 | 1 |  | Quantos trabalhos ________________ tinha na semana de 21 a 27 de julho de 2013 (semana de referência)? |
|  |  |  | 1 | Um |
|  |  |  | 2 | Dois |
|  |  |  | 3 | Três ou mais |
|  |  |  |  | Não aplicável |
| E01201 | 85 | 5 |  | Qual era a ocupação (cargo ou função) que ________________ tinha nesse trabalho? - Código |
| E014 | 90 | 1 |  | Nesse trabalho era: |
|  |  |  | 1 | Trabalhador doméstico |
|  |  |  | 2 | Militar do exército, da marinha, da aeronáutica, da policia militar ou do corpo de bombeiros militar |
|  |  |  | 3 | Empregado do setor privado |
|  |  |  | 4 | Empregado do setor público (inclusivé empresas de economia mista) |
|  |  |  | 5 | Empregador |
|  |  |  | 6 | Conta própria |
|  |  |  | 7 | Trabalhador não-remunerado – em ajuda a conta própria ou empregador que era membro do domicílio |
|  |  |  | 8 | Trabalhador não-remunerado – em ajuda a empregado que era membro do domicílio |
|  |  |  |  | Não aplicável |
| E01501 | 91 | 5 |  | Qual era a principal atividade desse negócio/empresa? - Código |
| E01601 | 96 | 1 |  | Recebia valor em dinheiro por esse trabalho principal? |
|  |  |  | 1 | Recebe valor em dinheiro |
|  |  |  |  | Não recebe/Não aplicável |
| E01602 | 97 | 8 |  | Qual era o rendimento bruto mensal ou retirada que ________________ fazia normalmente nesse trabalho? - Valor em dinheiro (R$) |
|  |  |  | 00000001 a 99999999 | Reais |
|  |  |  |  | Não recebe/Não aplicável |
| E01603 | 105 | 1 |  | Recebia em produtos ou mercadorias por esse trabalho principal? |
|  |  |  | 2 | Recebe valor estimado dos produtos ou mercadorias |
|  |  |  |  | Não recebe/Não aplicável |
| E01604 | 106 | 8 |  | Qual era o rendimento bruto mensal ou retirada que ________________ fazia normalmente nesse trabalho? - Valor estimado dos produtos ou mercadorias (R$) |
|  |  |  | 00000001 a 99999999 | Reais |
|  |  |  |  | Não recebe/Não aplicável |
| E01605 | 114 | 1 |  | Recebia somente em benefícios por esse trabalho principal? |
|  |  |  | 3 | Recebe somente em benefícios |
|  |  |  |  | Não recebe/Não aplicável |
| E017 | 115 | 3 |  | Quantas horas ________________ trabalhava normalmente, por semana, nesse trabalho |
|  |  |  | 001 a 120 | Horas |
|  |  |  |  | Não aplicável |
| E01801 | 118 | 1 |  | Recebia valor em dinheiro por esse(s) outro(s) trabalho(s)? |
|  |  |  | 1 | Recebe valor em dinheiro |
|  |  |  |  | Não recebe |
| E01802 | 119 | 8 |  | Qual era o rendimento bruto mensal ou retirada que ________________ fazia normalmente nesse(s) outro(s) trabalho(s)? - Valor em dinheiro (R$) |
|  |  |  | 00000001 a 99999999 | Reais |
|  |  |  |  | Não recebe/Não aplicável |
| E01803 | 127 | 1 |  | Recebia valor em produtos ou mercadorias por esse(s) outro(s) trabalho(s)? |
|  |  |  | 2 | Recebe valor estimado dos produtos ou mercadorias |
|  |  |  |  | Não recebe/Não aplicável |
| E01804 | 128 | 8 |  | Qual era o rendimento bruto mensal ou retirada que ________________ fazia normalmente nesse(s) outro(s) trabalho(s)? - Valor estimado dos produtos ou mercadorias (R$) |
|  |  |  | 00000001 a 99999999 | Reais |
|  |  |  |  | Não recebe/Não aplicável |
| E01805 | 136 | 1 |  | Recebia somente em benefícios por esse(s) outro(s) trabalho(s)? |
|  |  |  | 3 | Recebe somente em benefícios |
|  |  |  |  | Não recebe/Não aplicável |
| E019 | 137 | 3 |  | Quantas horas ________________ trabalhava normalmente, por semana, nesse(s) outro(s) trabalho(s)? |
|  |  |  | 001 a 120 | Horas |
|  |  |  |  | Não aplicável |
| E020 | 140 | 1 |  | No período de 28 de junho a 27 de julho de 2013 (período de referência de 30 dias), ________________ tomou alguma providência para conseguir outro trabalho, seja um emprego ou um negócio próprio? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| E021 | 141 | 1 |  | Qual foi o principal motivo que levou ________________ a procurar outro trabalho no período de 28 de junho a 27 de julho de 2013 (período de referência de 30 dias)? |
|  |  |  | 1 | Achava que seria dispensado ou que o negócio/empresa seria fechado |
|  |  |  | 2 | Ter um trabalho com garantias trabalhistas ou com maior estabilidade |
|  |  |  | 3 | Ter o seu próprio negócio/empresa |
|  |  |  | 4 | Conseguir um trabalho de acordo com a sua experiência profissional e/ou formação |
|  |  |  | 5 | Melhorar suas condições de bem-estar (menos desgaste físico, melhores relações de trabalho, menos tempo de transporte etc .) |
|  |  |  | 6 | Aumentar os rendimentos |
|  |  |  | 7 | Trabalhar menor número de horas, mesmo com redução de rendimentos |
|  |  |  | 8 | Outro motivo |
|  |  |  |  | Não aplicável |
| E022 | 142 | 1 |  | No período de 28 de junho a 27 de julho de 2013 (período de referência de 30 dias), ________________ tomou alguma providência para conseguir trabalho, seja um emprego ou um negócio próprio? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| E023 | 143 | 2 |  | No período de 28 de junho a 27 de julho de 2013 (período de referência de 30 dias), qual foi a principal providência que ________________ tomou para conseguir trabalho? |
|  |  |  | 01 | Entrou diretamente em contato com empregador (em fábrica, fazenda, mercado, loja ou outro local de trabalho) |
|  |  |  | 02 | Fez ou inscreveu-se em concurso |
|  |  |  | 03 | Consultou agência privada ou sindicato |
|  |  |  | 04 | Consultou agência municipal, estadual ou o Sistema Nacional de Emprego (SINE) |
|  |  |  | 05 | Colocou ou respondeu anúncio |
|  |  |  | 06 | Consultou parente, amigo ou colega |
|  |  |  | 07 | Buscou ajuda financeira para iniciar o próprio negócio |
|  |  |  | 08 | Procurou local, equipamento ou maquinário para iniciar o próprio negócio |
|  |  |  | 09 | Solicitou registro ou licença para iniciar o próprio negócio |
|  |  |  | 10 | Tomou outra providência |
|  |  |  | 11 | Não tomou providência efetiva |
|  |  |  |  | Não aplicável |
| E024 | 145 | 2 |  | Qual foi o principal motivo de ________________ não ter tomado providência para conseguir trabalho no período de 28 de junho a 27 de julho de 2013 (período de referência de 30 dias)? |
|  |  |  | 01 | Conseguiu proposta de trabalho para começar após a semana de referência |
|  |  |  | 02 | Aguardando resposta de medida tomada para conseguir trabalho |
|  |  |  | 03 | Desistiu de procurar por não conseguir encontrar trabalho |
|  |  |  | 04 | Acha que não vai encontrar trabalho por ser muito jovem ou muito idoso |
|  |  |  | 05 | Tinha que cuidar de filho(s), de outro(s) dependente(s) ou dos afazeres domésticos |
|  |  |  | 06 | Estudo |
|  |  |  | 07 | Incapacidade física, mental ou doença permanente |
|  |  |  | 08 | Aposentado por idade/tempo de serviço ou contribuição |
|  |  |  | 09 | Aposentado por doença/invalidez |
|  |  |  | 10 | Não desejava trabalhar |
|  |  |  | 11 | Outro motivo |
|  |  |  |  | Não aplicável |
| E025 | 147 | 1 |  | Até o dia 27 de julho de 2013 (último dia da semana de referência), fazia quanto tempo que ________________ estava sem qualquer trabalho e tentando conseguir trabalho? |
|  |  |  | 1 | Menos de 1 mês |
|  |  |  | 2 | De 1 mês a menos de 1 ano |
|  |  |  | 3 | De 1 ano a menos de 2 anos |
|  |  |  | 4 | 2 anos ou mais |
|  |  |  |  | Não aplicável |
| E02501 | 148 | 2 |  | Número de meses na condição 2 da variável E025: De 1 mês a menos de 1 ano |
|  |  |  | 01 a 11 | Meses |
|  |  |  |  | Não aplicável |
| E02502 | 150 | 2 |  | Número de meses na condição 3 da variável E025: De 1 ano a menos de 2 anos |
|  |  |  | 00 a 11 | Meses |
|  |  |  |  | Não aplicável |
| E026 | 152 | 1 |  | Se tivesse conseguido um trabalho ________________ poderia ter começado a trabalhar na semana de 21 a 27 de julho de 2013 (semana de referência)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| E027 | 153 | 1 |  | O informante desta parte foi: |
|  |  |  | 1 | A própria pessoa |
|  |  |  | 2 | Outro morador |
|  |  |  | 3 | Não morador |
|  |  |  |  | Não aplicável |
| MÓDULO G – PESSOAS COM DEFICIÊNCIAS |  |  |  |  |
| G001 | 154 | 1 |  | _______tem deficiência intelectual? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| G002 | 155 | 1 |  | _________nasceu com a deficiência intelectual ou a deficiência foi adquirida por doença ou acidente? |
|  |  |  | 1 | Nasceu com a deficiência |
|  |  |  | 2 | Foi adquirida |
|  |  |  |  | Não Aplicável |
| G00201 | 156 | 2 |  | Com que idade? |
|  |  |  | 00 a 99 | Anos |
|  |  |  |  | Não Aplicável |
| G003 | 158 | 1 |  | A deficiência intelectual está associada a alguma dessas síndromes ou transtornos de  desenvolvimento? |
|  |  |  | 1 | Síndrome de Down |
|  |  |  | 2 | Autismo |
|  |  |  | 3 | Paralisia cerebral |
|  |  |  | 4 | Outra síndrome |
|  |  |  | 5 | AVC, AVE, derrame, aneurisma ou epilepsia |
|  |  |  | 6 | Demência senil ou falhas de memória |
|  |  |  |  | Não aplicável |
| G004 | 159 | 1 |  | Em geral, em que grau a deficiência intelectual limita as atividades habituais (como ir à escola, brincar, trabalhar, etc.) de _______________? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente / Não consegue |
|  |  |  |  | Não aplicável |
| G005 | 160 | 1 |  | _________frequenta algum serviço de reabilitação devido à deficiência intelectual? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| G006 | 161 | 1 |  | _________tem alguma deficiência física? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| G007 | 162 | 1 |  | _________nasceu com a deficiência física ou a deficiência foi adquirida por doença ou acidente? |
|  |  |  | 1 | Nasceu com a deficiência |
|  |  |  | 2 | Foi adquirida |
|  |  |  |  | Não aplicável |
| G00701 | 163 | 2 |  | Com que idade? |
|  |  |  | 00 a 99 | Anos |
|  |  |  |  | Não aplicável |
| G008 | 165 | 2 |  | Qual deficiência física? |
|  |  |  | 01 | Paralisia permanente de um dos lados do corpo |
|  |  |  | 02 | Paralisia permanente das pernas e dos braços |
|  |  |  | 03 | Paralisia permanente das pernas |
|  |  |  | 04 | Paralisia permanente de uma das pernas |
|  |  |  | 05 | Amputação ou ausência de perna |
|  |  |  | 06 | Amputação ou ausência de braço |
|  |  |  | 07 | Amputação ou ausência de mão |
|  |  |  | 08 | Amputação ou ausência de pé |
|  |  |  | 09 | Deformidade congênita ou adquirida em um ou mais membros |
|  |  |  | 10 | Deficiência motora em decorrência de poliomielite ou paralisia infantil |
|  |  |  | 11 | Ostomia (adaptação de bolsa de fezes e/ou urina) |
|  |  |  | 12 | Nanismo |
|  |  |  | 13 | Outra |
|  |  |  | 14 | Ausência ou amputação de dedos |
|  |  |  |  | Não aplicável |
| G009 | 167 | 1 |  | Em geral, em que grau a deficiência física limita as atividades habituais de __________ ? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente/Não consegue |
|  |  |  |  | Não aplicável |
| G010 | 168 | 1 |  | _________frequenta algum serviço de reabilitação devido à deficiência física? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| G014 | 169 | 1 |  | _________tem deficiência auditiva ? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| G015 | 170 | 1 |  | _________nasceu com a deficiência auditiva ou a deficiência foi adquirida? |
|  |  |  | 1 | Nasceu com a deficiência |
|  |  |  | 2 | Foi adquirida |
|  |  |  |  | Não aplicável |
| G01501 | 171 | 2 |  | Com que idade? |
|  |  |  | 00 a 99 | Anos |
|  |  |  |  | Não aplicável |
| G016 | 173 | 1 |  | Qual deficiência auditiva? |
|  |  |  | 1 | Surdez dos dois ouvidos |
|  |  |  | 2 | Surdez de um ouvido e audição reduzida do outro |
|  |  |  | 3 | Surdez de um ouvido e audição normal do outro |
|  |  |  | 4 | Audição reduzida de ambos os ouvidos |
|  |  |  | 5 | Audição reduzida em um dos ouvidos |
|  |  |  |  | Não aplicável |
| G017 | 174 | 1 |  | Em geral, em que grau a deficiência auditiva limita as atividades habituais de __________? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| G018 | 175 | 1 |  | _________frequenta algum serviço de reabilitação devido à deficiência auditiva? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| G021 | 176 | 1 |  | _________tem deficiência visual ? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| G022 | 177 | 1 |  | _________nasceu com a deficiência visual ou a deficiência foi adquirida por doença ou acidente? |
|  |  |  | 1 | Nasceu com a deficiência |
|  |  |  | 2 | Foi adquirida |
|  |  |  |  | Não aplicável |
| G02201 | 178 | 2 |  | Com que idade? |
|  |  |  | 00 a 99 | Anos |
|  |  |  |  | Não aplicável |
| G023 | 180 | 1 |  | Qual deficiência visual? |
|  |  |  | 1 | Cegueira de ambos os olhos |
|  |  |  | 2 | Cegueira de um olho e visão reduzida do outro |
|  |  |  | 3 | Cegueira de um olho e visão normal do outro |
|  |  |  | 4 | Baixa visão de ambos os olhos |
|  |  |  | 5 | Baixa visão em um dos olhos |
|  |  |  |  | Não aplicável |
| G024 | 181 | 1 |  | _____ usa algum recurso para auxiliar a locomoção? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| G02501 | 182 | 1 |  | _____ faz uso de bengala articulada? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| G02502 | 183 | 1 |  | _____ faz uso de cão guia? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| G02503 | 184 | 1 |  | _____ faz usao de algum outro recurso que não bengala articulada ou cão guia para auxiliar a locomoção? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| G026 | 185 | 1 |  | Em geral, em que grau a deficiência visual limita as atividades habituais de __________? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| G027 | 186 | 1 |  | _________frequenta algum serviço de reabilitação devido à deficiência visual? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| G032 | 187 | 1 |  | O informante desta parte foi: |
|  |  |  | 1 | A própria pessoa |
|  |  |  | 2 | Outro morador |
|  |  |  | 3 | Não morador |
| MÓDULO I – COBERTURA DE PLANO DE SAÚDE |  |  |  |  |
| I001 | 188 | 1 |  | _____ tem algum plano de saúde, médico ou odontológico, particular, de empresa ou órgão público? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| I002 | 189 | 2 |  | _____ tem quantos planos de saúde (médico ou odontológico) particular, de empresa ou órgão público? |
|  |  |  | 01 a 99 | Planos de saúde (médico ou odontológico) |
|  |  |  |  | Não aplicável |
| I003 | 191 | 1 |  | _____ tem algum plano de saúde apenas para assistência odontológica? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| I004 | 192 | 1 |  | O plano de saúde (único ou principal) que _____ possui é de instituição de assistência de servidor público (municipal, estadual ou militar)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| I005 | 193 | 1 |  | Há quanto tempo sem interrupção _____ possui esse plano de saúde? |
|  |  |  | 1 | Até 6 meses |
|  |  |  | 2 | Mais de 6 meses até 1 ano |
|  |  |  | 3 | Mais de 1 ano até 2 anos |
|  |  |  | 4 | Mais de 2 anos |
|  |  |  |  | Não aplicável |
| I006 | 194 | 1 |  | _____ considera este plano de saúde: |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  | 6 | Nunca usou o plano de saúde |
|  |  |  |  | Não aplicável |
| I007 | 195 | 1 |  | Quem é o titular do plano de saúde? |
|  |  |  | 1 | Titular morador |
|  |  |  | 2 | Titular não morador |
|  |  |  |  | Não aplicável |
| I00701 | 196 | 2 |  | Número do morador no domicílio titular do plano de saúde |
|  |  |  | 01 a 30 | Número de ordem do morador titular |
|  |  |  |  | Não aplicável |
| I008 | 198 | 1 |  | _____ (nome do titular) tem alguém que não mora neste domicílio como dependente ou agregado neste plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| I009 | 199 | 2 |  | Quantas pessoas que não moram neste domicílio ______ (nome do titular) tem como dependentes ou agregados no plano de saúde? |
|  |  |  | 01 a 99 | Pessoas |
|  |  |  |  | Não aplicável |
| I010 | 201 | 1 |  | Quem paga a mensalidade deste plano de saúde? |
|  |  |  | 1 | Somente o empregador do titular |
|  |  |  | 2 | O titular, através do trabalho atual |
|  |  |  | 3 | O titular, através do trabalho anterior |
|  |  |  | 4 | O titular, diretamente ao plano |
|  |  |  | 5 | Outro morador do domicílio |
|  |  |  | 6 | Pessoa não moradora do domicílio |
|  |  |  | 7 | Outro |
|  |  |  |  | Não aplicável |
| I011 | 202 | 1 |  | Qual é o valor da mensalidade deste plano de saúde? |
|  |  |  | 1 | Menos de R$50,00 |
|  |  |  | 2 | De R$50,00 a menos de R$100,00 |
|  |  |  | 3 | De R$100,00 a menos de R$200,00 |
|  |  |  | 4 | De R$200,00 a menos de R$300,00 |
|  |  |  | 5 | De R$300,00 a menos de R$500,00 |
|  |  |  | 6 | De R$500,00 a menos de R$1000,00 |
|  |  |  | 7 | R$1000,00 e mais |
|  |  |  |  | Não aplicável |
| MÓDULO J – UTILIZAÇÃO DE SERVIÇOS DE SAÚDE |  |  |  |  |
| J001 | 203 | 1 |  | De um modo geral, como é o estado de saúde de _______ |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
| J002 | 204 | 1 |  | Nas duas últimas semanas, _____ deixou de realizar quaisquer de suas atividades habituais (trabalhar, ir à escola, brincar, afazeres domésticos etc.) por motivo de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| J003 | 205 | 2 |  | Nas duas últimas semanas, quantos dias _____ deixou de realizar suas atividades habituais, por motivo de saúde? |
|  |  |  | 01 a 14 | Dias |
|  |  |  |  | Não aplicável |
| J004 | 207 | 2 |  | Qual foi o principal motivo de saúde que impediu _____ de realizar suas atividade habituais nas duas últimas semanas? |
|  |  |  | 01 | Dor nas costas, problema no pescoço ou na nuca |
|  |  |  | 02 | Dor nos braços |
|  |  |  | 03 | Artrite ou reumatismo |
|  |  |  | 04 | DORT – doença osteomuscular relacionada ao trabalho |
|  |  |  | 05 | Dor de cabeça ou enxaqueca |
|  |  |  | 06 | Problemas menstruais |
|  |  |  | 07 | Problemas da gravidez |
|  |  |  | 08 | Parto |
|  |  |  | 09 | Problema odontológico |
|  |  |  | 10 | Resfriado / gripe |
|  |  |  | 11 | Asma / bronquite / pneumonia |
|  |  |  | 12 | Diarréia / vômito / náusea / gastrite |
|  |  |  | 13 | Dengue |
|  |  |  | 14 | Pressão alta ou outra doença do coração |
|  |  |  | 15 | Diabetes |
|  |  |  | 16 | AVC ou derrame |
|  |  |  | 17 | Câncer |
|  |  |  | 18 | Depressão |
|  |  |  | 19 | Outro problema de saúde mental |
|  |  |  | 20 | Outra doença |
|  |  |  | 21 | Lesão provocada por acidente de trânsito |
|  |  |  | 22 | Lesão provocada por outro tipo de acidente |
|  |  |  | 23 | Lesão provocada por agressão ou outra violência |
|  |  |  | 24 | Outro problema de saúde |
|  |  |  |  | Não aplicável |
| J005 | 209 | 1 |  | Nas duas últimas semanas _____ esteve acamado(a)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| J006 | 210 | 2 |  | Nas duas últimas semanas, quantos dias _____ esteve acamado(a)? |
|  |  |  | 01 a 14 | Dias |
|  |  |  |  | Não aplicável |
| J007 | 212 | 1 |  | Algum médico já deu o diagnóstico de alguma doença crônica, física ou mental, ou doença de longa duração (de mais de 6 meses de duração) a ____________? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| J008 | 213 | 1 |  | Esta doença limita de alguma forma suas atividades habituais (trabalhar, ir à escola, brincar, afazeres domésticos, etc.)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| J009 | 214 | 1 |  | _____ costuma procurar o mesmo lugar, mesmo médico ou mesmo serviço de saúde quando precisa de atendimento de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| J010 | 215 | 2 |  | Quando está doente ou precisando de atendimento de saúde _____ costuma procurar: |
|  |  |  | 01 | Farmácia |
|  |  |  | 02 | Unidade básica de saúde (posto ou centro de saúde ou unidade de saúde da família) |
|  |  |  | 03 | Centro de Especialidades, Policlínica pública ou PAM – Posto de Assistência Médica |
|  |  |  | 04 | UPA (Unidade de Pronto Atendimento) |
|  |  |  | 05 | Outro tipo de Pronto Atendimento Público (24 horas) |
|  |  |  | 06 | Pronto-socorro ou emergência de hospital público |
|  |  |  | 07 | Hospital público/ambulatório |
|  |  |  | 08 | Consultório particular ou Clínica privada |
|  |  |  | 09 | Ambulatório ou consultório de empresa ou sindicato |
|  |  |  | 10 | Pronto-atendimento ou emergência de hospital privado |
|  |  |  | 11 | No domicílio, com profissional da equipe de saúde da família |
|  |  |  | 12 | No domicílio, com médico particular |
|  |  |  | 13 | Outro serviço |
|  |  |  |  | Não aplicável |
| J011 | 217 | 1 |  | Quando  ________ consultou um médico pela última vez? |
|  |  |  | 1 | Nos doze últimos meses |
|  |  |  | 2 | De 1 ano a menos de 2 anos |
|  |  |  | 3 | De 2 anos a menos de 3 anos |
|  |  |  | 4 | 3 anos ou mais |
|  |  |  | 5 | Nunca foi ao médico |
| J012 | 218 | 3 |  | Quantas vezes _______ consultou o médico nos últimos 12 meses? |
|  |  |  | 001 a 999 | Vezes |
|  |  |  |  | Não aplicável |
| J013 | 221 | 1 |  | Quando  ________ consultou um dentista pela última vez? |
|  |  |  | 1 | Nos doze últimos meses |
|  |  |  | 2 | De 1 ano a menos de 2 anos |
|  |  |  | 3 | De 2 anos a menos de 3 anos |
|  |  |  | 4 | 3 anos ou mais |
|  |  |  | 5 | Nunca foi ao dentista |
| J014 | 222 | 1 |  | Nas duas últimas semanas, _____ procurou algum lugar, serviço ou profissional de saúde para atendimento relacionado à própria saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| J015 | 223 | 2 |  | Qual foi o motivo principal pelo qual _____ procurou atendimento relacionado à saúde nas duas últimas semanas? |
|  |  |  | 01 | Acidente ou lesão |
|  |  |  | 02 | Doença |
|  |  |  | 03 | Problema odontológico |
|  |  |  | 04 | Reabilitação ou terapia |
|  |  |  | 05 | Continuação de tratamento |
|  |  |  | 06 | Pré-natal |
|  |  |  | 07 | Puericultura |
|  |  |  | 08 | Parto |
|  |  |  | 09 | Exame complementar de diagnóstico |
|  |  |  | 10 | Vacinação |
|  |  |  | 11 | Outro atendimento preventivo |
|  |  |  | 12 | Solicitação de atestado de saúde |
|  |  |  | 13 | Outro |
|  |  |  |  | Não aplicável |
| J016 | 225 | 2 |  | Onde _____ procurou o primeiro atendimento de saúde por este motivo nas duas últimas semanas? |
|  |  |  | 01 | Farmácia |
|  |  |  | 02 | Unidade básica de saúde (posto ou centro de saúde ou unidade de saúde da família) |
|  |  |  | 03 | Centro de Especialidades, Policlínica pública ou PAM – Posto de Assistência Médica |
|  |  |  | 04 | UPA (Unidade de Pronto Atendimento) |
|  |  |  | 05 | Outro tipo de Pronto Atendimento Público (24 horas) |
|  |  |  | 06 | Pronto-socorro ou emergência de hospital público |
|  |  |  | 07 | Hospital público/ambulatório |
|  |  |  | 08 | Consultório particular ou Clínica privada |
|  |  |  | 09 | Ambulatório ou consultório de empresa ou sindicato |
|  |  |  | 10 | Pronto-atendimento ou emergência de hospital privado |
|  |  |  | 11 | No domicílio, com profissional da equipe de saúde da família |
|  |  |  | 12 | No domicílio, com médico particular |
|  |  |  | 13 | Outro serviço |
|  |  |  |  | Não aplicável |
| J017 | 227 | 1 |  | Nessa primeira vez que procurou atendimento de saúde, nas duas últimas semanas, _______ foi atendido(a)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| J018 | 228 | 1 |  | Por que motivo _______ não foi atendido(a) na primeira vez que procurou atendimento de saúde nas duas últimas semanas? |
|  |  |  | 1 | Não conseguiu vaga ou pegar senha |
|  |  |  | 2 | Não tinha médico atendendo |
|  |  |  | 3 | Não tinha dentista atendendo |
|  |  |  | 4 | Não havia serviço ou profissional de saúde especializado para atender |
|  |  |  | 5 | Esperou muito e desistiu |
|  |  |  | 6 | O serviço de saúde não estava funcionando |
|  |  |  | 7 | Os equipamentos do serviço de saúde não estavam funcionando ou disponíveis para uso |
|  |  |  | 8 | Não podia pagar pela consulta |
|  |  |  | 9 | Outro |
|  |  |  |  | Não aplicável |
| J019 | 229 | 2 |  | Nas duas últimas semanas, quantas vezes _______ voltou a procurar atendimento de saúde por este motivo? |
|  |  |  | 00 | Nenhuma |
|  |  |  | 01 a 99 | Vezes |
|  |  |  |  | Não aplicável |
| J020 | 231 | 2 |  | Onde ___ procurou o último atendimento de saúde por este motivo nas duas últimas semanas? |
|  |  |  | 01 | Farmácia |
|  |  |  | 02 | Unidade básica de saúde (posto ou centro de saúde ou unidade de saúde da família) |
|  |  |  | 03 | Centro de Especialidades, Policlínica pública ou PAM – Posto de Assistência Médica |
|  |  |  | 04 | UPA (Unidade de Pronto Atendimento) |
|  |  |  | 05 | Outro tipo de Pronto Atendimento Público (24 horas) |
|  |  |  | 06 | Pronto-socorro ou emergência de hospital público |
|  |  |  | 07 | Hospital público/ambulatório |
|  |  |  | 08 | Consultório particular ou Clínica privada |
|  |  |  | 09 | Ambulatório ou consultório de empresa ou sindicato |
|  |  |  | 10 | Pronto-atendimento ou emergência de hospital privado |
|  |  |  | 11 | No domicílio, com profissional da equipe de saúde da família |
|  |  |  | 12 | No domicílio, com médico particular |
|  |  |  | 13 | Outro serviço |
|  |  |  |  | Não aplicável |
| J021 | 233 | 1 |  | Nessa última vez que procurou atendimento de saúde, nas duas últimas semanas, _______ foi atendido(a)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| J022 | 234 | 1 |  | Por que motivo _______ não foi atendido(a) nessa última vez que procurou atendimento de saúde nas duas últimas semanas? |
|  |  |  | 1 | Não conseguiu vaga ou pegar senha |
|  |  |  | 2 | Não tinha médico atendendo |
|  |  |  | 3 | Não tinha dentista atendendo |
|  |  |  | 4 | Não havia profissional de saúde especializado para atender |
|  |  |  | 5 | Esperou muito e desistiu |
|  |  |  | 6 | O serviço de saúde não estava funcionando |
|  |  |  | 7 | Os equipamentos do serviço de saúde não estavam funcionando ou disponíveis para uso |
|  |  |  | 8 | Não podia pagar pela consulta |
|  |  |  | 9 | Outro |
|  |  |  |  | Não aplicável |
| J023 | 235 | 1 |  | Este serviço de saúde onde _______ foi atendido era: |
|  |  |  | 1 | Público |
|  |  |  | 2 | Privado |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| J024 | 236 | 1 |  | Este atendimento de saúde de _______ foi coberto por algum plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| J025 | 237 | 1 |  | ______ pagou algum valor por este atendimento de saúde recebido nas duas últimas semanas? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| J026 | 238 | 1 |  | O atendimento de _______ foi feito pelo SUS? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| J027 | 239 | 2 |  | Qual foi o principal atendimento de saúde que _____ recebeu? |
|  |  |  | 01 | Consulta médica |
|  |  |  | 02 | Consulta odontológica |
|  |  |  | 03 | Consulta com outro profissional de saúde (fisioterapeuta, fonoaudiólogo, psicólogo, nutricionista, enfermeiro, etc.) |
|  |  |  | 04 | Atendimento com agente comunitário de saúde |
|  |  |  | 05 | Atendimento com parteira |
|  |  |  | 06 | Atendimento na farmácia |
|  |  |  | 07 | Vacinação |
|  |  |  | 08 | Injeção, curativo ou medição de pressão arterial |
|  |  |  | 09 | Quimioterapia, radioterapia, hemodiálise ou hemoterapia |
|  |  |  | 10 | Exames laboratoriais ou de imagem ou exames complementares de diagnóstico |
|  |  |  | 11 | Gesso ou imobilização |
|  |  |  | 12 | Pequena cirurgia em ambulatório |
|  |  |  | 13 | Internação hospitalar |
|  |  |  | 14 | Marcação de consulta |
|  |  |  | 15 | Práticas complementares como acupuntura, homeopatia e fitoterapia |
|  |  |  | 16 | Outro atendimento |
|  |  |  |  | Não aplicável |
| J029 | 241 | 1 |  | No último atendimento de _____, foi receitado algum medicamento? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| J030 | 242 | 1 |  | _____ conseguiu obter os medicamentos receitados? |
|  |  |  | 1 | Todos |
|  |  |  | 2 | Alguns |
|  |  |  | 3 | Nenhum |
|  |  |  |  | Não aplicável |
| J031 | 243 | 1 |  | Qual o principal motivo de _____ não ter conseguido obter todos os medicamentos receitados? |
|  |  |  | 1 | Não conseguiu obter no serviço público de saúde, pois a farmácia estava fechada |
|  |  |  | 2 | Os medicamentos não estavam disponíveis no serviço de saúde |
|  |  |  | 3 | Não conseguiu o(s) medicamento(s) no programa farmácia popular (PFP) |
|  |  |  | 4 | Não tinha farmácia próxima ou teve dificuldade de transporte |
|  |  |  | 5 | Não conseguiu encontrar todos os medicamentos na farmácia |
|  |  |  | 6 | Não tinha dinheiro para comprar |
|  |  |  | 7 | Não achou necessário |
|  |  |  | 8 | Desistiu de procurar, pois melhorou |
|  |  |  | 9 | Outro |
|  |  |  |  | Não aplicável |
| J032 | 244 | 1 |  | Algum dos medicamentos foi coberto por plano de saúde? |
|  |  |  | 1 | Sim, todos |
|  |  |  | 2 | Sim, alguns |
|  |  |  | 3 | Não, nenhum |
|  |  |  |  | Não aplicável |
| J033 | 245 | 1 |  | Algum dos medicamentos foi obtido no programa farmácia popular (PFP)? |
|  |  |  | 1 | Sim, todos |
|  |  |  | 2 | Sim, alguns |
|  |  |  | 3 | Não, nenhum |
|  |  |  |  | Não aplicável |
| J034 | 246 | 1 |  | Algum dos medicamentos foi obtido em serviço público de saúde? |
|  |  |  | 1 | Sim, todos |
|  |  |  | 2 | Sim, alguns |
|  |  |  | 3 | Não, nenhum |
|  |  |  |  | Não aplicável |
| J035 | 247 | 1 |  | _______ pagou algum valor pelos medicamentos? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| J036 | 248 | 2 |  | Nas duas últimas semanas, por que motivo _____ não procurou serviço de saúde? |
|  |  |  | 01 | Não houve necessidade |
|  |  |  | 02 | Não tinha dinheiro |
|  |  |  | 03 | O local de atendimento era distante ou de difícil acesso |
|  |  |  | 04 | Horário incompatível |
|  |  |  | 05 | O atendimento é muito demorado |
|  |  |  | 06 | O estabelecimento não possuía especialista compatível com suas necessidades |
|  |  |  | 07 | Achou que não tinha direito |
|  |  |  | 08 | Não tinha quem o(a) acompanhasse |
|  |  |  | 09 | Não gostava dos profissionais do estabelecimento |
|  |  |  | 10 | Greve nos serviços de saúde |
|  |  |  | 11 | Dificuldade de transporte |
|  |  |  | 12 | Outro motivo |
|  |  |  |  | Não aplicável |
| J037 | 250 | 1 |  | Nos últimos 12 meses, _______ ficou internado(a) em hospital por 24 horas ou mais? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| J038 | 251 | 2 |  | Nos últimos 12 meses, quantas vezes _____ esteve internado(a)? |
|  |  |  | 01 a 99 | Vezes |
|  |  |  |  | Não aplicável |
| J039 | 253 | 1 |  | Qual foi o principal atendimento de saúde que _____ recebeu quando esteve internado(a) (pela última vez) nos doze últimos meses? |
|  |  |  | 1 | Parto normal |
|  |  |  | 2 | Parto cesáreo |
|  |  |  | 3 | Tratamento clínico |
|  |  |  | 4 | Tratamento psiquiátrico |
|  |  |  | 5 | Cirurgia |
|  |  |  | 6 | Exames complementares de diagnóstico |
|  |  |  | 7 | Outro |
|  |  |  |  | Não aplicável |
| J04001 | 254 | 2 |  | Quantos meses _____ ficou internado(a) na última vez? |
|  |  |  | 00 | - |
|  |  |  | 01 a 87 | Meses |
|  |  |  | 88 | Morador ainda está internado |
|  |  |  |  | Não aplicável |
| J04002 | 256 | 2 |  | Quantos dias _____ ficou internado(a) na última vez? |
|  |  |  | 00 | - |
|  |  |  | 01 a 30 | Dias |
|  |  |  | 88 | Morador ainda está internado |
|  |  |  |  | Não aplicável |
| J041 | 258 | 1 |  | O estabelecimento de saúde em que _____ esteve internado(a) pela última vez nos últimos 12 meses era: |
|  |  |  | 1 | Público |
|  |  |  | 2 | Privado |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| J042 | 259 | 1 |  | A última internação de _____  nos últimos 12 meses foi coberta por algum plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| J043 | 260 | 1 |  | ____ pagou algum valor por esta última internação? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| J044 | 261 | 1 |  | Esta última internação de _____ foi feita através do Sistema Único de Saúde (SUS)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| J045 | 262 | 1 |  | Na última vez que _____ foi internado(a), como foi o atendimento recebido? |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| J046 | 263 | 1 |  | Nos últimos 12 meses, _____ teve atendimento de emergência no domicílio? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| J047 | 264 | 1 |  | Este atendimento foi coberto por algum plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| J048 | 265 | 1 |  | _____ pagou algum valor por este atendimento? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| J049 | 266 | 1 |  | Este atendimento foi feito por através do Sistema Único de Saúde (SUS)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| J050 | 267 | 1 |  | Na última vez que _____ teve atendimento de urgência no domicílio, como foi o atendimento recebido? |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| J051 | 268 | 1 |  | Neste atendimento, _____ foi transportado por ambulância para um serviço de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| J052 | 269 | 1 |  | O transporte foi feito por: |
|  |  |  | 1 | SAMU |
|  |  |  | 2 | Ambulância de serviço público de saúde |
|  |  |  | 3 | Ambulância de serviço de saúde privado/plano de saúde |
|  |  |  | 4 | Corpo de Bombeiros |
|  |  |  | 5 | Outro |
|  |  |  |  | Não aplicável |
| J053 | 270 | 1 |  | Nos últimos 12 meses, _____ utilizou alguma prática integrativa e complementar, isto é, tratamento como acupuntura, homeopatia, plantas medicinais e fitoterapia, etc.? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| J054 | 271 | 1 |  | Qual tratamento _________ fez uso? |
|  |  |  | 1 | Acupuntura |
|  |  |  | 2 | Homeopatia |
|  |  |  | 3 | Plantas medicinais e fitoterapia |
|  |  |  | 4 | Outro |
|  |  |  |  | Não aplicável |
| J055 | 272 | 1 |  | Este tratamento foi coberto por algum plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| J056 | 273 | 1 |  | _____ pagou algum valor por este tratamento? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| J057 | 274 | 1 |  | Este tratamento foi feito através do Sistema Único de Saúde (SUS)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| J058 | 275 | 1 |  | _____  já teve dengue? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| J059 | 276 | 1 |  | O diagnóstico foi dado por médico? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| J060 | 277 | 1 |  | O informante desta parte foi: |
|  |  |  | 1 | A própria pessoa |
|  |  |  | 2 | Outro morador |
|  |  |  | 3 | Não morador |
| MÓDULO K – SAÚDE DOS INDIVÍDUOS COM 60 ANOS OU MAIS E COBERTURA DE MAMOGRAFIA ENTRE MULHERES DE 50 ANOS E MAIS |  |  |  |  |
| K001 | 278 | 1 |  | Em geral, que grau de dificuldade _____ tem para comer sozinho(a) com um prato colocado à sua frente, incluindo segurar um garfo, cortar alimentos e beber em um copo? |
|  |  |  | 1 | Não consegue |
|  |  |  | 2 | Tem grande dificuldade |
|  |  |  | 3 | Tem pequena dificuldade |
|  |  |  | 4 | Não tem dificuldade |
|  |  |  |  | Não aplicável |
| K002 | 279 | 1 |  | _______ recebe alguma ajuda para comer? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, porque não precisa |
|  |  |  | 3 | Não, porque não tem ajuda |
|  |  |  |  | Não aplicável |
| K003 | 280 | 1 |  | Quem presta ajuda a __________  para comer? |
|  |  |  | 1 | Familiar que reside no domicílio e é remunerado para ajudar |
|  |  |  | 2 | Familiar que reside no domicílio e não é remunerado para ajudar |
|  |  |  | 3 | Familiar que não reside no domicílio e é remunerado para ajudar |
|  |  |  | 4 | Familiar que não reside no domicílio e não é remunerado para ajudar |
|  |  |  | 5 | Outra pessoa não familiar que não é remunerada para ajudar |
|  |  |  | 6 | Cuidador contratado |
|  |  |  | 7 | Empregada doméstica |
|  |  |  |  | Não aplicável |
| K004 | 281 | 1 |  | Em geral, que grau de dificuldade ____ tem para tomar banho sozinho(a) incluindo entrar e sair do chuveiro ou banheira? |
|  |  |  | 1 | Não consegue |
|  |  |  | 2 | Tem grande dificuldade |
|  |  |  | 3 | Tem pequena dificuldade |
|  |  |  | 4 | Não tem dificuldade |
|  |  |  |  | Não aplicável |
| K005 | 282 | 1 |  | _____ recebe alguma ajuda para tomar banho? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, porque não precisa |
|  |  |  | 3 | Não, porque não tem ajuda |
|  |  |  |  | Não aplicável |
| K006 | 283 | 1 |  | Quem presta ajuda a _____ para tomar banho? |
|  |  |  | 1 | Familiar que reside no domicílio e é remunerado para ajudar |
|  |  |  | 2 | Familiar que reside no domicílio e não é remunerado para ajudar |
|  |  |  | 3 | Familiar que não reside no domicílio e é remunerado para ajudar |
|  |  |  | 4 | Familiar que não reside no domicílio e não é remunerado para ajudar |
|  |  |  | 5 | Outra pessoa não familiar que não é remunerada para ajudar |
|  |  |  | 6 | Cuidador contratado |
|  |  |  | 7 | Empregada doméstica |
|  |  |  |  | Não aplicável |
| K007 | 284 | 1 |  | Em geral, que grau de dificuldade ______ tem para ir ao banheiro sozinho(a) incluindo sentar e levantar do vaso sanitário? |
|  |  |  | 1 | Não consegue |
|  |  |  | 2 | Tem grande dificuldade |
|  |  |  | 3 | Tem pequena dificuldade |
|  |  |  | 4 | Não tem dificuldade |
|  |  |  |  | Não aplicável |
| K008 | 285 | 1 |  | ______ recebe alguma ajuda para ir ao banheiro? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, porque não precisa |
|  |  |  | 3 | Não, porque não tem ajuda |
|  |  |  |  | Não aplicável |
| K009 | 286 | 1 |  | Quem presta ajuda a ______ para ir ao banheiro? |
|  |  |  | 1 | Familiar que reside no domicílio e é remunerado para ajudar |
|  |  |  | 2 | Familiar que reside no domicílio e não é remunerado para ajudar |
|  |  |  | 3 | Familiar que não reside no domicílio e é remunerado para ajudar |
|  |  |  | 4 | Familiar que não reside no domicílio e não é remunerado para ajudar |
|  |  |  | 5 | Outra pessoa não familiar que não é remunerada para ajudar |
|  |  |  | 6 | Cuidador contratado |
|  |  |  | 7 | Empregada doméstica |
|  |  |  |  | Não aplicável |
| K010 | 287 | 1 |  | Em geral, que grau de dificuldade _______ tem para se vestir sozinho(a), incluindo calçar meias e sapatos, fechar o zíper, e fechar e abrir botões? |
|  |  |  | 1 | Não consegue |
|  |  |  | 2 | Tem grande dificuldade |
|  |  |  | 3 | Tem pequena dificuldade |
|  |  |  | 4 | Não tem dificuldade |
|  |  |  |  | Não aplicável |
| K011 | 288 | 1 |  | _______ recebe alguma ajuda para se vestir? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, porque não precisa |
|  |  |  | 3 | Não, porque não tem ajuda |
|  |  |  |  | Não aplicável |
| K012 | 289 | 1 |  | Quem presta ajuda a _______ para se vestir? |
|  |  |  | 1 | Familiar que reside no domicílio e é remunerado para ajudar |
|  |  |  | 2 | Familiar que reside no domicílio e não é remunerado para ajudar |
|  |  |  | 3 | Familiar que não reside no domicílio e é remunerado para ajudar |
|  |  |  | 4 | Familiar que não reside no domicílio e não é remunerado para ajudar |
|  |  |  | 5 | Outra pessoa não familiar que não é remunerada para ajudar |
|  |  |  | 6 | Cuidador contratado |
|  |  |  | 7 | Empregada doméstica |
|  |  |  |  | Não aplicável |
| K013 | 290 | 1 |  | Em geral, que grau de dificuldade _______ tem para andar em casa sozinho(a) de um cômodo a outro da casa, em um mesmo andar, como do quarto para a sala e cozinha? |
|  |  |  | 1 | Não consegue |
|  |  |  | 2 | Tem grande dificuldade |
|  |  |  | 3 | Tem pequena dificuldade |
|  |  |  | 4 | Não tem dificuldade |
|  |  |  |  | Não aplicável |
| K014 | 291 | 1 |  | _______ recebe alguma ajuda para andar em casa? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, porque não precisa |
|  |  |  | 3 | Não, porque não tem ajuda |
|  |  |  |  | Não aplicável |
| K015 | 292 | 1 |  | Quem presta ajuda a _______para andar em casa? |
|  |  |  | 1 | Familiar que reside no domicílio e é remunerado para ajudar |
|  |  |  | 2 | Familiar que reside no domicílio e não é remunerado para ajudar |
|  |  |  | 3 | Familiar que não reside no domicílio e é remunerado para ajudar |
|  |  |  | 4 | Familiar que não reside no domicílio e não é remunerado para ajudar |
|  |  |  | 5 | Outra pessoa não familiar que não é remunerada para ajudar |
|  |  |  | 6 | Cuidador contratado |
|  |  |  | 7 | Empregada doméstica |
|  |  |  |  | Não aplicável |
| K016 | 293 | 1 |  | Em geral, que grau de dificuldade _______ tem para deitar ou levantar da cama sozinho(a)? |
|  |  |  | 1 | Não consegue |
|  |  |  | 2 | Tem grande dificuldade |
|  |  |  | 3 | Tem pequena dificuldade |
|  |  |  | 4 | Não tem dificuldade |
|  |  |  |  | Não aplicável |
| K017 | 294 | 1 |  | _______ recebe alguma ajuda para deitar ou levantar da cama? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, porque não precisa |
|  |  |  | 3 | Não, porque não tem ajuda |
|  |  |  |  | Não aplicável |
| K018 | 295 | 1 |  | Quem presta ajuda a __________ para deitar ou levantar da cama? |
|  |  |  | 1 | Familiar que reside no domicílio e é remunerado para ajudar |
|  |  |  | 2 | Familiar que reside no domicílio e não é remunerado para ajudar |
|  |  |  | 3 | Familiar que não reside no domicílio e é remunerado para ajudar |
|  |  |  | 4 | Familiar que não reside no domicílio e não é remunerado para ajudar |
|  |  |  | 5 | Outra pessoa não familiar que não é remunerada para ajudar |
|  |  |  | 6 | Cuidador contratado |
|  |  |  | 7 | Empregada doméstica |
|  |  |  |  | Não aplicável |
| K019 | 296 | 1 |  | Em geral, que grau de dificuldade _______ tem para sentar ou levantar da cadeira sozinho? |
|  |  |  | 1 | Não consegue |
|  |  |  | 2 | Tem grande dificuldade |
|  |  |  | 3 | Tem pequena dificuldade |
|  |  |  | 4 | Não tem dificuldade |
|  |  |  |  | Não aplicável |
| K020 | 297 | 1 |  | _______ recebe alguma ajuda para sentar ou levantar da cadeira? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, porque não precisa |
|  |  |  | 3 | Não, porque não tem ajuda |
|  |  |  |  | Não aplicável |
| K021 | 298 | 1 |  | Quem presta ajuda a _______ para sentar ou levantar da cadeira? |
|  |  |  | 1 | Familiar que reside no domicílio e é remunerado para ajudar |
|  |  |  | 2 | Familiar que reside no domicílio e não é remunerado para ajudar |
|  |  |  | 3 | Familiar que não reside no domicílio e é remunerado para ajudar |
|  |  |  | 4 | Familiar que não reside no domicílio e não é remunerado para ajudar |
|  |  |  | 5 | Outra pessoa não familiar que não é remunerada para ajudar |
|  |  |  | 6 | Cuidador contratado |
|  |  |  | 7 | Empregada doméstica |
|  |  |  |  | Não aplicável |
| K022 | 299 | 1 |  | Em geral, que grau de dificuldade _______ tem para fazer compras sozinho(a), por exemplo de alimentos, roupas ou medicamentos? |
|  |  |  | 1 | Não consegue |
|  |  |  | 2 | Tem grande dificuldade |
|  |  |  | 3 | Tem pequena dificuldade |
|  |  |  | 4 | Não tem dificuldade |
|  |  |  |  | Não aplicável |
| K023 | 300 | 1 |  | _______ recebe alguma ajuda para fazer compras? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, porque não precisa |
|  |  |  | 3 | Não, porque não tem ajuda |
|  |  |  |  | Não aplicável |
| K024 | 301 | 1 |  | Quem presta ajuda a _______ para fazer compras? |
|  |  |  | 1 | Familiar que reside no domicílio e é remunerado para ajudar |
|  |  |  | 2 | Familiar que reside no domicílio e não é remunerado para ajudar |
|  |  |  | 3 | Familiar que não reside no domicílio e é remunerado para ajudar |
|  |  |  | 4 | Familiar que não reside no domicílio e não é remunerado para ajudar |
|  |  |  | 5 | Outra pessoa não familiar que não é remunerada para ajudar |
|  |  |  | 6 | Cuidador contratado |
|  |  |  | 7 | Empregada doméstica |
|  |  |  |  | Não aplicável |
| K025 | 302 | 1 |  | Em geral, que grau de dificuldade _______ tem para administrar as finanças sozinho(a) (cuidar do seu próprio dinheiro)? |
|  |  |  | 1 | Não consegue |
|  |  |  | 2 | Tem grande dificuldade |
|  |  |  | 3 | Tem pequena dificuldade |
|  |  |  | 4 | Não tem dificuldade |
|  |  |  |  | Não aplicável |
| K026 | 303 | 1 |  | _______ recebe alguma ajuda para administrar as finanças? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, porque não precisa |
|  |  |  | 3 | Não, porque não tem ajuda |
|  |  |  |  | Não aplicável |
| K027 | 304 | 1 |  | Quem presta ajuda a ______ para administrar as finanças? |
|  |  |  | 1 | Familiar que reside no domicílio e é remunerado para ajudar |
|  |  |  | 2 | Familiar que reside no domicílio e não é remunerado para ajudar |
|  |  |  | 3 | Familiar que não reside no domicílio e é remunerado para ajudar |
|  |  |  | 4 | Familiar que não reside no domicílio e não é remunerado para ajudar |
|  |  |  | 5 | Outra pessoa não familiar que não é remunerada para ajudar |
|  |  |  | 6 | Cuidador contratado |
|  |  |  | 7 | Empregada doméstica |
|  |  |  |  | Não aplicável |
| K028 | 305 | 1 |  | Em geral, que grau de dificuldade _______ tem para tomar os remédios sozinho(a)? |
|  |  |  | 1 | Não consegue |
|  |  |  | 2 | Tem grande dificuldade |
|  |  |  | 3 | Tem pequena dificuldade |
|  |  |  | 4 | Não tem dificuldade |
|  |  |  | 5 | Não faz uso de medicamentos |
|  |  |  |  | Não aplicável |
| K029 | 306 | 1 |  | _______ recebe alguma ajuda para tomar os remédios? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, porque não precisa |
|  |  |  | 3 | Não, porque não tem ajuda |
|  |  |  |  | Não aplicável |
| K030 | 307 | 1 |  | Quem presta ajuda a _________ para tomar os remédios? |
|  |  |  | 1 | Familiar que reside no domicílio e é remunerado para ajudar |
|  |  |  | 2 | Familiar que reside no domicílio e não é remunerado para ajudar |
|  |  |  | 3 | Familiar que não reside no domicílio e é remunerado para ajudar |
|  |  |  | 4 | Familiar que não reside no domicílio e não é remunerado para ajudar |
|  |  |  | 5 | Outra pessoa não familiar que não é remunerada para ajudar |
|  |  |  | 6 | Cuidador contratado |
|  |  |  | 7 | Empregada doméstica |
|  |  |  |  | Não aplicável |
| K031 | 308 | 1 |  | Em geral, que grau de dificuldade _______ tem para ir ao médico sozinho(a)? |
|  |  |  | 1 | Não consegue |
|  |  |  | 2 | Tem grande dificuldade |
|  |  |  | 3 | Tem pequena dificuldade |
|  |  |  | 4 | Não tem dificuldade |
|  |  |  |  | Não aplicável |
| K032 | 309 | 1 |  | _______ recebe alguma ajuda para ir ao médico? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, porque não precisa |
|  |  |  | 3 | Não, porque não tem ajuda |
|  |  |  |  | Não aplicável |
| K033 | 310 | 1 |  | Quem presta ajuda a ______ para ir ao médico? |
|  |  |  | 1 | Familiar que reside no domicílio e é remunerado para ajudar |
|  |  |  | 2 | Familiar que reside no domicílio e não é remunerado para ajudar |
|  |  |  | 3 | Familiar que não reside no domicílio e é remunerado para ajudar |
|  |  |  | 4 | Familiar que não reside no domicílio e não é remunerado para ajudar |
|  |  |  | 5 | Outra pessoa não familiar que não é remunerada para ajudar |
|  |  |  | 6 | Cuidador contratado |
|  |  |  | 7 | Empregada doméstica |
|  |  |  |  | Não aplicável |
| K034 | 311 | 1 |  | Em geral, que grau de dificuldade _______ tem para sair sozinho(a) utilizando um transporte como ônibus, metrô, táxi, carro, etc.? |
|  |  |  | 1 | Não consegue |
|  |  |  | 2 | Tem grande dificuldade |
|  |  |  | 3 | Tem pequena dificuldade |
|  |  |  | 4 | Não tem dificuldade |
|  |  |  |  | Não aplicável |
| K035 | 312 | 1 |  | _______ recebe alguma ajuda para sair? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, porque não precisa |
|  |  |  | 3 | Não, porque não tem ajuda |
|  |  |  |  | Não aplicável |
| K036 | 313 | 1 |  | Quem presta ajuda a _________ para sair? |
|  |  |  | 1 | Familiar que reside no domicílio e é remunerado para ajudar |
|  |  |  | 2 | Familiar que reside no domicílio e não é remunerado para ajudar |
|  |  |  | 3 | Familiar que não reside no domicílio e é remunerado para ajudar |
|  |  |  | 4 | Familiar que não reside no domicílio e não é remunerado para ajudar |
|  |  |  | 5 | Outra pessoa não familiar que não é remunerada para ajudar |
|  |  |  | 6 | Cuidador contratado |
|  |  |  | 7 | Empregada doméstica |
|  |  |  |  | Não aplicável |
| K039 | 314 | 1 |  | _______ participa de atividades sociais organizadas (clubes, grupos comunitários ou religiosos, centros de convivência do idosos, etc.)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| K040 | 315 | 1 |  | Quando foi a última vez que _____ fez um exame de mamografia? |
|  |  |  | 1 | Menos de 1 ano atrás |
|  |  |  | 2 | De 1 ano a menos de 2 anos |
|  |  |  | 3 | De 2 anos a menos de 3 anos |
|  |  |  | 4 | 3 anos ou mais atrás |
|  |  |  | 5 | Nunca fez |
|  |  |  |  | Não aplicável |
| K041 | 316 | 1 |  | A última mamografia foi coberta por algum plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| K042 | 317 | 1 |  | _____  pagou algum valor pela última mamografia? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| K043 | 318 | 1 |  | A última mamografia foi feita através do Sistema Único de Saúde (SUS)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| K044 | 319 | 1 |  | Quando foi a última vez que _________ fez exame de vista por profissional de saúde? |
|  |  |  | 1 | Há menos de 6 meses |
|  |  |  | 2 | Entre 6 meses e menos de 1 ano |
|  |  |  | 3 | Entre 1 ano e menos de 2 anos |
|  |  |  | 4 | Entre 2 e 3 anos atrás |
|  |  |  | 5 | Mais de 3 anos atrás |
|  |  |  | 6 | Nunca fez |
|  |  |  |  | Não aplicável |
| K045 | 320 | 1 |  | Algum médico já deu a _________ diagnóstico de catarata em uma ou em ambas as vistas? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| K046 | 321 | 1 |  | Houve indicação para realização de cirurgia nos olhos para retirar a catarata? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| K047 | 322 | 1 |  | _______ fez a cirurgia? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| K048 | 323 | 1 |  | Qual o principal motivo do(a) _______ não ter feito a cirurgia de catarata? |
|  |  |  | 1 | Está marcada, mas ainda não fez |
|  |  |  | 2 | Não achou necessário |
|  |  |  | 3 | Não conseguiu vaga |
|  |  |  | 4 | Estava com dificuldades financeiras |
|  |  |  | 5 | O serviço de saúde era muito distante |
|  |  |  | 6 | O plano de saúde não cobria a cirurgia |
|  |  |  | 7 | Não sabia onde realizar a cirurgia |
|  |  |  | 8 | Não tinha quem o(a) acompanhasse |
|  |  |  | 9 | Outro |
|  |  |  |  | Não aplicável |
| K049 | 324 | 1 |  | A cirurgia de _____ foi coberta pelo plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| K050 | 325 | 1 |  | _______ pagou algum valor pela cirurgia? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| K051 | 326 | 1 |  | A cirurgia foi feita através do Sistema Único de Saúde (SUS)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| K052 | 327 | 1 |  | Nos últimos 12 meses, _______ tomou vacina contra gripe? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| K053 | 328 | 2 |  | Qual o principal motivo por não ter tomado a vacina contra gripe? |
|  |  |  | 01 | Raramente fica gripado(a) |
|  |  |  | 02 | Não sabia que era necessário tomar vacina contra gripe |
|  |  |  | 03 | Não sabia onde tomar a vacina |
|  |  |  | 04 | Tem medo da reação |
|  |  |  | 05 | Tem medo de injeção |
|  |  |  | 06 | Não tinha quem o(a) acompanhasse ao serviço de saúde |
|  |  |  | 07 | Estava com dificuldades financeiras |
|  |  |  | 08 | Teve dificuldades de transporte |
|  |  |  | 09 | O serviço de saúde era muito distante |
|  |  |  | 10 | A vacina não estava disponível no serviço que procurou |
|  |  |  | 11 | Contra-indicação médica |
|  |  |  | 12 | Não acredita que a vacina protege contra gripe |
|  |  |  | 13 | Outro |
|  |  |  |  | Não aplicável |
| K054 | 330 | 1 |  | Nos últimos 12 meses, _______ teve alguma queda que o(a) levou a procurar o serviço de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| K055 | 331 | 1 |  | Na ocasião dessas quedas nos últimos 12 meses, _______ fraturou quadril ou fêmur? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| K056 | 332 | 1 |  | Fez cirurgia por causa dessa fratura? |
|  |  |  | 1 | Sim, sem colocação de prótese |
|  |  |  | 2 | Sim, com colocação de prótese |
|  |  |  | 3 | Não |
|  |  |  |  | Não aplicável |
| K057 | 333 | 1 |  | A cirurgia foi coberta pelo plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| K058 | 334 | 1 |  | _______ pagou algum valor pela cirurgia? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| K059 | 335 | 1 |  | A cirurgia foi feita através do Sistema Único de Saúde (SUS)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| K06001 | 336 | 2 |  | Quantas horas ______ esperou desde a hora que chegou ao hospital até a realização da cirurgia? |
|  |  |  | 00 | Nenhuma |
|  |  |  | 01 a 23 | Horas |
|  |  |  |  | Não aplicável |
| K06002 | 338 | 2 |  | Quantos dias ______ esperou desde a hora que chegou ao hospital até a realização da cirurgia? |
|  |  |  | 00 | Nenhum |
|  |  |  | 01 a 31 | Dias |
|  |  |  |  | Não aplicável |
| K06003 | 340 | 2 |  | Quantos meses ______ esperou desde a hora que chegou ao hospital até a realização da cirurgia? |
|  |  |  | 00 | Nenhum |
|  |  |  | 01 a 99 | Meses |
|  |  |  |  | Não aplicável |
| K06101 | 342 | 2 |  | Por quantos dias _______ ficou internado(a) por causa dessa cirurgia? |
|  |  |  | 00 | Nenhum |
|  |  |  | 01 a 31 | Dias |
|  |  |  |  | Não aplicável |
| K06102 | 344 | 2 |  | Por quantos meses _______ ficou internado(a) por causa dessa cirurgia? |
|  |  |  | 00 | Nenhum |
|  |  |  | 01 a 99 | Meses |
|  |  |  |  | Não aplicável |
| K062 | 346 | 1 |  | O informante desta parte foi: |
|  |  |  | 1 | A própria pessoa |
|  |  |  | 2 | Outro morador |
|  |  |  | 3 | Não morador |
|  |  |  |  | Não aplicável |
| MÓDULO L – CRIANÇAS COM MENOS DE 2 ANOS |  |  |  |  |
| L00201 | 347 | 2 |  | Com quantos dias de vida [nome] recebeu a primeira consulta médica depois da alta da maternidade? |
|  |  |  | 00 a 30 | Dias |
|  |  |  | 00 | Nunca recebeu (para os casos onde L00201=00, L00202=00 e L00203=00). |
|  |  |  |  | Não aplicável |
| L00202 | 349 | 2 |  | Com quantos meses de vida [nome] recebeu a primeira consulta médica depois da alta da maternidade? |
|  |  |  | 00 a 11 | Meses |
|  |  |  | 00 | Nunca recebeu (para os casos onde L00201=00, L00202=00 e L00203=00). |
|  |  |  |  | Não aplicável |
| L00203 | 351 | 2 |  | Com quantos anos de vida [nome] recebeu a primeira consulta médica depois da alta da maternidade? |
|  |  |  | 00 a 01 | Ano |
|  |  |  | 00 | Nunca recebeu (para os casos onde L00201=00, L00202=00 e L00203=00). |
|  |  |  |  | Não aplicável |
| L003 | 353 | 2 |  | Onde foi realizada a primeira consulta médica ou de enfermagem? |
|  |  |  | 01 | Unidade básica de saúde (posto ou centro de saúde ou unidade de saúde da família) |
|  |  |  | 02 | Centro de Especialidades, Policlínica pública ou PAM – Posto de Assistência Médica |
|  |  |  | 03 | UPA (Unidade de Pronto Atendimento) |
|  |  |  | 04 | Outro tipo de Pronto Atendimento Público (24 horas) |
|  |  |  | 05 | Pronto-socorro ou emergência de hospital público |
|  |  |  | 06 | Hospital público/ambulatório |
|  |  |  | 07 | Consultório particular ou Clínica privada |
|  |  |  | 08 | Ambulatório ou consultório de empresa ou sindicato |
|  |  |  | 09 | Pronto-atendimento ou emergência de hospital privado |
|  |  |  | 10 | Visita domiciliar de médico particular |
|  |  |  | 11 | Visita domiciliar da equipe de saúde da família |
|  |  |  | 12 | Outro |
|  |  |  |  | Não aplicável |
| L004 | 355 | 1 |  | Onde é realizado o acompanhamento do crescimento e desenvolvimento de [nome]? |
|  |  |  | 1 | Unidade de saúde pública (posto ou centro de saúde ou unidade de saúde da família) |
|  |  |  | 2 | Centro de Especialidades, Policlínica pública ou PAM – Posto de Assistência Médica |
|  |  |  | 3 | Hospital público/ambulatório |
|  |  |  | 4 | Consultório particular ou Clínica privada |
|  |  |  | 5 | Ambulatório ou consultório de empresa ou sindicato |
|  |  |  | 6 | Outro |
|  |  |  | 7 | Não faz acompanhamento |
|  |  |  |  | Não aplicável |
| L005 | 356 | 1 |  | Foi realizado o teste do pezinho? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| L006 | 357 | 1 |  | Quando foi realizado o teste do pezinho? |
|  |  |  | 1 | Na primeira semana de vida |
|  |  |  | 2 | Após a primeira semana e antes do primeiro mês de vida |
|  |  |  | 3 | Após o primeiro mês de vida |
|  |  |  | 4 | Não sabe |
|  |  |  |  | Não aplicável |
| L007 | 358 | 1 |  | Quando tempo depois da realização do exame, a sra recebeu o resultado do teste do pezinho? |
|  |  |  | 1 | Em 15 dias ou menos |
|  |  |  | 2 | Entre 16 dias e menos de 1 mês |
|  |  |  | 3 | Entre 1 mês e menos de 2 meses |
|  |  |  | 4 | Entre 2 meses e menos de 3 meses |
|  |  |  | 5 | Há 3 meses ou mais |
|  |  |  | 6 | Não recebeu |
|  |  |  |  | Não aplicável |
| L008 | 359 | 1 |  | Foi realizado o teste da orelhinha? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| L009 | 360 | 1 |  | Quando foi realizado o teste da orelhinha? |
|  |  |  | 1 | Na primeira semana de vida |
|  |  |  | 2 | Após a primeira semana e antes do primeiro mês de vida |
|  |  |  | 3 | Após o primeiro mês de vida |
|  |  |  | 4 | Não sabe |
|  |  |  |  | Não aplicável |
| L010 | 361 | 1 |  | Quanto tempo depois da realização do exame, a sra recebeu o resultado do teste da orelhinha? |
|  |  |  | 1 | Em 15 dias ou menos |
|  |  |  | 2 | Entre 16 dias e menos de 1 mês |
|  |  |  | 3 | Entre 1 mês e menos de 2 meses |
|  |  |  | 4 | Entre 2 meses e menos de 3 meses |
|  |  |  | 5 | Há 3 meses ou mais |
|  |  |  | 6 | Não recebeu |
|  |  |  |  | Não aplicável |
| L011 | 362 | 1 |  | Foi realizado o teste do olhinho? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| L012 | 363 | 1 |  | Quando foi realizado o teste do olhinho? |
|  |  |  | 1 | Na primeira semana de vida |
|  |  |  | 2 | Após a primeira semana e antes do primeiro mês de vida |
|  |  |  | 3 | Após o primeiro mês de vida |
|  |  |  | 4 | Não sabe |
|  |  |  |  | Não aplicável |
| L013 | 364 | 1 |  | Quanto tempo depois da realização do exame, a sra recebeu o resultado do teste do olhinho? |
|  |  |  | 1 | Em 15 dias ou menos |
|  |  |  | 2 | Entre 16 dias e menos de 1 mês |
|  |  |  | 3 | Entre 1 mês e menos de 2 meses |
|  |  |  | 4 | Entre 2 meses e menos de 3 meses |
|  |  |  | 5 | Há 3 meses ou mais |
|  |  |  | 6 | Não recebeu |
|  |  |  |  | Não aplicável |
| L014 | 365 | 1 |  | [Nome] já tomou alguma vacina? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L015 | 366 | 1 |  | A sra tem a caderneta ou cartão de  [nome] no qual as vacinas são anotadas? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01613 | 367 | 2 |  | Dia da 1ª dose da Vacina Tetravalente (DPT + Hib) |
|  |  |  | 00 | Não tomou |
|  |  |  | 01 a 31 | Dia |
|  |  |  |  | Não aplicável |
| L01614 | 369 | 2 |  | Mês da 1ª dose da Vacina Tetravalente (DPT + Hib) |
|  |  |  | 00 | Não tomou |
|  |  |  | 01 a 12 | Mês |
|  |  |  |  | Não aplicável |
| L01615 | 371 | 4 |  | Ano da 1ª dose da Vacina Tetravalente (DPT + Hib) |
|  |  |  | 0000 | Não tomou |
|  |  |  | 2011 a 2013 | Ano |
|  |  |  |  | Não aplicável |
| L01616 | 375 | 2 |  | Dia da 2ª dose da Vacina Tetravalente (DPT + Hib) |
|  |  |  | 00 | Não tomou |
|  |  |  | 01 a 31 | Dia |
|  |  |  |  | Não aplicável |
| L01617 | 377 | 2 |  | Mês da 2ª dose da Vacina Tetravalente (DPT + Hib) |
|  |  |  | 00 | Não tomou |
|  |  |  | 01 a 12 | Mês |
|  |  |  |  | Não aplicável |
| L01618 | 379 | 4 |  | Ano da 2ª dose da Vacina Tetravalente (DPT + Hib) |
|  |  |  | 0000 | Não tomou |
|  |  |  | 2011 a 2014 | Ano |
|  |  |  |  | Não aplicável |
| L01619 | 383 | 2 |  | Dia da 3ª dose da Vacina Tetravalente (DPT + Hib) |
|  |  |  | 00 | Não tomou |
|  |  |  | 01 a 31 | Dia |
|  |  |  |  | Não aplicável |
| L01620 | 385 | 2 |  | Mês da 3ª dose da Vacina Tetravalente (DPT + Hib) |
|  |  |  | 00 | Não tomou |
|  |  |  | 01 a 12 | Mês |
|  |  |  |  | Não aplicável |
| L01621 | 387 | 4 |  | Ano da 3ª dose da Vacina Tetravalente (DPT + Hib) |
|  |  |  | 0000 | Não tomou |
|  |  |  | 2011 a 2014 | Ano |
|  |  |  |  | Não aplicável |
| L01622 | 391 | 2 |  | Dia da dose Reforço da Vacina Tetravalente (DPT + Hib) |
|  |  |  | 00 | Não tomou |
|  |  |  | 01 a 31 | Dia |
|  |  |  |  | Não aplicável |
| L01623 | 393 | 2 |  | Mês da dose Reforço da Vacina Tetravalente (DPT + Hib) |
|  |  |  | 00 | Não tomou |
|  |  |  | 01 a 12 | Mês |
|  |  |  |  | Não aplicável |
| L01624 | 395 | 4 |  | Ano da dose Reforço da Vacina Tetravalente (DPT + Hib) |
|  |  |  | 0000 | Não tomou |
|  |  |  | 2011 a 2014 | Ano |
|  |  |  |  | Não aplicável |
| L01701 | 399 | 1 |  | Você pode me dizer se [nome] tomou leite de peito desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01702 | 400 | 1 |  | Você pode me dizer se [nome] tomou outro leite ou derivados de leite desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01703 | 401 | 1 |  | Você pode me dizer se [nome] tomou água desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01704 | 402 | 1 |  | Você pode me dizer se [nome] tomou chá desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01705 | 403 | 1 |  | Você pode me dizer se [nome] tomou mingau desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01706 | 404 | 1 |  | Você pode me dizer se [nome] comeu frutas ou tomou suco natural de frutas desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01707 | 405 | 1 |  | Você pode me dizer se [nome] tomou sucos artificiais desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01708 | 406 | 1 |  | Você pode me dizer se [nome] comeu verduras/legumes desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01709 | 407 | 1 |  | Você pode me dizer se [nome] comeu feijão ou outras leguminosas (lentilha, ervilha, etc) desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01710 | 408 | 1 |  | Você pode me dizer se [nome] comeu carnes ou ovos desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01711 | 409 | 1 |  | Você pode me dizer se [nome] comeu batata e outros tubérculos e raízes (batata doce, mandioca) desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01712 | 410 | 1 |  | Você pode me dizer se [nome] comeu cereias e derivados (arroz, pão, cereal, macarrão, farinha, etc) desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01713 | 411 | 1 |  | Você pode me dizer se [nome] comeu biscoitos ou bolachas ou bolo desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01714 | 412 | 1 |  | Você pode me dizer se [nome] comeu doces, balas, ou outros alimentos com açúcar desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01715 | 413 | 1 |  | Você pode me dizer se [nome] tomou refrigerantes desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L01716 | 414 | 1 |  | Você pode me dizer se [nome] comeu ou bebeu outros alimentos desde ontem de manhã até hoje de manhã? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| L018 | 415 | 1 |  | Desde que [nome] nasceu, tomou ou comeu outro alimento que não leite de peito? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, somente leite de peito |
|  |  |  |  | Não aplicável |
| L019 | 416 | 1 |  | Alguma vez [nome] recebeu Sulfato Ferroso? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Recebeu um composto vitamínico, mas não sabe se contém Sulfato Ferroso |
|  |  |  |  | Não aplicável |
| L020 | 417 | 1 |  | O informante desta parte foi: |
|  |  |  | 1 | Mãe ou responsável |
|  |  |  | 2 | Outro morador |
|  |  |  | 3 | Não morador |
|  |  |  |  | Não aplicável |
| MÓDULO M – INFORMAÇÕES PARA FUTUROS CONTATOS, CARACTERÍSTICAS DO TRABALHO E APOIO SOCIAL |  |  |  |  |
| M001 | 418 | 1 |  | Tipo de entrevista do adulto selecionado |
|  |  |  | 1 | Realizada |
|  |  |  | 2 | Recusa |
|  |  |  | 3 | Morador não encontrado |
|  |  |  |  | Não aplicável |
| M002 | 419 | 1 |  | Identificação da mãe do morador selecionado |
|  |  |  | 1 | Mãe moradora |
|  |  |  | 2 | Mãe não moradora |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| M003 | 420 | 1 |  | O informante dessa parte foi? |
|  |  |  | 1 | O próprio selecionado |
|  |  |  | 2 | Outro morador do domicílio |
|  |  |  | 3 | Outra pessoa não moradora |
|  |  |  |  | Não aplicável |
| M005 | 421 | 1 |  | Em algum dos seus trabalhos, o(a) Sr(a) trabalha em horário noturno? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| M006 | 422 | 1 |  | Com que frequência o(a) Sr(a) trabalha em horário noturno em algum dos seus trabalhos? |
|  |  |  | 1 | Menos de 1 vez por mês |
|  |  |  | 2 | 1 a 3 vezes por mês |
|  |  |  | 3 | 1 vez por semana |
|  |  |  | 4 | 2 a 3 vezes por semana |
|  |  |  | 5 | 4 vezes por semana |
|  |  |  | 6 | 5 vezes ou mais por semana |
|  |  |  |  | Não aplicável |
| M007 | 423 | 1 |  | Em algum dos seus trabalhos, o(a) Sr(a) trabalha em regime de turnos ininterruptos, isto é, por 24 horas seguidas? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| M008 | 424 | 1 |  | Com que frequência o(a) Sr(a) trabalha por 24 horas seguidas? |
|  |  |  | 1 | Menos de 1 vez por mês |
|  |  |  | 2 | 1 a 3 vezes por mês |
|  |  |  | 3 | 1 vez por semana |
|  |  |  | 4 | 2 a 3 vezes por semana |
|  |  |  | 5 | 4 vezes por semana |
|  |  |  | 6 | 5 vezes ou mais por semana |
|  |  |  |  | Não aplicável |
| M009 | 425 | 1 |  | O(a) Sr(a) normalmente trabalha em ambientes: |
|  |  |  | 1 | Fechado |
|  |  |  | 2 | Aberto |
|  |  |  | 3 | Ambos |
|  |  |  |  | Não aplicável |
| M010 | 426 | 1 |  | Pensando em todos os seus trabalhos, durante os últimos 30 dias, alguém fumou em algum ambiente fechado onde o(a) Sr(a) trabalha? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| M01101 | 427 | 1 |  | Pensando em todos os seus trabalhos, o(a) Sr(a) está exposto(a) a manuseio de substâncias químicas que podem afetar a sua saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| M01102 | 428 | 1 |  | Pensando em todos os seus trabalhos, o(a) Sr(a) está em exposição a ruído (barulho intenso) que pode afetar a sua saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| M01103 | 429 | 1 |  | Pensando em todos os seus trabalhos, o(a) Sr(a) está em exposição longa ao sol que pode afetar a sua saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| M01104 | 430 | 1 |  | Pensando em todos os seus trabalhos, o(a) Sr(a) está  exposto(a) a manuseio de material radioativo (transporte, recebimento, armazenagem, trabalho com raio-x) que pode afetar a sua saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| M01105 | 431 | 1 |  | Pensando em todos os seus trabalhos, o(a) Sr(a) está  exposto(a) a manuseio de resíduos urbanos (lixo) que podem afetar a sua saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| M01106 | 432 | 1 |  | Pensando em todos os seus trabalhos, o(a) Sr(a) está envolvido(a) em atividades que levam ao nervosismo que podem afetar a sua saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| M01107 | 433 | 1 |  | Pensando em todos os seus trabalhos, o(a) Sr(a) está em exposição a material biológico (sangue, agulhas, secreções) que podem afetar a sua saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| M01108 | 434 | 1 |  | Pensando em todos os seus trabalhos, o(a) Sr(a) está em exposição a poeira industrial (pó de mármore) que podem afetar a sua saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| M01301 | 435 | 2 |  | Há quantos anos o(a) Sr(a) está no trabalho principal? |
|  |  |  | 00 | - |
|  |  |  | 01 a 80 | Anos |
|  |  |  |  | Não aplicável |
| M01302 | 437 | 2 |  | Há quantos meses o(a) Sr(a) está no trabalho principal? |
|  |  |  | 00 | - |
|  |  |  | 01 a 11 | Meses |
|  |  |  |  | Não aplicável |
| M01303 | 439 | 2 |  | Há quantos dia o(a) Sr(a) está no trabalho principal? |
|  |  |  | 00 | - |
|  |  |  | 01 a 30 | Dias |
|  |  |  |  | Não aplicável |
| M014 | 441 | 2 |  | Com quantos familiares ou parentes o(a) Sr(a) se sente à vontade e pode falar sobre quase tudo? |
|  |  |  | 00 | Nenhum |
|  |  |  | 01 a 98 | Pessoas |
|  |  |  |  | Não aplicável |
| M015 | 443 | 2 |  | Com quantos amigos o(a) Sr(a) se sente à vontade e pode falar sobre quase tudo? (sem considerar os familiares ou parentes) |
|  |  |  | 00 | Nenhum |
|  |  |  | 01 a 98 | Pessoas |
|  |  |  |  | Não aplicável |
| M016 | 445 | 1 |  | Nos últimos 12 meses, com que frequência o(a) Sr(a) participou de atividades esportivas ou artísticas em grupo? |
|  |  |  | 1 | Mais de uma vez por semana |
|  |  |  | 2 | Uma vez por semana |
|  |  |  | 3 | De 2 a 3 vezes por mês |
|  |  |  | 4 | Algumas vezes no ano |
|  |  |  | 5 | Uma vez no ano |
|  |  |  | 6 | Nenhuma vez |
|  |  |  |  | Não aplicável |
| M017 | 446 | 1 |  | Nos últimos 12 meses, com que frequência o(a) Sr(a) participou de reuniões de associações de moradores ou funcionários, movimentos comunitários, centros acadêmicos ou similares? |
|  |  |  | 1 | Mais de uma vez por semana |
|  |  |  | 2 | Uma vez por semana |
|  |  |  | 3 | De 2 a 3 vezes por mês |
|  |  |  | 4 | Algumas vezes no ano |
|  |  |  | 5 | Uma vez no ano |
|  |  |  | 6 | Nenhuma vez |
|  |  |  |  | Não aplicável |
| M018 | 447 | 1 |  | Nos últimos 12 meses, com que frequência o(a) Sr(a) participou de trabalho voluntário não remunerado? |
|  |  |  | 1 | Mais de uma vez por semana |
|  |  |  | 2 | Uma vez por semana |
|  |  |  | 3 | De 2 a 3 vezes por mês |
|  |  |  | 4 | Algumas vezes no ano |
|  |  |  | 5 | Uma vez no ano |
|  |  |  | 6 | Nenhuma vez |
|  |  |  |  | Não aplicável |
| M019 | 448 | 1 |  | Nos últimos 12 meses, com que frequência o(a) Sr(a) compareceu a cultos ou atividades da sua religião ou de outra religião? (sem contar com situações como casamento, batizado, ou enterro) |
|  |  |  | 1 | Mais de uma vez por semana |
|  |  |  | 2 | Uma vez por semana |
|  |  |  | 3 | De 2 a 3 vezes por mês |
|  |  |  | 4 | Algumas vezes no ano |
|  |  |  | 5 | Uma vez no ano |
|  |  |  | 6 | Nenhuma vez |
|  |  |  |  | Não aplicável |
| MÓDULO N – PERCEPÇÃO DO ESTADO DE SAÚDE |  |  |  |  |
| N001 | 449 | 1 |  | Em geral, como o(a) Sr(a) avalia a sua saúde? |
|  |  |  | 1 | Muito boa |
|  |  |  | 2 | Boa |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| N002 | 450 | 1 |  | O(a) sr(a) usa algum recurso como bengala, muleta, cadeira de rodas, andador ou outro equipamento para auxiliar a locomoção? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| N003 | 451 | 1 |  | Em geral, que grau de dificuldade o(a) sr(a) tem para se locomover? |
|  |  |  | 1 | Nenhum |
|  |  |  | 2 | Leve |
|  |  |  | 3 | Médio |
|  |  |  | 4 | Intenso |
|  |  |  | 5 | Não consegue |
|  |  |  |  | Não aplicável |
| N004 | 452 | 1 |  | Quando o(a) Sr(a) sobe uma ladeira, um lance de escadas ou caminha rápido no plano, sente dor ou desconforto no peito? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não se aplica/Morador selecionado não anda |
|  |  |  |  | Não aplicável |
| N005 | 453 | 1 |  | Quando o(a) Sr(a) caminha em lugar plano, em velocidade normal, sente dor ou desconforto no peito? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| N006 | 454 | 1 |  | O que o(a) sr(a) faz se sente dor ou desconforto no peito? |
|  |  |  | 1 | Para ou diminui a velocidade |
|  |  |  | 2 | Continua após tomar um remédio que dissolve na boca para aliviar a dor |
|  |  |  | 3 | Continua caminhando |
|  |  |  |  | Não aplicável |
| N007 | 455 | 1 |  | Se o(a) Sr(a) parar, o que acontece com a dor ou desconforto no peito? |
|  |  |  | 1 | É aliviada em 10 minutos ou menos |
|  |  |  | 2 | É aliviada em mais de 10 minutos |
|  |  |  | 3 | Não é aliviada |
|  |  |  |  | Não aplicável |
| N008 | 456 | 1 |  | O(a) Sr(a) pode me mostrar onde o(a) Sr(a) geralmente sente essa dor/desconforto no peito? |
|  |  |  | 1 | Acima ou no meio do peito (posição a) |
|  |  |  | 2 | Abaixo do peito (b) |
|  |  |  | 3 | Braço esquerdo (c) |
|  |  |  | 4 | Outro |
|  |  |  |  | Não aplicável |
| N010 | 457 | 1 |  | Nas duas últimas semanas, com que frequência o(a) Sr(a) teve problemas no sono, como dificuldade para adormecer, acordar frequentemente à noite ou dormir mais do que de costume? |
|  |  |  | 1 | Nenhum dia |
|  |  |  | 2 | Menos da metade dos dias |
|  |  |  | 3 | Mais da metade dos dias |
|  |  |  | 4 | Quase todos os dias |
|  |  |  |  | Não aplicável |
| N011 | 458 | 1 |  | Nas duas últimas semanas, com que frequência o(a) Sr(a) teve problemas por não se sentir descansado(a) e disposto(a) durante o dia, sentindo-se cansado(a), sem ter energia? |
|  |  |  | 1 | Nenhum dia |
|  |  |  | 2 | Menos da metade dos dias |
|  |  |  | 3 | Mais da metade dos dias |
|  |  |  | 4 | Quase todos os dias |
|  |  |  |  | Não aplicável |
| N012 | 459 | 1 |  | Nas duas últimas semanas, com que frequência o(a) Sr(a) se sentiu incomodado por ter pouco interesse ou não sentiu prazer em fazer as coisas? |
|  |  |  | 1 | Nenhum dia |
|  |  |  | 2 | Menos da metade dos dias |
|  |  |  | 3 | Mais da metade dos dias |
|  |  |  | 4 | Quase todos os dias |
|  |  |  |  | Não aplicável |
| N013 | 460 | 1 |  | Nas duas últimas semanas, com que frequência o(a) Sr(a) teve problemas para se concentrar nas suas atividades habituais? |
|  |  |  | 1 | Nenhum dia |
|  |  |  | 2 | Menos da metade dos dias |
|  |  |  | 3 | Mais da metade dos dias |
|  |  |  | 4 | Quase todos os dias |
|  |  |  |  | Não aplicável |
| N014 | 461 | 1 |  | Nas duas últimas semanas, com que frequência o(a) Sr(a) teve problemas na alimentação, como ter falta de apetite ou comer muito mais do que de costume? |
|  |  |  | 1 | Nenhum dia |
|  |  |  | 2 | Menos da metade dos dias |
|  |  |  | 3 | Mais da metade dos dias |
|  |  |  | 4 | Quase todos os dias |
|  |  |  |  | Não aplicável |
| N015 | 462 | 1 |  | Nas duas últimas semanas, com que frequência o(a) sr(a) teve lentidão para se movimentar ou falar, ou ao contrário, ficou muito agitado(a) ou inquieto(a)? |
|  |  |  | 1 | Nenhum dia |
|  |  |  | 2 | Menos da metade dos dias |
|  |  |  | 3 | Mais da metade dos dias |
|  |  |  | 4 | Quase todos os dias |
|  |  |  |  | Não aplicável |
| N016 | 463 | 1 |  | Nas duas últimas semanas, com que frequência o(a) Sr(a) se sentiu deprimido(a), “pra baixo” ou sem perspectiva? |
|  |  |  | 1 | Nenhum dia |
|  |  |  | 2 | Menos da metade dos dias |
|  |  |  | 3 | Mais da metade dos dias |
|  |  |  | 4 | Quase todos os dias |
|  |  |  |  | Não aplicável |
| N017 | 464 | 1 |  | Nas duas últimas semanas, com que frequência o(a) Sr(a) se sentiu mal consigo mesmo, se achando um fracasso ou achando que decepcionou sua família? |
|  |  |  | 1 | Nenhum dia |
|  |  |  | 2 | Menos da metade dos dias |
|  |  |  | 3 | Mais da metade dos dias |
|  |  |  | 4 | Quase todos os dias |
|  |  |  |  | Não aplicável |
| N018 | 465 | 1 |  | Nas duas últimas semanas, com que frequência o(a) Sr(a) pensou em se ferir de alguma maneira ou achou que seria melhor estar morto? |
|  |  |  | 1 | Nenhum dia |
|  |  |  | 2 | Menos da metade dos dias |
|  |  |  | 3 | Mais da metade dos dias |
|  |  |  | 4 | Quase todos os dias |
|  |  |  |  | Não aplicável |
| N019 | 466 | 1 |  | O(a) Sr(a) faz uso de aparelho auditivo? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| N020 | 467 | 1 |  | Em geral, que grau de dificuldade o(a) Sr(a) tem para ouvir? |
|  |  |  | 1 | Nenhum |
|  |  |  | 2 | Leve |
|  |  |  | 3 | Médio |
|  |  |  | 4 | Intenso |
|  |  |  | 5 | Não consegue |
|  |  |  |  | Não aplicável |
| N021 | 468 | 1 |  | O(a) Sr(a) usa algum tipo de recurso (como óculos, lentes de contato, lupa, etc.) para auxiliar a enxergar? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| N022 | 469 | 1 |  | Em geral, que grau de dificuldade o(a) Sr(a) tem para ver de longe? (reconhecer uma pessoa conhecida do outro lado da rua a uma distância de mais ou menos 20 metros) |
|  |  |  | 1 | Nenhum |
|  |  |  | 2 | Leve |
|  |  |  | 3 | Médio |
|  |  |  | 4 | Intenso |
|  |  |  | 5 | Não consegue |
|  |  |  |  | Não aplicável |
| N023 | 470 | 1 |  | Em geral, que grau de dificuldade _____ tem para ver de perto? (reconhecer um objeto que esteja ao alcance das mãos ou ao ler) |
|  |  |  | 1 | Nenhum |
|  |  |  | 2 | Leve |
|  |  |  | 3 | Médio |
|  |  |  | 4 | Intenso |
|  |  |  | 5 | Não consegue |
|  |  |  |  | Não aplicável |
| MÓDULO O – ACIDENTES E VIOLÊNCIAS |  |  |  |  |
| O001 | 471 | 1 |  | O(a) Sr(a) dirige carro? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O002 | 472 | 1 |  | O(a) Sr(a) dirige motocicleta? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O003 | 473 | 1 |  | Com que frequência o(a) Sr(a) anda de carro/automóvel, van ou táxi? |
|  |  |  | 1 | Sempre |
|  |  |  | 2 | Quase sempre |
|  |  |  | 3 | Às vezes |
|  |  |  | 4 | Raramente |
|  |  |  | 5 | Nunca |
|  |  |  |  | Não aplicável |
| O004 | 474 | 1 |  | Com que frequência o(a) Sr(a) usa cinto de segurança quando dirige ou anda como passageiro no banco da frente de carro/ automóvel, van ou táxi? |
|  |  |  | 1 | Nunca anda no banco da frente |
|  |  |  | 2 | Sempre usa cinto |
|  |  |  | 3 | Quase sempre usa cinto |
|  |  |  | 4 | Às vezes usa cinto |
|  |  |  | 5 | Raramente usa cinto |
|  |  |  | 6 | Nunca usa cinto |
|  |  |  |  | Não aplicável |
| O005 | 475 | 1 |  | Com que frequência o(a) Sr(a) usa cinto de segurança quando anda no banco de trás de carro/automóvel, van ou táxi? |
|  |  |  | 1 | Nunca anda no banco de trás |
|  |  |  | 2 | Sempre usa cinto |
|  |  |  | 3 | Quase sempre usa cinto |
|  |  |  | 4 | Às vezes usa cinto |
|  |  |  | 5 | Raramente usa cinto |
|  |  |  | 6 | Nunca usa cinto |
|  |  |  |  | Não aplicável |
| O006 | 476 | 1 |  | Com que frequência o(a) Sr(a) anda de motocicleta? |
|  |  |  | 1 | Sempre |
|  |  |  | 2 | Quase sempre |
|  |  |  | 3 | Às vezes |
|  |  |  | 4 | Raramente |
|  |  |  | 5 | Nunca |
|  |  |  |  | Não aplicável |
| O007 | 477 | 1 |  | Com que frequência o(a) Sr(a) usa capacete quando dirige motocicleta? |
|  |  |  | 1 | Sempre usa capacete |
|  |  |  | 2 | Quase sempre usa capacete |
|  |  |  | 3 | Às vezes usa capacete |
|  |  |  | 4 | Raramente usa capacete |
|  |  |  | 5 | Nunca usa capacete |
|  |  |  |  | Não aplicável |
| O008 | 478 | 1 |  | Com que frequência o(a) Sr(a) usa capacete quando anda como passageiro de motocicleta? |
|  |  |  | 1 | Nunca anda como passageiro de motocicleta |
|  |  |  | 2 | Sempre usa capacete |
|  |  |  | 3 | Quase sempre usa capacete |
|  |  |  | 4 | Às vezes usa capacete |
|  |  |  | 5 | Raramente usa capacete |
|  |  |  | 6 | Nunca usa capacete |
|  |  |  |  | Não aplicável |
| O009 | 479 | 1 |  | Nos últimos 12 meses, o(a) Sr(a) se envolveu em algum acidente de trânsito no qual tenha sofrido lesões corporais (ferimentos)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O00901 | 480 | 2 |  | Se sim, quantos? |
|  |  |  | 01 a 99 | Não |
|  |  |  |  | Não aplicável |
| O010 | 482 | 1 |  | Algum desses acidentes de trânsito ocorreu quando o(a) Sr(a) estava trabalhando, indo ou voltando do trabalho? |
|  |  |  | 1 | Sim, quando estava trabalhando |
|  |  |  | 2 | Sim, quando estava indo ou voltando do trabalho |
|  |  |  | 3 | Não |
|  |  |  |  | Não aplicável |
| O011 | 483 | 2 |  | Durante o acidente de trânsito mais grave ocorrido nos últimos 12 meses, o(a) Sr(a) era: |
|  |  |  | 01 | Condutor(a) de carro/van |
|  |  |  | 02 | Condutor(a) de ônibus |
|  |  |  | 03 | Condutor(a) de caminhão |
|  |  |  | 04 | Condutor(a) de motocicleta |
|  |  |  | 05 | Condutor(a) de bicicleta |
|  |  |  | 06 | Passageiro(a) de carro/van |
|  |  |  | 07 | Passageiro(a) de ônibus |
|  |  |  | 08 | Passageiro(a) de caminhão |
|  |  |  | 09 | Passageiro(a) de motocicleta |
|  |  |  | 10 | Passageiro(a) de bicicleta |
|  |  |  | 11 | Pedestre |
|  |  |  | 12 | Outro |
|  |  |  |  | Não aplicável |
| O012 | 485 | 1 |  | Para este acidente que o(a) Sr(a) considerou mais grave, o acidente envolveu transporte de carga perigosa, como gasolina, diesel, álcool, ácidos ou produtos químicos em geral? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O013 | 486 | 1 |  | O acidente resultou em derramamento de carga? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O014 | 487 | 1 |  | Para este acidente que considerou mais grave, o(a) Sr(a) deixou de realizar quaisquer de suas atividades habituais (trabalhar, realizar afazeres domésticos, ir à escola etc.)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O015 | 488 | 1 |  | Para este acidente que considerou mais grave, o(a) Sr(a) recebeu algum tipo de assistência de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O016 | 489 | 2 |  | Onde o(a) Sr(a) recebeu a primeira assistência de saúde? |
|  |  |  | 01 | No local do acidente |
|  |  |  | 02 | Unidade básica de saúde (posto ou centro de saúde ou unidade de saúde da família) |
|  |  |  | 03 | Centro de Especialidades, Policlínica pública ou PAM – Posto de Assistência Médica |
|  |  |  | 04 | UPA (Unidade de Pronto Atendimento) |
|  |  |  | 05 | Outro tipo de Pronto Atendimento Público (24 horas) |
|  |  |  | 06 | Pronto-socorro ou emergência de hospital público |
|  |  |  | 07 | Hospital público/ambulatório |
|  |  |  | 08 | Consultório particular ou Clínica privada |
|  |  |  | 09 | Ambulatório ou consultório de empresa ou sindicato |
|  |  |  | 10 | Pronto-atendimento ou emergência de hospital privado |
|  |  |  | 11 | No domicílio, com médico particular |
|  |  |  | 12 | No domicílio, com médico da equipe de saúde da família |
|  |  |  | 13 | Outro |
|  |  |  |  | Não aplicável |
| O017 | 491 | 1 |  | Quem lhe prestou atendimento no local do acidente? |
|  |  |  | 1 | Ambulância/ Resgate do SAMU |
|  |  |  | 2 | Ambulância/ Resgate dos Bombeiros |
|  |  |  | 3 | Motos do SAMU |
|  |  |  | 4 | Ambulância/ Resgate do setor privado (particular ou convênio) |
|  |  |  | 5 | Ambulância/ Resgate da concessionária da rodovia |
|  |  |  | 6 | Outro |
|  |  |  |  | Não aplicável |
| O01801 | 492 | 2 |  | Em quantas horas, após o acidente, o(a) Sr(a) recebeu o primeiro atendimento de saúde? |
|  |  |  | 00 | - |
|  |  |  | 01 a 99 | Horas |
|  |  |  |  | Não aplicável |
| O01802 | 494 | 2 |  | Em quantos minutos, após o acidente, o(a) Sr(a) recebeu o primeiro atendimento de saúde? |
|  |  |  | 00 | - |
|  |  |  | 01 a 59 | Minutos |
|  |  |  |  | Não aplicável |
| O019 | 496 | 1 |  | Por causa deste acidente de trânsito, o(a) Sr(a) precisou ser internado por 24 horas ou mais? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O020 | 497 | 1 |  | O Sr(a) teve ou tem alguma sequela e/ou incapacidade decorrente deste acidente de trânsito? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O021 | 498 | 1 |  | Nos últimos 12 meses o(a) Sr(a) se envolveu em algum acidente de trabalho (sem considerar os acidentes de trânsito)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não se aplica / Pessoas que não trabalharam nos últimos 12 meses. |
|  |  |  |  | Não aplicável |
| O02101 | 499 | 2 |  | Se sim, quantos? |
|  |  |  | 01 a 99 | Acidentes |
|  |  |  |  | Não aplicável |
| O022 | 501 | 1 |  | Para o acidente de trabalho que considerou mais grave, o(a) Sr(a) deixou de realizar quaisquer de suas atividades habituais (trabalhar, realizar afazeres domésticos, ir à escola, etc.)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O023 | 502 | 1 |  | Por causa deste acidente de trabalho, o(a) Sr(a) precisou ser internado por 24 horas ou mais? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O024 | 503 | 1 |  | O(a) Sr(a) teve ou tem alguma sequela e/ou incapacidade decorrente deste acidente de trabalho? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O025 | 504 | 1 |  | Nos últimos 12 meses, o(a) Sr(a) sofreu alguma violência ou agressão de pessoa desconhecida (como bandido, policial, assaltante etc.)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O027 | 505 | 1 |  | Pensando na violência mais grave que o(a) Sr(a) sofreu de pessoa desconhecida nos últimos 12 meses, que tipo de violência o(a) Sr(a) sofreu? |
|  |  |  | 1 | Física |
|  |  |  | 2 | Sexual |
|  |  |  | 3 | Psicológica |
|  |  |  | 4 | Outro |
|  |  |  |  | Não aplicável |
| O028 | 506 | 1 |  | Pensando na violência mais grave que o(a) Sr(a) sofreu de pessoa desconhecida nos últimos 12 meses, como (a) sr(a) foi ameaçado(a) ou ferido(a)? |
|  |  |  | 1 | Com arma de fogo (revólver, escopeta, pistola) |
|  |  |  | 2 | Com objeto pérfuro-cortante (faca, navalha, punhal, tesoura) |
|  |  |  | 3 | Com objeto contundente (pau, cassetete, barra de ferro, pedra) |
|  |  |  | 4 | Com força corporal, espancamento (tapa, murro, empurrão) |
|  |  |  | 5 | Por meio de palavras ofensivas, xingamentos ou palavrões |
|  |  |  | 6 | Outro |
|  |  |  |  | Não aplicável |
| O029 | 507 | 1 |  | Onde ocorreu essa violência? |
|  |  |  | 1 | Residência |
|  |  |  | 2 | Trabalho |
|  |  |  | 3 | Escola/Faculdade ou similar |
|  |  |  | 4 | Bar ou similar |
|  |  |  | 5 | Via pública |
|  |  |  | 6 | Banco/Caixa eletrônico/Lotérica |
|  |  |  | 7 | Outro |
|  |  |  |  | Não aplicável |
| O030 | 508 | 1 |  | Nesta ocorrência, a violência foi cometida por: |
|  |  |  | 1 | Bandido, ladrão ou assaltante |
|  |  |  | 2 | Agente legal público (policial/agente da lei) |
|  |  |  | 3 | Outro |
|  |  |  |  | Não aplicável |
| O031 | 509 | 1 |  | Por causa dessa violência, o(a) Sr(a) deixou de realizar quaisquer de suas atividades habituais (trabalhar, realizar afazeres domésticos, ir à escola, etc.)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O032 | 510 | 1 |  | O(a) Sr(a) teve alguma lesão corporal ou ferimento provocado por essa violência? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O033 | 511 | 1 |  | Por causa desta violência, o(a) Sr(a) recebeu algum tipo de assistência de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O034 | 512 | 2 |  | Onde foi prestada a primeira assistência de saúde? |
|  |  |  | 01 | No local da violência |
|  |  |  | 02 | Unidade básica de saúde (posto ou centro de saúde ou unidade de saúde da família) |
|  |  |  | 03 | Centro de Especialidades, Policlínica pública ou PAM Posto de Assistência Médica |
|  |  |  | 04 | UPA (Unidade de Pronto Atendimento) |
|  |  |  | 05 | Outro tipo de Pronto Atendimento Público (24 horas) |
|  |  |  | 06 | Pronto-socorro ou emergência de hospital público |
|  |  |  | 07 | Hospital público/ambulatório |
|  |  |  | 08 | Consultório particular ou Clínica privada |
|  |  |  | 09 | Ambulatório ou consultório de empresa ou sindicato |
|  |  |  | 10 | Pronto-atendimento ou emergência de hospital privado |
|  |  |  | 11 | No domicílio, com médico particular |
|  |  |  | 12 | No domicílio, com médico da equipe de saúde da família |
|  |  |  | 13 | Outro |
|  |  |  |  | Não aplicável |
| O035 | 514 | 1 |  | Por causa desta violência, o(a) Sr(a) precisou ser internado por 24 horas ou mais? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O036 | 515 | 1 |  | O(a) Sr(a) teve ou tem alguma sequela e/ou incapacidade decorrente desta violência? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O037 | 516 | 1 |  | Nos últimos 12 meses, o(a) Sr(a) sofreu alguma violência ou agressão de pessoa conhecida (como pai, mãe, filho(a), cônjuge, parceiro(a), namorado(a), amigo(a), vizinho(a))? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O038 | 517 | 1 |  | Nos últimos 12 meses, com que frequência sofreu alguma violência de pessoa conhecida? |
|  |  |  | 1 | Uma vez |
|  |  |  | 2 | Duas vezes |
|  |  |  | 3 | De três a seis vezes |
|  |  |  | 4 | De sete a menos de 12 vezes |
|  |  |  | 5 | Pelo menos uma vez por mês |
|  |  |  | 6 | Pelo menos uma vez por semana |
|  |  |  | 7 | Quase diariamente |
|  |  |  |  | Não aplicável |
| O039 | 518 | 1 |  | Pensando na violência mais grave que o(a) Sr(a) sofreu de pessoa conhecida nos últimos 12 meses, que tipo de violência o(a) Sr(a) sofreu? |
|  |  |  | 1 | Física |
|  |  |  | 2 | Sexual |
|  |  |  | 3 | Psicológica |
|  |  |  | 4 | Outra |
|  |  |  |  | Não aplicável |
| O040 | 519 | 1 |  | Pensando na violência mais grave que o(a) Sr(a) sofreu de pessoa conhecida nos últimos 12 meses, como o(a) Sr(a) foi ameaçado(a) ou ferido(a)? |
|  |  |  | 1 | Com força corporal/espancamento (tapa, murro, beliscão, empurrão) |
|  |  |  | 2 | Com arma de fogo (revólver, escopeta, pistola) |
|  |  |  | 3 | Com objeto pérfuro-cortante (faca, navalha, punhal, tesoura) |
|  |  |  | 4 | Com objeto contundente (pau, cassetete, barra de ferro, pedra) |
|  |  |  | 5 | Com arremesso de substância/objeto quente |
|  |  |  | 6 | Com lançamento de objetos |
|  |  |  | 7 | Com envenenamento |
|  |  |  | 8 | Por meio de palavras ofensivas, xingamentos ou palavrões |
|  |  |  | 9 | Outro |
|  |  |  |  | Não aplicável |
| O041 | 520 | 1 |  | Onde ocorreu esta violência? |
|  |  |  | 1 | Residência |
|  |  |  | 2 | Trabalho |
|  |  |  | 3 | Escola / Faculdade ou similar |
|  |  |  | 4 | Bar ou similar |
|  |  |  | 5 | Via pública |
|  |  |  | 6 | Outro |
|  |  |  |  | Não aplicável |
| O042 | 521 | 2 |  | Nesta ocorrência, a violência foi cometida por: |
|  |  |  | 01 | Cônjuge, companheiro(a), namorado(a) |
|  |  |  | 02 | Ex-cônjuge, ex-companheiro(a), ex-namorado(a) |
|  |  |  | 03 | Pai/Mãe |
|  |  |  | 04 | Padrasto/Madrasta |
|  |  |  | 05 | Filho(a) |
|  |  |  | 06 | Irmão(ã) |
|  |  |  | 07 | Outro parente |
|  |  |  | 08 | Amigos(as)/colegas |
|  |  |  | 09 | Patrão/chefe |
|  |  |  | 10 | Outra pessoa conhecida |
|  |  |  |  | Não aplicável |
| O043 | 523 | 1 |  | Nos últimos 12 meses, o(a) Sr(a) deixou de realizar quaisquer de suas atividades habituais (trabalhar, realizar afazeres domésticos, ir à escola etc.) por causa desta violência? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O044 | 524 | 1 |  | O(a) Sr(a) teve alguma lesão corporal ou ferimento provocado por essa violência? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O045 | 525 | 1 |  | Por causa desta violência, o(a) Sr(a) buscou algum tipo de assistência de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O046 | 526 | 2 |  | Onde foi prestada a assistência de saúde? |
|  |  |  | 01 | No local da agressão |
|  |  |  | 02 | Unidade básica de saúde (posto ou centro de saúde ou unidade de saúde da família) |
|  |  |  | 03 | Centro de Especialidades, Policlínica pública ou PAM Posto de Assistência Médica |
|  |  |  | 04 | UPA (Unidade de Pronto Atendimento) |
|  |  |  | 05 | Outro tipo de Pronto Atendimento Público (24 horas) |
|  |  |  | 06 | Pronto-socorro ou emergência de hospital público |
|  |  |  | 07 | Hospital público/ambulatório |
|  |  |  | 08 | Consultório particular ou Clínica privada |
|  |  |  | 09 | Ambulatório ou consultório de empresa ou sindicato |
|  |  |  | 10 | Pronto-atendimento ou emergência de hospital privado |
|  |  |  | 11 | No domicílio, com médico particular |
|  |  |  | 12 | No domicílio, com médico da equipe de saúde da família |
|  |  |  | 13 | Outro |
|  |  |  |  | Não aplicável |
| O047 | 528 | 1 |  | Por causa desta violência, o(a) Sr(a) precisou ser internado por 24 horas ou mais? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| O048 | 529 | 1 |  | O(a) Sr(a) teve ou tem alguma sequela e/ou incapacidade decorrente desta violência? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| MÓDULO P – ESTILOS DE VIDA |  |  |  |  |
| P001 | 530 | 1 |  | O(a) Sr(a) sabe seu peso? (mesmo que seja valor aproximado) |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não sabe |
|  |  |  |  | Não aplicável |
| P00101 | 531 | 3 |  | Se sim, qual o peso (kg)? |
| P002 | 534 | 1 |  | Quanto tempo faz que o(a) Sr(a) se pesou da última vez? |
|  |  |  | 1 | Menos de 1 semana |
|  |  |  | 2 | Entre 1 semana e menos de 1 mês |
|  |  |  | 3 | Entre 1 mês a menos de 3 meses |
|  |  |  | 4 | Entre 3 meses e menos de 6 meses |
|  |  |  | 5 | Há 6 meses ou mais |
|  |  |  | 6 | Nunca se pesou |
|  |  |  |  | Não aplicável |
| P003 | 535 | 1 |  | O(a) Sr(a) lembra qual seu peso aproximado por volta dos 20 anos de idade? (somente para pessoas com 30 anos ou mais) |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não lembra / Não sabe |
|  |  |  |  | Não aplicável |
| P00301 | 536 | 3 |  | Se sim, qual o peso (kg)? |
| P004 | 539 | 1 |  | O(a) Sr(a) sabe sua altura? (mesmo que seja valor aproximado) |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não sabe |
|  |  |  |  | Não aplicável |
| P00401 | 540 | 3 |  | Especifique a altura em cm (P004) |
| P005 | 543 | 1 |  | A Sra está grávida no momento? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| P006 | 544 | 1 |  | Em quantos dias da semana o(a) costuma comer feijão? (0 =  Nunca ou menos de uma vez por semana) |
| P007 | 545 | 1 |  | Em quantos dias da semana, o(a) Sr(a) costuma comer salada de alface e tomate ou salada de qualquer outra verdura ou legume cru? (0 =  Nunca ou menos de uma vez por semana) |
| P008 | 546 | 1 |  | Em geral, quantas vezes por dia o(a) Sr(a) come este tipo de salada? |
|  |  |  | 1 | 1 vez por dia (no almoço ou no jantar) |
|  |  |  | 2 | 2 vezes por dia (no almoço e no jantar) |
|  |  |  | 3 | 3 vezes ou mais por dia |
|  |  |  |  | Não aplicável |
| P009 | 547 | 1 |  | Em quantos dias da semana, o(a) Sr(a) costuma comer verdura ou legume cozido, como couve, cenoura, chuchu, berinjela, abobrinha? (sem contar batata, mandioca ou inhame) (0 = Nunca ou menos de uma vez por semana) |
| P010 | 548 | 1 |  | Em geral, quantas vezes por dia o(a) Sr(a) come verdura ou legume cozido? |
|  |  |  | 1 | 1 vez por dia (no almoço ou no jantar) |
|  |  |  | 2 | 2 vezes por dia (no almoço e no jantar) |
|  |  |  | 3 | 3 vezes ou mais por dia |
|  |  |  |  | Não aplicável |
| P011 | 549 | 1 |  | Em quantos dias da semana o(a) Sr(a) costuma comer carne vermelha (boi, porco, cabrito)? (0 = Nunca ou menos de uma vez por semana) |
| P012 | 550 | 1 |  | Quando o(a) Sr(a) come carne vermelha, o(a) Sr(a)costuma: |
|  |  |  | 1 | Tirar o excesso de gordura visível |
|  |  |  | 2 | Comer com a gordura |
|  |  |  |  | Não aplicável |
| P013 | 551 | 1 |  | Em quantos dias da semana o(a) Sr(a) costuma comer frango/galinha? (0 = Nunca ou menos de uma vez por semana) |
| P014 | 552 | 1 |  | Quando o(a) Sr(a)come frango/galinha, o(a) Sr(a) costuma: |
|  |  |  | 1 | Tirar a pele |
|  |  |  | 2 | Comer com a pele |
|  |  |  |  | Não aplicável |
| P015 | 553 | 1 |  | Em quantos dias da semana o(a) Sr(a) costuma comer peixe? (0 = Nunca ou menos de uma vez por semana) |
| P016 | 554 | 1 |  | Em quantos dias da semana o(a) Sr(a) costuma tomar suco de frutas natural? (0 = Nunca ou menos de uma vez por semana) |
| P017 | 555 | 1 |  | Em geral, quantos copos por dia o(a) Sr(a) toma de suco de frutas natural? |
|  |  |  | 1 | 1 copo |
|  |  |  | 2 | 2 copos |
|  |  |  | 3 | 3 copos ou mais |
|  |  |  |  | Não aplicável |
| P018 | 556 | 1 |  | Em quantos dias da semana o(a) Sr(a) costuma comer frutas? (0 = Nunca ou menos de uma vez por semana) |
| P019 | 557 | 1 |  | Em geral, quantas vezes por dia o(a) Sr(a) come frutas? |
|  |  |  | 1 | 1 vez por dia |
|  |  |  | 2 | 2 vezes por dia |
|  |  |  | 3 | 3 vezes ou mais por dia |
|  |  |  |  | Não aplicável |
| P020 | 558 | 1 |  | Em quantos dias da semana o(a) Sr(a) costuma tomar refrigerante (ou suco artificial)? (0 = Nunca ou menos de uma vez por semana) |
| P021 | 559 | 1 |  | Que tipo de refrigerante ou suco artificial o(a) Sr(a) costuma tomar? |
|  |  |  | 1 | Normal |
|  |  |  | 2 | Diet/Light/Zero |
|  |  |  | 3 | Ambos |
|  |  |  |  | Não aplicável |
| P022 | 560 | 1 |  | Em geral, quantos copos de refrigerante ou suco artificial o(a) Sr(a) costuma tomar por dia? |
|  |  |  | 1 | 1 copo |
|  |  |  | 2 | 2 copos |
|  |  |  | 3 | 3 copos ou mais |
|  |  |  |  | Não aplicável |
| P023 | 561 | 1 |  | Em quantos dias da semana o(a) Sr(a) costuma tomar leite? (não vale leite de soja) (0 = Nunca ou menos de uma vez por semana) |
| P024 | 562 | 1 |  | Quando o(a) Sr(a) toma leite, que tipo de leite costuma tomar? |
|  |  |  | 1 | Integral |
|  |  |  | 2 | Desnatado ou semidesnatado |
|  |  |  | 3 | Os dois tipos |
|  |  |  |  | Não aplicável |
| P025 | 563 | 1 |  | Em quantos dias da semana o(a) Sr(a) come alimentos doces, tais como pedaços de bolo ou torta, doces, chocolates, balas, biscoitos ou bolachas doces? (0 = Nunca ou menos de uma vez por semana) |
| P026 | 564 | 1 |  | Em quantos dias da semana o(a) Sr(a) substitui a refeição do almoço ou jantar por sanduiches, salgados ou pizzas?  (0 = Nunca ou menos de uma vez por semana) |
| P02601 | 565 | 1 |  | Considerando a comida preparada na hora e os alimentos industrializados, o(a) Sr(a) acha que o seu consumo de sal é: |
|  |  |  | 1 | Muito alto |
|  |  |  | 2 | Alto |
|  |  |  | 3 | Adequado |
|  |  |  | 4 | Baixo |
|  |  |  | 5 | Muito baixo |
|  |  |  |  | Não aplicável |
| P027 | 566 | 1 |  | Com que frequência o(a) Sr(a) costuma consumir alguma bebida alcoólica? |
|  |  |  | 1 | Não bebo nunca |
|  |  |  | 2 | Menos de uma vez por mês |
|  |  |  | 3 | Uma vez ou mais por mês |
|  |  |  |  | Não aplicável |
| P028 | 567 | 1 |  | Quantos dias por semana o(a) Sr(a) costuma tomar alguma bebida alcoólica? (0 = Nunca ou menos de uma vez por semana) |
| P029 | 568 | 2 |  | Em geral, no dia que o(a) Sr(a) bebe, quantas doses de bebida alcoólica o(a) Sr(a) consome? (1 dose de bebida alcoólica equivale a 1 lata de cerveja, 1 taça de vinho ou 1 dose de cachaça, whisky ou qualquer outra bebida alcoólica destilada) |
| P030 | 570 | 1 |  | Em algum destes dias em que consumiu bebida alcoólica, o(a) Sr(a) dirigiu logo depois de beber? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| P031 | 571 | 2 |  | Quantos anos o(a) Sr(a) tinha quando começou a consumir bebidas alcoólicas? |
| P032 | 573 | 1 |  | Se homem: Nos últimos 30 dias, o Sr chegou a consumir 5 ou mais doses de bebida alcoólica em uma única ocasião? Ou Se mulher: Nos últimos 30 dias, a Sra chegou a consumir  4 ou mais doses de bebida alcoólica em uma única ocasião? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| P033 | 574 | 1 |  | Em quantos dias do mês isto ocorreu? |
|  |  |  | 1 | 1 dia |
|  |  |  | 2 | 2 dias |
|  |  |  | 3 | 3 dias |
|  |  |  | 4 | 4 dias |
|  |  |  | 5 | 5 dias |
|  |  |  | 6 | 6 dias |
|  |  |  | 7 | 7 ou mais |
|  |  |  |  | Não aplicável |
| P034 | 575 | 1 |  | Nos últimos três meses, o(a) Sr(a) praticou algum tipo de exercício físico ou esporte? (não considere fisioterapia) |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| P035 | 576 | 1 |  | Quantos dias por semana o(a) Sr(a) costuma praticar exercício físico ou  esporte? (0 = Nunca ou menos de uma vez por semana) |
| P036 | 577 | 2 |  | Qual o exercício físico ou esporte que o(a) Sr(a) pratica com mais frequência? |
|  |  |  | 01 | Caminhada (não vale para o trabalho) |
|  |  |  | 02 | Caminhada em esteira |
|  |  |  | 03 | Corrida/cooper |
|  |  |  | 04 | Corrida em esteira |
|  |  |  | 05 | Musculação |
|  |  |  | 06 | Ginástica aeróbica/spinning/step/jump |
|  |  |  | 07 | Hidroginástica |
|  |  |  | 08 | Ginástica em geral/localizada/pilates/alongamento/ioga |
|  |  |  | 09 | Natação |
|  |  |  | 10 | Artes marciais e luta |
|  |  |  | 11 | Bicicleta/ergomética |
|  |  |  | 12 | Futebol |
|  |  |  | 13 | Basquetebol |
|  |  |  | 14 | Voleibol |
|  |  |  | 15 | Tênis |
|  |  |  | 16 | Dança (com o objetivo de praticar atividade física) |
|  |  |  | 17 | Outro |
|  |  |  |  | Não aplicável |
| P03701 | 579 | 2 |  | Em geral, no dia que o(a) Sr(a) pratica exercício ou esporte, quantas horas dura esta atividade? |
| P03702 | 581 | 2 |  | Em geral, no dia que o(a) Sr(a) pratica exercício ou esporte, quantos minutos dura esta atividade? |
| P038 | 583 | 1 |  | No seu trabalho, o(a) Sr(a) anda bastante a pé? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| P039 | 584 | 1 |  | No seu trabalho, o(a) Sr(a) faz faxina pesada, carrega peso ou faz outra atividade pesada que requer esforço físico intenso? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| P03901 | 585 | 1 |  | Em uma semana normal, em quantos dias o(a) Sr(a) faz essas atividades no seu trabalho? |
| P03902 | 586 | 2 |  | Quantas horas o(a) Sr(a) passa realizando atividades físicas pesadas em um dia normal de trabalho? |
| P03903 | 588 | 2 |  | Quantos minutos o(a) Sr(a) passa realizando atividades físicas pesadas em um dia normal de trabalho? |
| P040 | 590 | 1 |  | Para ir ou voltar do trabalho, o(a) Sr(a) faz algum trajeto a pé ou de bicicleta? |
|  |  |  | 1 | Sim, todo o trajeto |
|  |  |  | 2 | Sim, parte do trajeto |
|  |  |  | 3 | Não |
|  |  |  |  | Não aplicável |
| P04101 | 591 | 2 |  | Quantas horas o(a) Sr(a) gasta para percorrer este trajeto a pé ou de bicicleta, considerando a ida e a volta do trabalho? |
| P04102 | 593 | 2 |  | Quantos minutos o(a) Sr(a) gasta para percorrer este trajeto a pé ou de bicicleta, considerando a ida e a volta do trabalho? |
| P042 | 595 | 1 |  | Nas suas atividades habituais (tais como ir, ou levar alguém, a algum curso, escola ou clube), quantos dias por semana o(a) Sr(a) faz alguma atividade que envolva deslocamento a pé ou bicicleta? (0 = Nunca ou menos de uma vez por semana) |
| P04301 | 596 | 2 |  | No dia que o(a) Sr(a) faz esta atividade, quantas horas o(a) Sr(a) gasta no deslocamento a pé ou de   bicicleta, considerando a ida e a volta? |
| P04302 | 598 | 2 |  | No dia que o(a) Sr(a) faz esta atividade, quantos minutos o(a) Sr(a) gasta no deslocamento a pé ou de   bicicleta, considerando a ida e a volta? |
| P044 | 600 | 1 |  | Nas suas atividades domésticas o(a) Sr(a) faz faxina pesada, carrega peso ou faz outra atividade pesada que requer esforço físico intenso? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| P04401 | 601 | 1 |  | Em uma semana normal, nas suas atividades domésticas, em quantos dias o(a) Sr(a) faz faxina pesada ou realiza atividades que requerem esforço físico intenso? |
| P04403 | 602 | 2 |  | Quantas horas por dia gasta realizando essas atividades domésticas pesadas? |
| P04404 | 604 | 2 |  | Quantos minutos por dia gasta realizando essas atividades domésticas pesadas? |
| P045 | 606 | 1 |  | Em média, quantas horas por dia o(a) Sr(a) costuma ficar assistindo televisão? |
|  |  |  | 1 | Menos de 1 hora |
|  |  |  | 2 | Entre 1 horas e menos de 2 horas |
|  |  |  | 3 | Entre 2 horas e menos de 3 horas |
|  |  |  | 4 | Entre 3 horas e menos de 4 horas |
|  |  |  | 5 | Entre 4 horas e menos de 5 horas |
|  |  |  | 6 | Entre 5 horas e menos de 6 horas |
|  |  |  | 7 | 6 horas ou mais |
|  |  |  | 8 | Não assiste televisão |
|  |  |  |  | Não aplicável |
| P046 | 607 | 1 |  | Perto do seu domicílio, existe algum lugar público (praça, parque, rua fechada, praia) para fazer caminhada, realizar exercício ou praticar esporte? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| P047 | 608 | 1 |  | O(a) Sr(a) conhece algum programa público no seu município de estímulo à prática de atividade física? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| P048 | 609 | 1 |  | O(a) Sr(a) participa desse programa? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| P049 | 610 | 1 |  | Qual o principal motivo de não participar? |
|  |  |  | 1 | Não é perto do meu domicílio |
|  |  |  | 2 | Não tenho tempo |
|  |  |  | 3 | Não tenho interesse nas atividades oferecidas |
|  |  |  | 4 | O espaço não é seguro/iluminado |
|  |  |  | 5 | Foi impedido de participar |
|  |  |  | 6 | Problemas de saúde ou incapacidade física |
|  |  |  | 7 | Outro |
|  |  |  |  | Não aplicável |
| P050 | 611 | 1 |  | Atualmente, o(a) Sr(a) fuma algum produto do tabaco? |
|  |  |  | 1 | Sim, diariamente |
|  |  |  | 2 | Sim, menos que diariamente |
|  |  |  | 3 | Não fumo atualmente |
|  |  |  |  | Não aplicável |
| P051 | 612 | 1 |  | E no passado, o(a) Sr(a) fumou algum produto do tabaco diariamente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| P052 | 613 | 1 |  | E no passado, o(a) Sr(a) fumou algum produto do tabaco? |
|  |  |  | 1 | Sim, diariamente |
|  |  |  | 2 | Sim, menos que diariamente |
|  |  |  | 3 | Não, nunca fumei |
|  |  |  |  | Não aplicável |
| P053 | 614 | 2 |  | Que idade o(a) Sr(a) tinha quando começou a fumar cigarro diariamente? (Branco = Não aplicável) |
| P05401 | 616 | 1 |  | Em média, com que frequência o(a) Sr(a) fuma cigarros industrializados? |
|  |  |  | 1 | Um ou mais por dia |
|  |  |  | 2 | Um ou mais por semana |
|  |  |  | 3 | Menos que uma vez por semana |
|  |  |  | 4 | Menos do que um por mês |
|  |  |  | 5 | Não fuma este produto |
|  |  |  |  | Não aplicável |
| P05402 | 617 | 2 |  | Especifique número de cigarros industrializados por dias (P05401)  (Branco = Não aplicável) |
| P05403 | 619 | 2 |  | Especifique número de cigarros industrializados por semanas (P05401)  (Branco = Não aplicável) |
| P05404 | 621 | 1 |  | Em média, com que frequência o(a) Sr(a) fuma cigarros de palha ou enrolados a mão? |
|  |  |  | 1 | Um ou mais por dia |
|  |  |  | 2 | Um ou mais por semana |
|  |  |  | 3 | Menos que uma vez por semana |
|  |  |  | 4 | Menos do que um por mês |
|  |  |  | 5 | Não fuma este produto |
|  |  |  |  | Não aplicável |
| P05405 | 622 | 2 |  | Especifique número cigarros de palha por dia (P05404)  (Branco = Não aplicável) |
| P05406 | 624 | 2 |  | Especifique número cigarros de palha por semana (P05404)  (Branco = Não aplicável) |
| P05407 | 626 | 1 |  | Em média, com que frequência o(a) Sr(a) fuma cigarros cigarros de cravo ou de Bali? |
|  |  |  | 1 | Um ou mais por dia |
|  |  |  | 2 | Um ou mais por semana |
|  |  |  | 3 | Menos que uma vez por semana |
|  |  |  | 4 | Menos do que um por mês |
|  |  |  | 5 | Não fuma este produto |
|  |  |  |  | Não aplicável |
| P05408 | 627 | 2 |  | Especifique número de cigarro de cravo ou de bali por dia (P05407)  (Branco = Não aplicável) |
| P05409 | 629 | 2 |  | Especifique número de cigarro de cravo ou de bali por semana (P05407)  (Branco = Não aplicável) |
| P05410 | 631 | 1 |  | Em média, com que frequência o(a) Sr(a) fuma cachimbos (considere cachimbos cheios)? |
|  |  |  | 1 | Um ou mais por dia |
|  |  |  | 2 | Um ou mais por semana |
|  |  |  | 3 | Menos que uma vez por semana |
|  |  |  | 4 | Menos do que um por mês |
|  |  |  | 5 | Não fuma este produto |
|  |  |  |  | Não aplicável |
| P05411 | 632 | 2 |  | Especifique número de vezes que fumou cachimbo por dia (P05410)  (Branco = Não aplicável) |
| P05412 | 634 | 2 |  | Especifique número de de vezes que fumou cachimbo por semana (P05410)  (Branco = Não aplicável) |
| P05413 | 636 | 1 |  | Em média, com que frequência o(a) Sr(a) fuma charutos ou cigarrilhas? |
|  |  |  | 1 | Um ou mais por dia |
|  |  |  | 2 | Um ou mais por semana |
|  |  |  | 3 | Menos que uma vez por semana |
|  |  |  | 4 | Menos do que um por mês |
|  |  |  | 5 | Não fuma este produto |
|  |  |  |  | Não aplicável |
| P05414 | 637 | 2 |  | Especifique número vezes que fumou charuto ou cigarrilha  por dia (P05413) (Branco = Não aplicável) |
| P05415 | 639 | 2 |  | Especifique número vezes que fumou charuto ou cigarrilha  por semana  (P05413)  (Branco = Não aplicável) |
| P05416 | 641 | 1 |  | Em média, com que frequência o(a) Sr(a) fuma Narguilé (sessões)? |
|  |  |  | 1 | Um ou mais por dia |
|  |  |  | 2 | Um ou mais por semana |
|  |  |  | 3 | Menos que uma vez por semana |
|  |  |  | 4 | Menos do que um por mês |
|  |  |  | 5 | Não fuma este produto |
|  |  |  |  | Não aplicável |
| P05417 | 642 | 2 |  | Especifique número de sessões de narguilé por dia (P05416) (Branco = Não aplicável) |
| P05418 | 644 | 2 |  | Especifique número de sessões de narguilé por semana (P05416)  (Branco = Não aplicável) |
| P05419 | 646 | 1 |  | Em média, com que frequência o(a) Sr(a) fuma outro produto? |
|  |  |  | 1 | Um ou mais por dia |
|  |  |  | 2 | Um ou mais por semana |
|  |  |  | 3 | Menos que uma vez por semana |
|  |  |  | 4 | Menos do que um por mês |
|  |  |  | 5 | Não fuma este produto |
|  |  |  |  | Não aplicável |
| P05421 | 647 | 2 |  | Especifique número de vezes que usou outro produto de tabaco por dia (P05416)  (Branco = Não aplicável) |
| P05422 | 649 | 2 |  | Especifique número de de vezes que usou outro produto de tabaco por semana (P05416)  (Branco = Não aplicável) |
| P055 | 651 | 1 |  | Quanto tempo depois de acordar o(a) Sr(a) normalmente fuma pela primeira vez? |
|  |  |  | 1 | Até 5 minutos |
|  |  |  | 2 | De 6 a 30 minutos |
|  |  |  | 3 | De 31 a 60 minutos |
|  |  |  | 4 | Mais de 60 minutos |
|  |  |  |  | Não aplicável |
| P056 | 652 | 1 |  | A última vez que o(a) Sr(a) comprou cigarros industrializados  para uso próprio, quantos cigarros comprou? |
|  |  |  | 1 | Cigarros |
|  |  |  | 2 | Maços |
|  |  |  | 3 | Pacotes |
|  |  |  | 4 | Nunca comprei cigarros para uso próprio |
|  |  |  |  | Não aplicável |
| P05601 | 653 | 2 |  | Qual a quantidade de cigarros? |
| P05602 | 655 | 2 |  | Qual a quantidade de maços? |
| P05603 | 657 | 2 |  | Quantos cigarros havia em cada maço? |
| P05604 | 659 | 2 |  | Qual a quantidade de pacotes? |
| P05605 | 661 | 2 |  | Quantos maços havia em cada pacote? |
| P057 | 663 | 9 | 6 dígitos e 2 casas decimais | No total, quanto o(a) Sr(a) pagou por essa compra? |
| P058 | 672 | 1 |  | Em média, quantos cigarros industrializados o Sr.(a) fumava por dia ou por semana? |
|  |  |  | 1 | Um ou mais por dia |
|  |  |  | 2 | Um ou mais por semana |
|  |  |  | 3 | Menos que uma vez por semana |
|  |  |  | 4 | Menos do que um por mês |
|  |  |  | 5 | Não fuma este produto |
|  |  |  | 6 | Não sabe |
|  |  |  |  | Não aplicável |
| P05801 | 673 | 2 |  | Especifique número de dias (P058) |
| P05802 | 675 | 2 |  | Especifique número de semanas (P058) |
| P05901 | 677 | 2 |  | Há quantos anos o(a) Sr(a) parou de fumar? |
| P05902 | 679 | 2 |  | Há quantos meses o(a) Sr(a) parou de fumar? |
| P05903 | 681 | 2 |  | Há quantos semanas o(a) Sr(a) parou de fumar? |
| P05904 | 683 | 2 |  | Há quantos dias o(a) Sr(a) parou de fumar? |
| P060 | 685 | 1 |  | Durante os últimos 12 meses, o(a) Sr(a) tentou parar de fumar? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| P061 | 686 | 1 |  | Quando o(a) Sr(a) tentou parar de fumar, procurou tratamento com profissional de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| P062 | 687 | 1 |  | O(a) Sr(a) conseguiu o tratamento com profissional de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| P063 | 688 | 2 |  | Porque o(a) Sr(a) não conseguiu tratamento? |
|  |  |  | 01 | A consulta está marcada, mas ainda não foi realizada |
|  |  |  | 02 | O tempo de espera no serviço de saúde é muito grande |
|  |  |  | 03 | Não conseguiu marcar |
|  |  |  | 04 | Não sabia quem procurar ou aonde ir |
|  |  |  | 05 | Estava com dificuldades financeiras |
|  |  |  | 06 | O plano de saúde não cobria o tratamento |
|  |  |  | 07 | O serviço de saúde era muito distante |
|  |  |  | 08 | Teve dificuldades de transporte |
|  |  |  | 09 | O horário de funcionamento do serviço de saúde era incompatível com as atividades de trabalho ou domésticas |
|  |  |  | 10 | Outro |
|  |  |  |  | Não aplicável |
| P064 | 690 | 1 |  | O tratamento foi coberto por algum plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| P065 | 691 | 1 |  | O(a) Sr(a) pagou algum valor por esse tratamento? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| P066 | 692 | 1 |  | O tratamento foi feito através do Sistema Único de Saúde (SUS)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| P067 | 693 | 1 |  | Atualmente, o(a) Sr(a) masca fumo, usa rapé ou usa algum produto do tabaco que não faz fumaça? |
|  |  |  | 1 | Sim, diariamente |
|  |  |  | 2 | Sim, menos que diariamente |
|  |  |  | 3 | Não usa |
|  |  |  |  | Não aplicável |
| P068 | 694 | 1 |  | Com que frequência alguém fuma dentro do seu domicílio? |
|  |  |  | 1 | Diariamente |
|  |  |  | 2 | Semanalmente |
|  |  |  | 3 | Mensalmente |
|  |  |  | 4 | Menos que mensalmente |
|  |  |  | 5 | Nunca |
|  |  |  |  | Não aplicável |
| P069 | 695 | 1 |  | Nos últimos 30 dias, o(a) Sr(a) viu alguma propaganda ou anúncio de cigarros nos pontos de venda de cigarros? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não lembra |
|  |  |  |  | Não aplicável |
| P07001 | 696 | 1 |  | Nos últimos 30 dias, o(a) Sr(a) viu ou ouviu informações sobre os riscos de fumar cigarros ou que estimulem a parar de fumar nos nos jornais ou revistas? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| P07002 | 697 | 1 |  | Nos últimos 30 dias, o(a) Sr(a) viu ou ouviu informações sobre os riscos de fumar cigarros ou que estimulem a parar de fumar na televisão? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| P07003 | 698 | 1 |  | Nos últimos 30 dias, o(a) Sr(a) viu ou ouviu informações sobre os riscos de fumar cigarros ou que estimulem a parar de fumar no rádio? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| P071 | 699 | 1 |  | Nos últimos 30 dias, viu alguma foto ou advertência sobre os riscos de fumar nos maços de cigarros? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não vi nenhum maço de cigarros |
|  |  |  |  | Não aplicável |
| P072 | 700 | 1 |  | Nos últimos 30 dias, as advertências nos maços de cigarro levaram o(a) Sr(a) a pensar em parar de fumar? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| MÓDULO Q – DOENÇAS CRÔNICAS |  |  |  |  |
| Q001 | 701 | 1 |  | Quando foi a última vez que o(a) Sr(a) teve sua pressão arterial medida? |
|  |  |  | 1 | Há menos de 6 meses |
|  |  |  | 2 | Entre 6 meses e menos de 1 ano |
|  |  |  | 3 | Entre 1 ano e menos de 2 anos |
|  |  |  | 4 | Entre 2 anos e menos de 3 anos |
|  |  |  | 5 | 3 anos ou mais |
|  |  |  | 6 | Nunca |
|  |  |  |  | Não aplicável |
| Q002 | 702 | 1 |  | Algum médico já lhe deu o diagnóstico de hipertensão arterial (pressão alta)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Apenas durante a gravidez |
|  |  |  | 3 | Não |
|  |  |  |  | Não aplicável |
| Q003 | 703 | 2 |  | Que idade o(a) Sr(a) tinha no primeiro diagnóstico de hipertensão arterial (pressão alta)? (0 =  Menos de 1 ano) |
| Q004 | 705 | 1 |  | O(a) Sr(a) vai ao médico/serviço de saúde regularmente por causa da hipertensão arterial (pressão alta)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, só quando tem algum problema |
|  |  |  | 3 | Nunca vai |
|  |  |  |  | Não aplicável |
| Q005 | 706 | 1 |  | Qual o principal motivo do(a) Sr(a) não visitar o médico/serviço de saúde regularmente por causa da hipertensão arterial (pressão alta)? |
|  |  |  | 1 | O serviço de saúde é muito distante |
|  |  |  | 2 | O tempo de espera no serviço de saúde é muito grande |
|  |  |  | 3 | Tem dificuldades financeiras |
|  |  |  | 4 | Não acha necessário |
|  |  |  | 5 | O horário de funcionamento do serviço de saúde é incompatível com suas atividades de trabalho ou domésticas |
|  |  |  | 6 | O plano de saúde não cobre as consultas |
|  |  |  | 7 | Não sabe quem procurar ou aonde ir |
|  |  |  | 8 | Dificuldade de transporte |
|  |  |  | 9 | Outro |
|  |  |  |  | Não aplicável |
| Q006 | 707 | 1 |  | Nas duas últimas semanas, o(a) Sr(a) tomou medicamentos por causa da hipertensão arterial (pressão alta)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q007 | 708 | 1 |  | Algum dos medicamentos para hipertensão arterial foi coberto por plano de saúde? |
|  |  |  | 1 | Sim, todos |
|  |  |  | 2 | Sim, alguns |
|  |  |  | 3 | Não, nenhum |
|  |  |  |  | Não aplicável |
| Q008 | 709 | 1 |  | Algum dos medicamentos para hipertensão arterial foi obtido no programa de farmácia popular (PFP)? |
|  |  |  | 1 | Sim, todos |
|  |  |  | 2 | Sim, alguns |
|  |  |  | 3 | Não, nenhum |
|  |  |  |  | Não aplicável |
| Q009 | 710 | 1 |  | Algum dos medicamentos para hipertensão arterial foi obtido em serviço público de saúde? |
|  |  |  | 1 | Sim, todos |
|  |  |  | 2 | Sim, alguns |
|  |  |  | 3 | Não, nenhum |
|  |  |  |  | Não aplicável |
| Q010 | 711 | 1 |  | O(a) Sr(a) pagou algum valor pelos medicamentos? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q011 | 712 | 1 |  | Quando foi a última vez que o(a) Sr(a) recebeu assistência médica por causa da hipertensão arterial? |
|  |  |  | 1 | Há menos de 6 meses |
|  |  |  | 2 | Entre 6 meses e menos de 1 ano |
|  |  |  | 3 | Entre 1 ano e menos de 2 anos |
|  |  |  | 4 | Entre 2 anos e menos de 3 anos |
|  |  |  | 5 | Há 3 anos ou mais |
|  |  |  | 6 | Nunca recebeu |
|  |  |  |  | Não aplicável |
| Q012 | 713 | 2 |  | Na última vez que recebeu assistência médica para hipertensão arterial, onde o(a) Sr(a) foi atendido? |
|  |  |  | 01 | Unidade básica de saúde (posto ou centro de saúde ou unidade de saúde da família) |
|  |  |  | 02 | Centro de Especialidades, Policlínica pública ou PAM - Posto de Assistência Médica |
|  |  |  | 03 | UPA (Unidade de pronto Atendimento) |
|  |  |  | 04 | Outro tipo de Pronto Atendimento Público (24 horas) |
|  |  |  | 05 | Pronto-socorro ou emergência de hospital público |
|  |  |  | 06 | Hospital público/ambulatório |
|  |  |  | 07 | Consultório particular ou Clínica privada |
|  |  |  | 08 | Ambulatório ou consultório de empresa ou sindicato |
|  |  |  | 09 | Pronto-atendimento ou emergência de hospital privado |
|  |  |  | 10 | No domicílio, com médico da equipe de saúde da família |
|  |  |  | 11 | No domicílio, com médico particular |
|  |  |  | 12 | Outro |
|  |  |  |  | Não aplicável |
| Q013 | 715 | 1 |  | Esse atendimento foi coberto por algum plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q014 | 716 | 1 |  | O(a) Sr(a) pagou algum valor por este atendimento? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q015 | 717 | 1 |  | Esse atendimento foi feito pelo SUS? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| Q016 | 718 | 1 |  | Na última consulta, o médico que o(a) atendeu era o mesmo das consultas anteriores? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q017 | 719 | 1 |  | Na última consulta, o médico viu os exames das consultas passadas? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não, pois não tinha realizado exames |
|  |  |  |  | Não aplicável |
| Q01801 | 720 | 1 |  | Em algum dos atendimentos para hipertensão, algum médico ou outro profissional de saúde lhe recomendou manter uma alimentação saudável (com frutas e vegetais)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q01802 | 721 | 1 |  | Em algum dos atendimentos para hipertensão, algum médico ou outro profissional de saúde lhe recomendou manter o peso adequado? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q01803 | 722 | 1 |  | Em algum dos atendimentos para hipertensão, algum médico ou outro profissional de saúde lhe recomendou ingerir menos sal? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q01804 | 723 | 1 |  | Em algum dos atendimentos para hipertensão, algum médico ou outro profissional de saúde lhe recomendou praticar atividade física regular? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q01805 | 724 | 1 |  | Em algum dos atendimentos para hipertensão, algum médico ou outro profissional de saúde lhe recomendou não fumar? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q01806 | 725 | 1 |  | Em algum dos atendimentos para hipertensão, algum médico ou outro profissional de saúde lhe recomendou não beber em excesso? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q01807 | 726 | 1 |  | Em algum dos atendimentos para hipertensão, algum médico ou outro profissional de saúde lhe recomendou fazer o acompanhamento regular? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q01808 | 727 | 1 |  | Em algum dos atendimentos para hipertensão, algum médico ou outro profissional de saúde lhe fez outras recomendações? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q01901 | 728 | 1 |  | Em algum dos atendimentos para hipertensão arterial foi pedido exame de sangue (colesterol, glicemia, triglicerídeos)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q01902 | 729 | 1 |  | Em algum dos atendimentos para hipertensão arterial foi pedido exame de urina? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q01903 | 730 | 1 |  | Em algum dos atendimentos para hipertensão arterial foi pedido eletrocardiograma? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q01904 | 731 | 1 |  | Em algum dos atendimentos para hipertensão arterial foi pedido teste de esforço? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q01905 | 732 | 1 |  | Em algum dos atendimentos para hipertensão, algum médico ou outro profissional de saúde fez outro pedido? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q020 | 733 | 1 |  | O(a) Sr(a) fez todos os exames solicitados? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q021 | 734 | 2 |  | Qual o principal motivo do(a) Sr(a) não ter feito todos os exames solicitados? |
|  |  |  | 01 | O exame está marcado, mas ainda não fez |
|  |  |  | 02 | Não achou necessário |
|  |  |  | 03 | Não conseguiu marcar |
|  |  |  | 04 | O tempo de espera no laboratório ou serviço de saúde era muito grande |
|  |  |  | 05 | Estava com dificuldades financeiras |
|  |  |  | 06 | O laboratório ou serviço de saúde era muito distante |
|  |  |  | 07 | O horário de funcionamento do laboratório ou serviço de saúde era incompatível com as suas atividades de trabalho ou domésticas |
|  |  |  | 08 | O plano de saúde não cobria todos os exames solicitados |
|  |  |  | 09 | Não sabia onde realizar os exames |
|  |  |  | 10 | Dificuldade de transporte |
|  |  |  | 11 | Outro |
|  |  |  |  | Não aplicável |
| Q022 | 736 | 1 |  | Em algum dos atendimentos para hipertensão arterial, houve encaminhamento para alguma consulta com médico especialista, tais como cardiologista ou nefrologista? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não houve encaminhamento, pois todas as consultas para hipertensão foram com médico especialista |
|  |  |  |  | Não aplicável |
| Q023 | 737 | 1 |  | O(a) Sr(a) foi a todas as consultas com o médico especialista? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q024 | 738 | 2 |  | Qual o principal motivo do(a) Sr(a) não ter ido a todas as consultas com o médico especialista? |
|  |  |  | 01 | A consulta está marcada, mas a consulta ainda não foi realizada |
|  |  |  | 02 | Não achou necessário |
|  |  |  | 03 | Não sabia quem procurar ou aonde ir |
|  |  |  | 04 | Estava com dificuldades financeiras |
|  |  |  | 05 | Teve dificuldades de transporte |
|  |  |  | 06 | Não conseguiu marcar |
|  |  |  | 07 | O tempo de espera no serviço de saúde era muito grande |
|  |  |  | 08 | O plano de saúde não cobria a consulta |
|  |  |  | 09 | O serviço de saúde era muito distante |
|  |  |  | 10 | O horário de funcionamento do serviço de saúde era incompatível com as atividades de trabalho ou domésticas |
|  |  |  | 11 | Outro |
|  |  |  |  | Não aplicável |
| Q026 | 740 | 1 |  | Alguma vez o(a) Sr(a) se internou por causa da hipertensão ou de alguma complicação? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q027 | 741 | 1 |  | Há quanto tempo foi a última internação por causa da hipertensão ou de alguma complicação? |
|  |  |  | 1 | Há menos de 6 meses |
|  |  |  | 2 | Entre 6 meses e menos de 1 ano |
|  |  |  | 3 | Entre 1 ano e menos de 2 anos |
|  |  |  | 4 | Entre 2 anos e menos de 3 anos |
|  |  |  | 5 | Há 3 anos ou mais |
|  |  |  |  | Não aplicável |
| Q028 | 742 | 1 |  | Em geral, em que grau a hipertensão ou alguma complicação da hipertensão limita as suas atividades habituais (como trabalhar, estudar, realizar afazeres domésticos, etc)? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| Q029 | 743 | 1 |  | Quando foi a última vez que o(a) Sr(a) fez exame de sangue para medir a glicemia, isto é, o açúcar no sangue? |
|  |  |  | 1 | Há menos de 6 meses |
|  |  |  | 2 | Entre 6 meses e menos de 1 ano |
|  |  |  | 3 | Entre 1 ano e menos de 2 anos |
|  |  |  | 4 | Entre 2 anos e menos de 3 anos |
|  |  |  | 5 | Há 3 anos ou mais |
|  |  |  | 6 | Nunca fez |
|  |  |  |  | Não aplicável |
| Q030 | 744 | 1 |  | Algum médico já lhe deu o diagnóstico de diabetes? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Apenas durante a gravidez (só para mulheres) |
|  |  |  | 3 | Não |
|  |  |  |  | Não aplicável |
| Q031 | 745 | 2 |  | Que idade o(a) Sr(a) tinha no primeiro diagnóstico de diabetes? (0 =  Menos de 1 ano) (Branco = Não aplicável) |
| Q032 | 747 | 1 |  | O(a) Sr(a) vai ao médico/serviço de saúde regularmente por causa do diabetes? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, só quando tem algum problema |
|  |  |  | 3 | Nunca vai |
|  |  |  |  | Não aplicável |
| Q033 | 748 | 2 |  | Qual o principal motivo do(a) Sr(a) não visitar o médico/serviço de saúde regularmente por causa do diabetes? |
|  |  |  | 01 | O serviço de saúde é muito distante |
|  |  |  | 02 | O tempo de espera no serviço de saúde é muito grande |
|  |  |  | 03 | Tem dificuldades financeiras |
|  |  |  | 04 | Não acha necessário |
|  |  |  | 05 | O horário de funcionamento do serviço de saúde é incompátivel com suas atividades de trabalho ou domésticos |
|  |  |  | 06 | O plano de saúde não cobre as consultas |
|  |  |  | 07 | Não sabe quem procurar ou aonde ir |
|  |  |  | 08 | Dificuldade de transporte |
|  |  |  | 09 | Outro |
|  |  |  |  | Não aplicável |
| Q03401 | 750 | 1 |  | Nas duas últimas semanas, por causa do diabetes, o(a) Sr.(a) tomou medicamentos orais para baixar o açúcar? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q03402 | 751 | 1 |  | Nas duas últimas semanas, por causa do diabetes, o(a) Sr.(a) usou insulina? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q035 | 752 | 1 |  | Algum dos medicamentos ou insulina para diabetes foi coberto por plano de saúde? |
|  |  |  | 1 | Sim, todos |
|  |  |  | 2 | Sim, alguns |
|  |  |  | 3 | Não, nenhum |
|  |  |  |  | Não aplicável |
| Q036 | 753 | 1 |  | Algum dos medicamentos para diabetes ou insulina no programa farmácia popular (PFP)? |
|  |  |  | 1 | Sim, todos |
|  |  |  | 2 | Sim, alguns |
|  |  |  | 3 | Não, nenhum |
|  |  |  |  | Não aplicável |
| Q037 | 754 | 1 |  | Algum dos medicamentos para diabetes ou insulina foi obtido em serviço público de saúde? |
|  |  |  | 1 | Sim, todos |
|  |  |  | 2 | Sim, alguns |
|  |  |  | 3 | Não, nenhum |
|  |  |  |  | Não aplicável |
| Q038 | 755 | 1 |  | O(a) Sr(a) pagou algum valor pelos medicamentos para diabetes ou insulina? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q039 | 756 | 1 |  | Quando foi a última vez que o(a) Sr(a) recebeu assistência médica por causa da diabetes? |
|  |  |  | 1 | Há menos de 6 meses |
|  |  |  | 2 | Entre 6 meses e menos de 1 ano |
|  |  |  | 3 | Entre 1 ano e menos de 2 anos |
|  |  |  | 4 | Entre 2 anos e menos de 3 anos |
|  |  |  | 5 | Há 3 anos ou mais |
|  |  |  | 6 | Nunca recebeu |
|  |  |  |  | Não aplicável |
| Q040 | 757 | 2 |  | Na última vez que recebeu assistência médica para diabetes, onde o(a) Sr(a) foi atendido? |
|  |  |  | 01 | Unidade básica de saúde (posto ou centro de saúde ou unidade de saúde da família) |
|  |  |  | 02 | Centro de Especialidades, Policlínica pública ou PAM - Posto de Assistência Médica |
|  |  |  | 03 | UPA (Unidade de pronto Atendimento) |
|  |  |  | 04 | Outro tipo de Pronto Atendimento Público (24 horas) |
|  |  |  | 05 | Pronto-socorro ou emergência de hospital público |
|  |  |  | 06 | Hospital público/ambulatório |
|  |  |  | 07 | Consultório particular ou Clínica privada |
|  |  |  | 08 | Ambulatório ou consultório de empresa ou sindicato |
|  |  |  | 09 | Pronto-atendimento ou emergência de hospital privado |
|  |  |  | 10 | No domicílio, com médico da equipe de saúde da família |
|  |  |  | 11 | No domicílio, com médico particular |
|  |  |  | 12 | Outro |
|  |  |  |  | Não aplicável |
| Q041 | 759 | 1 |  | Esse atendimento foi coberto por algum plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q042 | 760 | 1 |  | O(a) Sr(a) pagou algum valor por esse atendimento? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q043 | 761 | 1 |  | Esse atendimento foi feito pelo SUS? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| Q044 | 762 | 1 |  | Na última consulta, o médico que o(a) atendeu era o mesmo das consultas anteriores? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q045 | 763 | 1 |  | Na última consulta, o médico viu os exames das consultas passadas? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não, pois não tinha realizado exames |
|  |  |  |  | Não aplicável |
| Q04601 | 764 | 1 |  | Em algum dos atendimentos para diabetes, algum médico ou outro profissional de saúde lhe recomendou manter uma alimentação saudável (com frutas  vegetais)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q04602 | 765 | 1 |  | Em algum dos atendimentos para diabetes, algum médico ou outro profissional de saúde lhe recomendou manter o peso adequado? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q04603 | 766 | 1 |  | Em algum dos atendimentos para diabetes, algum médico ou outro profissional de saúde lhe recomendou praticar atividade física regular? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q04604 | 767 | 1 |  | Em algum dos atendimentos para diabetes, algum médico ou outro profissional de saúde lhe recomendou não fumar? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q04605 | 768 | 1 |  | Em algum dos atendimentos para diabetes, algum médico ou outro profissional de saúde lhe recomendou não beber em excesso? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q04606 | 769 | 1 |  | Em algum dos atendimentos para diabetes, algum médico ou outro profissional de saúde lhe recomendou diminuir o consumo de carboidratos (massas, pães, etc.) |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q04607 | 770 | 1 |  | Em algum dos atendimentos para diabetes, algum médico ou outro profissional de saúde lhe recomendou medir a glicemia em casa? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q04608 | 771 | 1 |  | Em algum dos atendimentos para diabetes, algum médico ou outro profissional de saúde lhe recomendou examinar os pés regularmente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q04609 | 772 | 1 |  | Em algum dos atendimentos para diabetes, algum médico ou outro profissional de saúde lhe recomendou outro procedimento? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q04701 | 773 | 1 |  | Em algum dos atendimentos para diabetes foi pedido exame de sangue (colesterol, glicemia, triglicerídeos)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q04702 | 774 | 1 |  | Em algum dos atendimentos para diabetes foi pedido exame de hemoglobina glicada? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q04703 | 775 | 1 |  | Em algum dos atendimentos para diabetes foi pedido exame curva glicêmica? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q04704 | 776 | 1 |  | Em algum dos atendimentos para diabetes foi pedido exame de urina? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q04705 | 777 | 1 |  | Em algum dos atendimentos para diabetes foi pedido outro exame? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q048 | 778 | 1 |  | O(a) Sr(a) fez todos os exames solicitados? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q049 | 779 | 2 |  | Qual o principal motivo do(a) Sr(a) não ter feito todos os exames solicitados? |
|  |  |  | 01 | O exame está marcado, mas ainda não fez |
|  |  |  | 02 | Não achou necessário |
|  |  |  | 03 | Não conseguiu marcar |
|  |  |  | 04 | O tempo de espera no laboratório ou serviço de saúde era muito grande |
|  |  |  | 05 | Estava com dificuldades financeiras |
|  |  |  | 06 | O laboratório ou serviço de saúde era muito distante |
|  |  |  | 07 | O horário de funcionamento do laboratório ou serviço de saúde era incompatível com as suas atividades de trabalho ou domésticas |
|  |  |  | 08 | O plano de saúde não cobria todos os exames solicitados |
|  |  |  | 09 | Não sabia onde realizar os exames |
|  |  |  | 10 | Dificuldade de transporte |
|  |  |  | 11 | Outro |
|  |  |  |  | Não aplicável |
| Q050 | 781 | 1 |  | Em algum dos atendimentos para diabetes, houve encaminhamento para alguma consulta com médico especialista, tais como cardiologista, endocrinologista, nefrologista ou oftalmologista? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não houve encaminhamento, pois todas as consultas para diabetes foram com médico especialista |
|  |  |  |  | Não aplicável |
| Q051 | 782 | 1 |  | O(a) Sr(a) foi a todas as consultas com médico especialista? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q052 | 783 | 2 |  | Qual o principal motivo do(a) Sr(a) não ter ido a todas as consultas com o médico especialista? |
|  |  |  | 01 | A consulta está marcada, mas a consulta ainda não foi realizada |
|  |  |  | 02 | Não achou necessário |
|  |  |  | 03 | Não sabia quem procurar ou aonde ir |
|  |  |  | 04 | Estava com dificuldades financeiras |
|  |  |  | 05 | Teve dificuldades de transporte |
|  |  |  | 06 | Não conseguiu marcar |
|  |  |  | 07 | O tempo de espera no serviço de saúde era muito grande |
|  |  |  | 08 | O plano de saúde não cobria a consulta |
|  |  |  | 09 | O serviço de saúde era muito distante |
|  |  |  | 10 | O horário de funcionamento do serviço de saúde era incompatível com as atividades de trabalho domésticas |
|  |  |  | 11 | Outro |
|  |  |  |  | Não aplicável |
| Q053 | 785 | 1 |  | Quando foi a última vez que realizaram um exame de vista ou fundo de olho em que dilataram sua pupila? |
|  |  |  | 1 | Há menos de 6 meses |
|  |  |  | 2 | Entre 6 meses e menos de 1 ano |
|  |  |  | 3 | Entre 1 ano e menos de 2 anos |
|  |  |  | 4 | Entre 2 anos e menos de 3 anos |
|  |  |  | 5 | Há 3 anos ou mais |
|  |  |  | 6 | Nunca fez |
|  |  |  |  | Não aplicável |
| Q054 | 786 | 1 |  | Quando foi a última vez que um médico ou profissional de saúde examinou seus pés para verificar sensibilidade ou presença de feridas ou irritações? |
|  |  |  | 1 | Há menos de 6 meses |
|  |  |  | 2 | Entre 6 meses e menos de 1 ano |
|  |  |  | 3 | Entre 1 ano e menos de 2 anos |
|  |  |  | 4 | Entre 2 anos e menos de 3 anos |
|  |  |  | 5 | Há 3 anos ou mais |
|  |  |  | 6 | Nunca teve os pés examinados |
|  |  |  |  | Não aplicável |
| Q05501 | 787 | 1 |  | O(a) Sr(a) tem ou teve problemas na vista por causa do diabetes? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q05502 | 788 | 1 |  | O(a) Sr(a) tem ou teve infarto por causa do diabetes? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q05503 | 789 | 1 |  | O(a) Sr(a) tem ou teve AVC (Acidente Vascular cerebral) ou derrame por causa do diabetes? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q05504 | 790 | 1 |  | O(a) Sr(a) tem ou teve outro problema circulatório por causa do diabetes? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q05505 | 791 | 1 |  | O(a) Sr(a) tem ou teve problemas problema nos rins por causa do diabetes? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q05506 | 792 | 1 |  | O(a) Sr(a) tem ou teve Úlcera/ferida nos pés por causa do diabetes? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q05507 | 793 | 1 |  | O(a) Sr(a) tem ou teve que fazer amputação de pés, pernas, mãos ou braços por causa do diabetes ? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q05508 | 794 | 1 |  | O(a) Sr(a) tem ou teve coma diabético por causa do diabetes? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q05509 | 795 | 1 |  | Outro |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q056 | 796 | 1 |  | Alguma vez o(a) Sr(a) se internou por causa do diabetes ou de alguma complicação? (0 =  Menos de 1 ano) |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q057 | 797 | 1 |  | Há quanto tempo foi a última internação por causa do diabetes ou de alguma complicação? |
|  |  |  | 1 | Há menos de 6 meses |
|  |  |  | 2 | Entre 6 meses e menos de 1 ano |
|  |  |  | 3 | Entre 1 ano e menos de 2 anos |
|  |  |  | 4 | Entre 2 anos e menos de 3 anos |
|  |  |  | 5 | Há 3 anos ou mais |
|  |  |  |  | Não aplicável |
| Q058 | 798 | 1 |  | Em geral, em que grau o diabetes ou alguma complicação do diabetes limita as suas atividades habituais (tais como trabalhar, realizar afazeres domésticos, etc.)? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| Q059 | 799 | 1 |  | Quando foi a última vez que o(a) Sr(a) fez exame de sangue para medir o colesterol e triglicerídeos? |
|  |  |  | 1 | Há menos de 6 meses |
|  |  |  | 2 | Entre 6 meses e menos de 1 ano |
|  |  |  | 3 | Entre 1 ano e menos de 2 anos |
|  |  |  | 4 | Entre 2 anos e menos de 3 anos |
|  |  |  | 5 | Há 3 anos ou mais |
|  |  |  | 6 | Nunca fez |
|  |  |  |  | Não aplicável |
| Q060 | 800 | 1 |  | Algum médico já lhe deu o diagnóstico de colesterol alto? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q061 | 801 | 2 |  | Que idade o(a) sr(a) tinha no primeiro diagnóstico de colesterol alto? (0 =  Menos de 1 ano) |
| Q06201 | 803 | 1 |  | Algum médico ou outro profissional de saúde lhe deu alguma recomendação para manter uma alimentação saudável (com frutas e vegetais) por causa do colesterol alto? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q06202 | 804 | 1 |  | Algum médico ou outro profissional de saúde lhe deu alguma recomendação para manter o peso adequado por causa do colesterol alto? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q06203 | 805 | 1 |  | Algum médico ou outro profissional de saúde lhe deu alguma recomendação para prática de atividade física por causa do colesterol alto? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q06204 | 806 | 1 |  | Algum médico ou outro profissional de saúde lhe deu alguma recomendação para tomar medicamentos por causa do colesterol alto? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q06205 | 807 | 1 |  | Algum médico ou outro profissional de saúde lhe deu alguma recomendação para não fumar por causa do colesterol alto? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q06206 | 808 | 1 |  | Algum médico ou outro profissional de saúde lhe deu alguma recomendação para fazer acompanhamento regular por causa do colesterol alto? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q063 | 809 | 1 |  | Algum médico já lhe deu o diagnóstico de uma doença do coração tais como infarto, angina, insuficiência cardiaca ou outra? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q06301 | 810 | 1 |  | Algum médico já lhe deu o diagnóstico de uma doença do coração tal como infarto? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q06302 | 811 | 1 |  | Algum médico já lhe deu o diagnóstico de uma doença do coração tal como angina? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q06303 | 812 | 1 |  | Algum médico já lhe deu o diagnóstico de uma doença do coração tal como insuficiência cardíaca? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q06304 | 813 | 1 |  | Outro |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q064 | 814 | 2 |  | Que idade o Sr(a) tinha no primeiro diagnóstico da doença do coração? (0 =  Menos de 1 ano) |
| Q06501 | 816 | 1 |  | O(A) Sr(a) faz dieta atualmente por causa da doença do coração? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q06502 | 817 | 1 |  | O Sr(a) faz prática de atividade física atualmente por causa da doença do coração? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q06503 | 818 | 1 |  | O Sr(a) toma medicamentos atualmente por causa da  doença do coração? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q06504 | 819 | 1 |  | Outro |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q066 | 820 | 1 |  | O(a) Sr(a) já fez alguma cirurgia de ponte de safena ou colocação de stent ou angioplastia? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q067 | 821 | 1 |  | Em geral, em que grau a doença do coração limita as suas atividades habituais (tais como trabalhar, realizar afazeres domésticos, etc.)? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| Q068 | 822 | 1 |  | Algum médico já lhe deu o diagnóstico de AVC (Acidente Vascular cerebral) ou derrame? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q069 | 823 | 2 |  | Quantos derrames (ou AVC) o(a) Sr(a) já teve? (Branco = Não aplicável) |
| Q070 | 825 | 2 |  | Que idade o(a) Sr(a) tinha no primeiro diagnóstico do derrame (ou AVC)? (0 =  Menos de 1 ano) (Branco = Não aplicável) |
| Q071 | 827 | 1 |  | Por causa do derrame (ou AVC), o(a) Sr(a) realizou tomografia ou ressonância da cabeça? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q07201 | 828 | 1 |  | O(A) Sr(a) faz dieta atualmente por causa do derrame (ou AVC)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q07202 | 829 | 1 |  | O(A) Sr(a) faz fisioterapia atualmente por causa derrame (ou AVC)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q07203 | 830 | 1 |  | O(A) Sr(a) faz outras terapias de reabilitação atualmente por causa derrame (ou AVC)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q07204 | 831 | 1 |  | O(A) Sr(a) toma aspirina atualmente por causa derrame (ou AVC)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q07205 | 832 | 1 |  | O(A) Sr(a) toma outros medicamentos atualmente por causa derrame (ou AVC)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q07206 | 833 | 1 |  | Outro |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q073 | 834 | 1 |  | Em geral, em que grau o derrame (ou AVC) limita as suas atividades habituais (tais como trabalhar, realizar afazeres domésticos, etc.)? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| Q074 | 835 | 1 |  | Algum médico já lhe deu o diagnóstico de asma (ou bronquite asmática)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
| Q075 | 836 | 2 |  | Que idade o(a) Sr(a) tinha no primeiro diagnóstico de asma? (0 =  Menos de 1 ano) |
| Q076 | 838 | 1 |  | Nos últimos 12 meses, o(a) Sr(a) teve alguma crise de asma? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q07701 | 839 | 1 |  | O Sr(a) usa medicamentos (inaladores, aerossol ou comprimidos) atualmente por causa da asma? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q07702 | 840 | 1 |  | Outro |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q078 | 841 | 1 |  | Em geral, em que grau a asma limita as suas atividades habituais (tais como trabalhar, realizar afazeres domésticos, etc.)? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| Q079 | 842 | 1 |  | Algum médico já lhe deu o diagnóstico de artrite ou reumatismo? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q080 | 843 | 2 |  | Que idade o(a) Sr(a) tinha no primeiro diagnóstico de artrite ou reumatismo? (0 =  Menos de 1 ano) (Branco = Não aplicável) |
| Q08101 | 845 | 1 |  | O Sr(a) faz exercício ou atividade física atualmente por causa da artrite ou reumatismo? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q08102 | 846 | 1 |  | O Sr(a) faz fisioterapia atualmente por causa da artrite ou reumatismo? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q08103 | 847 | 1 |  | O Sr(a) usa medicamentos ou injeções atualmente por causa da artrite ou reumatismo? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q08104 | 848 | 1 |  | O Sr(a) faz acupuntura atualmente por causa da artrite ou reumatismo? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q08105 | 849 | 1 |  | Outro |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q082 | 850 | 1 |  | O(a) Sr(a) já fez alguma cirurgia por causa da artrite ou reumatismo? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q083 | 851 | 1 |  | Em geral, em que grau a artrite ou reumatismo limita as suas atividades habituais (tais como trabalhar, realizar afazeres domésticos, etc.)? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| Q084 | 852 | 1 |  | O(a) Sr(a) tem algum problema crônico de coluna, como dor crônica nas costas ou no pescoço, lombalgia, dor ciática, problemas nas vértebras ou disco? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q085 | 853 | 2 |  | Que idade o(a) Sr(a) tinha quando começou o problema na coluna? (0 =  Menos de 1 ano) (Branco = Não aplicável) |
| Q08601 | 855 | 1 |  | O(A) Sr(a) faz exercício ou fisioterapia atualmente por causa do problema na coluna? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q08603 | 856 | 1 |  | O(A) Sr(a) usa medicamentos ou injeções atualmente por causa do problema na coluna? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q08604 | 857 | 1 |  | O(A) Sr(a) faz acupuntura atualmente por causa do problema na coluna? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q08605 | 858 | 1 |  | Outro |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q087 | 859 | 1 |  | Em geral, em que grau o problema na coluna limita as suas atividades habituais (tais como trabalhar, realizar afazeres domésticos, etc.)? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| Q088 | 860 | 1 |  | Algum médico já lhe deu o diagnóstico de DORT (distúrbio osteomuscular relacionado ao trabalho)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q089 | 861 | 2 |  | Que idade o(a) Sr(a) tinha no primeiro diagnóstico de DORT? (0 =  Menos de 1 ano) (Branco = Não aplicável) |
| Q09001 | 863 | 1 |  | O Sr(a) faz exercício ou fisioterapia atualmente por causa do DORT? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q09003 | 864 | 1 |  | O Sr(a) usa medicamentos ou injeções atualmente por causa por causa do DORT? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q09004 | 865 | 1 |  | O Sr(a) faz acupuntura atualmente por causa do DORT? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q09005 | 866 | 1 |  | Outro |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q091 | 867 | 1 |  | Em geral, em que grau o DORT limita as suas atividades habituais (tais como trabalhar, realizar afazeres domésticos, etc.)? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| Q092 | 868 | 1 |  | Algum médico ou profissional de saúde mental (como psiquiatra ou psicólogo) já lhe deu o diagnóstico de depressão? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q093 | 869 | 2 |  | Que idade o(a) Sr(a) tinha no primeiro diagnóstico de depressão? (0 =  Menos de 1 ano) (Branco = Não aplicável) |
| Q094 | 871 | 1 |  | O(a) Sr(a) vai ao médico/serviço de saúde regularmente por causa da depressão? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, só quando tem algum problema |
|  |  |  | 3 | Nunca vai |
|  |  |  |  | Não aplicável |
| Q095 | 872 | 2 |  | Qual o principal motivo do(a) Sr(a) não visitar o médico/serviço de saúde regularmente por causa da depressão? |
|  |  |  | 01 | Não está mais deprimido |
|  |  |  | 02 | O serviço de saúde é muito distante |
|  |  |  | 03 | Não tem ânimo |
|  |  |  | 04 | O tempo de espera no serviço de saúde é muito grande |
|  |  |  | 05 | Tem dificuldades financeiras |
|  |  |  | 06 | O horário de funcionamento do serviço de saúde é incompatível e com suas atividades de trabalho ou domésticas |
|  |  |  | 07 | O plano de saúde não cobre as consultas |
|  |  |  | 08 | Não sabe quem procurar ou aonde ir |
|  |  |  | 09 | Dificuldade de transporte |
|  |  |  | 10 | Outro |
|  |  |  |  | Não aplicável |
| Q09601 | 874 | 1 |  | O(A) Sr(a) faz dieta atualmente por causa da depressão? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q09602 | 875 | 1 |  | O(A) Sr(a) faz fisioterapia atualmente por causa da depressão? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q09603 | 876 | 1 |  | Outro |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q097 | 877 | 1 |  | Algum dos medicamentos para depressão foi coberto por plano de saúde? |
|  |  |  | 1 | Sim, todos |
|  |  |  | 2 | Sim, alguns |
|  |  |  | 3 | Não, nenhum |
|  |  |  |  | Não aplicável |
| Q098 | 878 | 1 |  | Algum dos medicamentos para depressão foi obtido em serviço público de saúde? |
|  |  |  | 1 | Sim, todos |
|  |  |  | 2 | Sim, alguns |
|  |  |  | 3 | Não, nenhum |
|  |  |  |  | Não aplicável |
| Q100 | 879 | 1 |  | O(a) Sr(a) pagou algum valor pelos medicamentos? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q101 | 880 | 1 |  | Quando foi a última vez que o(a) Sr(a) recebeu assistência médica por causa da depressão? |
|  |  |  | 1 | Há menos de 6 meses |
|  |  |  | 2 | Entre 6 meses e menos de 1 ano |
|  |  |  | 3 | Entre 1 ano e menos de 2 anos |
|  |  |  | 4 | Entre 2 anos e menos de 3 anos |
|  |  |  | 5 | Há 3 anos ou mais |
|  |  |  | 6 | Nunca recebeu |
|  |  |  |  | Não aplicável |
| Q102 | 881 | 2 |  | Na última vez que recebeu assistência médica para depressão, onde o(a) Sr(a) foi atendido? |
|  |  |  | 01 | Unidade básica de saúde (posto ou centro de saúde ou unidade de saúde da família) |
|  |  |  | 02 | Centro de Especialidades, Policlínica pública ou PAM  - Posto de Assistência Médica |
|  |  |  | 03 | UPA (Unidade de pronto Atendimento) |
|  |  |  | 04 | CAPS – Centro de Atenção Psicossocial |
|  |  |  | 05 | Outro tipo de Pronto Atendimento Público (24 horas) |
|  |  |  | 06 | Pronto-socorro ou emergência de hospital público |
|  |  |  | 07 | Hospital público/ambulatório |
|  |  |  | 08 | Consultório particular ou Clínica privada |
|  |  |  | 09 | Ambulatório ou consultório de empresa ou sindicato |
|  |  |  | 10 | Pronto-atendimento ou emergência de hospital privado |
|  |  |  | 11 | No domicílio, com médico da equipe de saúde da família |
|  |  |  | 12 | No domicílio, com médico particular |
|  |  |  | 13 | Outro |
|  |  |  |  | Não aplicável |
| Q103 | 883 | 1 |  | Esse atendimento foi coberto por plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q104 | 884 | 1 |  | O(a) Sr(a) pagou algum valor por esse atendimento? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q105 | 885 | 1 |  | Esse atendimento foi feito pelo SUS? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| Q106 | 886 | 1 |  | Em algum dos atendimentos para depressão, houve encaminhamento para algum acompanhamento com profissional de saúde mental, como psiquiatra ou psicólogo? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não houve encaminhamento, pois todas as consultas para depressão foram com profissional de saúde mental |
|  |  |  |  | Não aplicável |
| Q107 | 887 | 1 |  | O(a) Sr(a) conseguiu ir a todas as consultas com profissional especialista de saúde mental? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q108 | 888 | 2 |  | Qual o principal motivo do(a) Sr(a) não ter ido a todas as consultas com o profissional especialista de saúde mental? |
|  |  |  | 01 | A consulta está marcada, mas a consulta ainda não foi realizada |
|  |  |  | 02 | Não conseguiu marcar |
|  |  |  | 03 | Não achou necessário |
|  |  |  | 04 | Não teve ânimo |
|  |  |  | 05 | O tempo de espera no serviço de saúde era muito grande |
|  |  |  | 06 | Não sabia quem procurar ou aonde ir |
|  |  |  | 07 | Estava com dificuldades financeiras |
|  |  |  | 08 | Teve dificuldades de transporte |
|  |  |  | 09 | O plano de saúde não cobria a consulta |
|  |  |  | 10 | O serviço de saúde era muito distante |
|  |  |  | 11 | O horário de funcionamento do serviço de saúde era incompatível com as  atividades de trabalho ou domésticas |
|  |  |  | 12 | Outro |
|  |  |  |  | Não aplicável |
| Q109 | 890 | 1 |  | Em geral, em que grau a depressão limita as suas atividades habituais (tais como trabalhar, realizar afazeres domésticos, etc.)? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| Q110 | 891 | 1 |  | Algum médico ou profissional de saúde mental (como psiquiatra ou psicólogo) já lhe deu o diagnóstico de outra doença mental, como esquizofrenia, transtorno bipolar, psicose ou TOC (Transtorno obsessivo compulsivo)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q11001 | 892 | 1 |  | Algum médico ou profissional de saúde mental (como psiquiatra ou psicólogo) já lhe deu o diagnóstico de outra doença mental, como esquizofrenia? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q11002 | 893 | 1 |  | Algum médico ou profissional de saúde mental (como psiquiatra ou psicólogo) já lhe deu o diagnóstico de outra doença mental, como transtorno bipolar? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q11003 | 894 | 1 |  | Algum médico ou profissional de saúde mental (como psiquiatra ou psicólogo) já lhe deu o diagnóstico de outra doença mental, como psicose ou TOC (Transtorno obsessivo compulsivo)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q11004 | 895 | 1 |  | Algum médico ou profissional de saúde mental (como psiquiatra ou psicólogo) já lhe deu o diagnóstico de outra doença mental? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q111 | 896 | 2 |  | Que idade o(a) Sr(a) tinha no primeiro diagnóstico de doença mental? (0 =  Menos de 1 ano) (Branco = Não aplicável) |
| Q112 | 898 | 1 |  | O(a) Sr(a) visita o médico/serviço de saúde regularmente por causa dessa doença mental? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não, só quando tenho algum problema |
|  |  |  |  | Não aplicável |
| Q113 | 899 | 1 |  | Qual o principal motivo do(a) Sr(a) não visitar o médico/serviço de saúde regularmente? |
|  |  |  | 1 | Não acha necessário |
|  |  |  | 2 | O serviço de saúde é muito distante |
|  |  |  | 3 | Acha que não vai ser bem recebido no serviço de saúde porque tem uma doença mental |
|  |  |  | 4 | Tem dificuldades financeiras |
|  |  |  | 5 | O horário de funcionamento do serviço de saúde é incompatível com suas atividades de trabalho ou domésticas |
|  |  |  | 6 | O plano de saúde não cobre as consultas regulares |
|  |  |  | 7 | Não sabe quem procurar ou aonde ir |
|  |  |  | 8 | Dificuldade de transporte |
|  |  |  | 9 | Outro |
|  |  |  |  | Não aplicável |
| Q11401 | 900 | 1 |  | O(A) Sr(a) faz psicoterapia atualmente por causa da doença mental? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q11402 | 901 | 1 |  | O(A) Sr(a) usa medicamentos ou injeções atualmente por causa da doença mental? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q11403 | 902 | 1 |  | O(A) Sr(a) faz atualmente outro tratamento por causa da doença mental? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q115 | 903 | 1 |  | Em geral, em que grau essa doença mental limita as suas atividades habituais (tais como trabalhar, realizar afazeres domésticos, etc.)? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| Q116 | 904 | 1 |  | Algum médico já lhe deu o diagnóstico de alguma doença no pulmão ou DPOC (Doença Pulmonar Obstrutiva Crônica), tais como  enfisema pulmonar, bronquite crônica ou outro? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q11601 | 905 | 1 |  | Algum médico já lhe deu o diagnóstico de alguma doença no pulmão ou DPOC (Doença Pulmonar Obstrutiva Crônica), tal como  enfisema pulmonar? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q11602 | 906 | 1 |  | Algum médico já lhe deu o diagnóstico de alguma doença no pulmão ou DPOC (Doença Pulmonar Obstrutiva Crônica), tal como bronquite crônica? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q11603 | 907 | 1 |  | Algum médico já lhe deu o diagnóstico de alguma outra doença no pulmão ou DPOC (Doença Pulmonar Obstrutiva Crônica)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q117 | 908 | 2 |  | Que idade o(a) Sr(a) tinha no primeiro diagnóstico da doença no pulmão? (0 = Menos de 1 ano) (Branco = Não aplicável) |
| Q11801 | 910 | 1 |  | O(A) Sr(a) usa medicamentos (inaladores, aerossol ou comprimidos) atualmente por causa da doença no pulmão? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q11802 | 911 | 1 |  | O(A) Sr(a) usa oxigênio atualmente por causa da doença no pulmão? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q11803 | 912 | 1 |  | O(A) Sr(a) faz fisioterapia respiratória atualmente por causa da doença no pulmão? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q11804 | 913 | 1 |  | O(A) Sr(a) faz outra coisa atualmente que não uso de medicamentos (inaladores, aerossol ou comprimidos), oxigênio ou fisioterapia respiratória por causa da doença no pulmão? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q119 | 914 | 1 |  | Em geral, em que grau a doença do pulmão limita as suas atividades habituais (tais como trabalhar, realizar afazeres domésticos, etc.)? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| Q120 | 915 | 1 |  | Algum médico já lhe deu algum diagnóstico de câncer? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q121 | 916 | 1 |  | No primeiro diagnóstico de câncer, que tipo de câncer o(a) sr(a) tem ou teve? |
|  |  |  | 1 | Pulmão |
|  |  |  | 2 | Intestino |
|  |  |  | 3 | Estômago |
|  |  |  | 4 | Mama (só para mulheres) |
|  |  |  | 5 | Colo de útero (só para mulheres) |
|  |  |  | 6 | Próstata (só para homens) |
|  |  |  | 7 | Pele |
|  |  |  | 8 | Outro |
|  |  |  |  | Não aplicável |
| Q122 | 917 | 2 |  | Que idade o(a) Sr(a) tinha no primeiro diagnóstico de câncer? (Branco = Não aplicável) |
| Q123 | 919 | 1 |  | Em geral, em que grau o câncer ou algum problema provocado pelo câncer limita as suas atividades habituais (tais como trabalhar, realizar afazeres domésticos, etc.)? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| Q124 | 920 | 1 |  | Algum médico já lhe deu o diagnóstico de insuficiência renal crônica? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q125 | 921 | 2 |  | Que idade o(a) Sr(a) tinha no primeiro diagnóstico de insuficiência renal crônica? (0 = Menos de 1 ano) (Branco = Não aplicável) |
| Q12601 | 923 | 1 |  | O(A) Sr(a) toma ou tomou medicamentos por causa da insuficiência renal crônica? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q12602 | 924 | 1 |  | O(A) Sr(a) faz ou fez hemodiálise por causa da insuficiência renal crônica? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q12603 | 925 | 1 |  | O(A) Sr(a) faz ou fez diálise peritoneal por causa da insuficiência renal crônica? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q12604 | 926 | 1 |  | O(A) Sr(a) fez transplante de rins por causa da insuficiência renal crônica? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q12605 | 927 | 1 |  | O(A) Sr(a) faz ou fez outra coisa por causa da insuficiência renal crônica que não fosse tomar medicamentos, hemodiálise, diálise peritoneal ou transplante de rins? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q127 | 928 | 1 |  | Em geral, em que grau a insuficiência renal crônica limita as suas atividades habituais (tais como trabalhar, realizar afazeres domésticos, etc.)? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| Q128 | 929 | 1 |  | Algum médico já lhe deu o diagnóstico de outra doença crônica, física ou mental, ou doença de longa duração (de mais de 6 meses de duração)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q130 | 930 | 2 |  | Que idade o(a) Sr(a) tinha no primeiro diagnóstico? (0 =  Menos de 1 ano) |
| Q131 | 932 | 1 |  | Em geral, em que grau esta doença limita suas atividades habituais (tais como trabalhar, realizar afazeres domésticos, etc.)? |
|  |  |  | 1 | Não limita |
|  |  |  | 2 | Um pouco |
|  |  |  | 3 | Moderadamente |
|  |  |  | 4 | Intensamente |
|  |  |  | 5 | Muito intensamente |
|  |  |  |  | Não aplicável |
| Q132 | 933 | 1 |  | Nas últimas duas semanas, o(a) Sr(a) fez uso de algum medicamento para dormir? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q133 | 934 | 2 |  | Nas últimas duas semanas, por quantos dias usou o medicamento para dormir? (Branco = Não aplicável) |
| Q134 | 936 | 1 |  | O medicamento que o(a) Sr(a) usa para dormir foi receitado por médico? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| Q135 | 937 | 1 |  | Foi receitado para o(a) Sr(a) mesmo(a)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, foi receitado por médico para outra pessoa |
|  |  |  |  | Não aplicável |
| Q136 | 938 | 1 |  | Quando foi a última vez que o Sr. fez um exame físico/toque retal da próstata? |
|  |  |  | 1 | Menos de 1 ano atrás |
|  |  |  | 2 | De 1 ano a menos de 2 anos |
|  |  |  | 3 | De 2 anos a menos de 3 anos |
|  |  |  | 4 | 3 anos ou mais atrás |
|  |  |  | 5 | Nunca fez |
|  |  |  |  | Não aplicável |
| Q137 | 939 | 2 |  | Qual o principal motivo do Sr. nunca ter feito o exame? |
|  |  |  | 01 | Não acha necessário |
|  |  |  | 02 | Tem vergonha |
|  |  |  | 03 | Nunca foi orientado para fazer o exame |
|  |  |  | 04 | Não sabe quem procurar ou aonde ir |
|  |  |  | 05 | Tem dificuldades financeiras |
|  |  |  | 06 | Tem dificuldades de transporte |
|  |  |  | 07 | Teve dificuldades para marcar consulta |
|  |  |  | 08 | O tempo de espera no serviço de saúde é muito grande |
|  |  |  | 09 | O serviço de saúde é muito distante |
|  |  |  | 10 | O horário de funcionamento do serviço é incompatível com suas atividades de trabalho ou habituais |
|  |  |  | 11 | O plano de saúde não cobre a consulta |
|  |  |  | 12 | Está marcado, mas ainda não realizou |
|  |  |  | 13 | Outro |
|  |  |  |  | Não aplicável |
| MÓDULO R – SAÚDE DA MULHER (mulheres de 18 anos e mais de idade) |  |  |  |  |
| R001 | 941 | 1 |  | Quando foi a última vez que a Sra fez um exame preventivo para câncer de colo do útero? |
|  |  |  | 1 | Menos de 1 ano atrás |
|  |  |  | 2 | De 1 ano a menos de 2 anos |
|  |  |  | 3 | De 2 anos a menos de 3 anos |
|  |  |  | 4 | 3 anos ou mais atrás |
|  |  |  | 5 | Nunca fez |
|  |  |  |  | Não aplicável |
| R002 | 942 | 2 |  | Qual o principal motivo da Sra nunca ter feito um exame preventivo? |
|  |  |  | 01 | Nunca teve relações sexuais |
|  |  |  | 02 | Não acha necessário |
|  |  |  | 03 | Tem vergonha |
|  |  |  | 04 | Nunca foi orientada para fazer o exame |
|  |  |  | 05 | Não sabe quem procurar ou aonde ir |
|  |  |  | 06 | Tem dificuldades financeiras |
|  |  |  | 07 | Tem dificuldades de transporte |
|  |  |  | 08 | Teve dificuldades para marcar consulta |
|  |  |  | 09 | O tempo de espera no serviço de saúde é muito grande |
|  |  |  | 10 | O serviço de saúde é muito distante |
|  |  |  | 11 | O horário de funcionamento do serviço é incompatível com suas atividades de trabalho ou domésticas |
|  |  |  | 12 | O plano de saúde não cobre a consulta |
|  |  |  | 13 | Está marcado, mas ainda não realizou |
|  |  |  | 14 | Outro |
|  |  |  |  | Não aplicável |
| R003 | 944 | 1 |  | O último exame preventivo para câncer do colo do útero foi coberto por algum plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R004 | 945 | 1 |  | A Sra pagou algum valor pelo último exame preventivo para câncer do colo do útero? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R005 | 946 | 1 |  | O último exame preventivo para câncer do colo do útero foi feito através do Sistema Único de Saúde (SUS)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| R006 | 947 | 1 |  | Quando a Sra recebeu o resultado do último exame preventivo? |
|  |  |  | 1 | Menos de 1 mês depois |
|  |  |  | 2 | Entre 1 mês e menos de 3 meses depois |
|  |  |  | 3 | Entre 3 meses e menos de 6 meses depois |
|  |  |  | 4 | 6 meses ou mais depois |
|  |  |  | 5 | Ainda não recebi |
|  |  |  | 6 | Nunca recebi |
|  |  |  | 7 | Nunca fui buscar |
|  |  |  |  | Não aplicável |
| R007 | 948 | 1 |  | Após receber o resultado do exame, a Sra foi encaminhada a alguma consulta com ginecologista ou outro médico especialista? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não houve encaminhamento, pois todas as minhas consultas por este motivo foram com médico especialista |
|  |  |  |  | Não aplicável |
| R008 | 949 | 1 |  | A Sra foi à consulta? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R009 | 950 | 2 |  | Qual o principal motivo da Sra não ter ido à consulta? |
|  |  |  | 01 | A consulta está marcada, mas ainda não foi à consulta |
|  |  |  | 02 | Não achou necessário |
|  |  |  | 03 | Não sabia quem procurar ou aonde ir |
|  |  |  | 04 | Estava com dificuldades financeiras |
|  |  |  | 05 | Teve dificuldades de transporte |
|  |  |  | 06 | Não conseguiu marcar |
|  |  |  | 07 | O tempo de espera no serviço de saúde era muito grande |
|  |  |  | 08 | O plano de saúde não cobria a consulta |
|  |  |  | 09 | O serviço de saúde era muito distante |
|  |  |  | 10 | O horário de funcionamento do serviço de saúde era incompatível com as atividades de trabalho ou domésticas |
|  |  |  | 11 | Outro |
|  |  |  |  | Não aplicável |
| R010 | 952 | 1 |  | A Sra já foi submetida a cirurgia para retirada do útero? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R011 | 953 | 1 |  | Segundo o médico, qual o motivo da retirada do útero ou ovário? |
|  |  |  | 1 | Mioma uterino |
|  |  |  | 2 | Prolapso do útero (útero caído) |
|  |  |  | 3 | Endometriose |
|  |  |  | 4 | Câncer ginecológico |
|  |  |  | 5 | Complicações da gravidez ou parto |
|  |  |  | 6 | Sangramento vaginal anormal |
|  |  |  | 7 | Outro |
|  |  |  |  | Não aplicável |
| R012 | 954 | 2 |  | Que idade a Sra tinha quando foi submetida à cirurgia? |
|  |  |  | 00 a 99 | Anos |
|  |  |  |  | Não aplicável |
| R013 | 956 | 1 |  | Quando foi a última vez que um médico ou enfermeiro fez o exame clínico das suas mamas? |
|  |  |  | 1 | Menos de 1 ano atrás |
|  |  |  | 2 | De 1 ano a menos de 2 anos atrás |
|  |  |  | 3 | De 2 anos a menos de 3 anos atrás |
|  |  |  | 4 | 3 anos ou mais atrás |
|  |  |  | 5 | Nunca fez |
|  |  |  |  | Não aplicável |
| R014 | 957 | 1 |  | Algum médico já lhe solicitou um exame de mamografia? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R015 | 958 | 1 |  | A Sra fez o exame de mamografia? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R016 | 959 | 2 |  | Qual o principal motivo da Sra não ter feito o exame de mamografia? |
|  |  |  | 01 | O exame está marcado, mas ainda não fez o exame |
|  |  |  | 02 | Não achou necessário |
|  |  |  | 03 | Não sabia onde realizar o exame |
|  |  |  | 04 | Não conseguiu marcar |
|  |  |  | 05 | Estava com dificuldades financeiras |
|  |  |  | 06 | Teve dificuldades de transporte |
|  |  |  | 07 | O tempo de espera no serviço de saúde era muito grande |
|  |  |  | 08 | O serviço de saúde era muito distante |
|  |  |  | 09 | O horário de funcionamento do serviço de saúde era incompatível com as suas atividades de trabalho e domésticas |
|  |  |  | 10 | O plano de saúde não cobria a mamografia |
|  |  |  | 11 | Outro |
|  |  |  |  | Não aplicável |
| R017 | 961 | 1 |  | Quando foi a última vez que a Sra fez um exame de mamografia? |
|  |  |  | 1 | Menos de 1 ano atrás |
|  |  |  | 2 | De 1 ano a menos de 2 anos |
|  |  |  | 3 | De 2 anos a menos de 3 anos |
|  |  |  | 4 | 3 anos ou mais atrás |
|  |  |  |  | Não aplicável |
| R018 | 962 | 1 |  | A última mamografia foi coberta por algum plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R019 | 963 | 1 |  | A Sra pagou algum valor pela última mamografia? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R020 | 964 | 1 |  | A última mamografia foi feita através do Sistema Único de Saúde (SUS)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| R021 | 965 | 1 |  | Quando a Sra recebeu o resultado do exame de mamografia? |
|  |  |  | 1 | Menos de 1 mês depois |
|  |  |  | 2 | Entre 1 mês e menos de 3 meses depois |
|  |  |  | 3 | Entre 3 meses e menos de 6 meses depois |
|  |  |  | 4 | 6 meses ou mais depois |
|  |  |  | 5 | Ainda não recebi |
|  |  |  | 6 | Nunca recebi |
|  |  |  | 7 | Nunca fui buscar |
|  |  |  |  | Não aplicável |
| R022 | 966 | 1 |  | Após receber o resultado da mamografia, a Sra foi encaminhada para consulta com médico especialista? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não houve encaminhamento, pois todas as minhas consultas por este motivo foram com médico especialista |
|  |  |  |  | Não aplicável |
| R023 | 967 | 1 |  | A Sra foi à consulta com o especialista? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R024 | 968 | 2 |  | Qual o principal motivo da Sra não ter ido à consulta com o especialista? |
|  |  |  | 01 | A consulta está marcada, mas ainda não foi à consulta |
|  |  |  | 02 | Não conseguiu marcar |
|  |  |  | 03 | Não achou necessário |
|  |  |  | 04 | Não sabia quem procurar ou aonde ir |
|  |  |  | 05 | Estava com dificuldades financeiras |
|  |  |  | 06 | Teve dificuldades de transporte |
|  |  |  | 07 | O tempo de espera no serviço de saúde era muito grande |
|  |  |  | 08 | O plano de saúde não cobria a consulta |
|  |  |  | 09 | O serviço de saúde era muito distante |
|  |  |  | 10 | O horário de funcionamento do serviço de saúde era incompatível com as atividades de trabalho ou domésticas |
|  |  |  | 11 | Outro |
|  |  |  |  | Não aplicável |
| R025 | 970 | 2 |  | Com que idade a Sra ficou menstruada pela primeira vez? |
|  |  |  | 01 a 99 | Anos |
|  |  |  | 00 | Não Sabe |
|  |  |  |  | Não aplicável |
| R026 | 972 | 1 |  | A Sra ainda fica menstruada? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R027 | 973 | 2 |  | Com que idade a Sra parou de menstruar? |
|  |  |  | 01 a 99 | Anos |
|  |  |  | 00 | Não Sabe |
|  |  |  |  | Não aplicável |
| R028 | 975 | 1 |  | A Sra já entrou na menopausa? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sei |
|  |  |  |  | Não aplicável |
| R029 | 976 | 1 |  | Alguma vez a Sra fez  ou faz tratamento hormonal para alívio dos sintomas da menopausa (com comprimidos, adesivos, gel ou injeções)? |
|  |  |  | 1 | Sim, faz atualmente |
|  |  |  | 2 | Sim,  já fez mas não faz mais |
|  |  |  | 3 | Não, nunca fez |
|  |  |  |  | Não aplicável |
| R030 | 977 | 1 |  | Este medicamento foi receitado por médico? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R031 | 978 | 1 |  | Nos últimos 12 meses, a Sra teve relações sexuais? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R032 | 979 | 1 |  | Nos últimos 12 meses, a Sra participou de grupo de planejamento familiar? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R033 | 980 | 1 |  | E o seu parceiro participou de grupo de planejamento familiar? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R034 | 981 | 1 |  | A Sra usa algum método para evitar a gravidez atualmente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R035 | 982 | 1 |  | Qual o principal motivo de não evitar a gravidez? |
|  |  |  | 1 | Quer engravidar ou não se incomoda de engravidar |
|  |  |  | 2 | Por motivos religiosos |
|  |  |  | 3 | Não sabe como evitar |
|  |  |  | 4 | Não sabe aonde ir ou quem procurar para lhe dar orientações |
|  |  |  | 5 | Está grávida |
|  |  |  | 6 | Ligou as trompas |
|  |  |  | 7 | O companheiro fez vasectomia |
|  |  |  | 8 | Não tem relações sexuais com homens |
|  |  |  | 9 | Outro |
|  |  |  |  | Não aplicável |
| R03601 | 983 | 1 |  | A Sra usa pílula para evitar a gravidez atualmente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R03602 | 984 | 1 |  | A Sra usa tabela para evitar a gravidez atualmente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R03603 | 985 | 1 |  | O seu parceiro usa camisinha masculina para evitar a gravidez atualmente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R03604 | 986 | 1 |  | A Sra usa camisinha feminina para evitar a gravidez atualmente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R03605 | 987 | 1 |  | A Sra usa diafragma feminina para evitar a gravidez atualmente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R03606 | 988 | 1 |  | A Sra usa diu para evitar a gravidez atualmente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R03607 | 989 | 1 |  | A Sra usa contraceptivo injetável  para evitar a gravidez atualmente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R03608 | 990 | 1 |  | A Sra usa Implantes (Norplant) para evitar a gravidez atualmente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R03609 | 991 | 1 |  | A Sra usa creme/óvulo para evitar a gravidez atualmente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R03610 | 992 | 1 |  | A Sra usa pílula do dia seguinte (contracepção de emergência) para evitar a gravidez atualmente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R03611 | 993 | 1 |  | A Sra usa outro método que não os citados anteriormente para evitar a gravidez atualmente? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R037 | 994 | 1 |  | A Sra e/ou seu companheiro já fizeram ou fazem algum tratamento para engravidar? |
|  |  |  | 1 | Sim, fazem atualmente |
|  |  |  | 2 | Sim, já fizeram |
|  |  |  | 3 | Nunca fizeram |
|  |  |  |  | Não aplicável |
| R038 | 995 | 1 |  | Há quanto tempo a Sra está tentando engravidar? |
|  |  |  | 1 | Há menos de 6 meses |
|  |  |  | 2 | De 6 meses a menos de 1 ano |
|  |  |  | 3 | Há 1 ano ou mais |
|  |  |  |  | Não aplicável |
| R039 | 996 | 1 |  | Durante a sua vida, a sra já ficou grávida (mesmo que a gravidez não tenha chegado até o final)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R040 | 997 | 2 |  | Com que idade a Sra teve a sua primeira gravidez? |
|  |  |  | 01 a 99 | Anos |
|  |  |  | 00 | Não sabe |
|  |  |  |  | Não aplicável |
| R041 | 999 | 1 |  | A Sra já teve algum aborto espontâneo? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R04101 | 1000 | 2 |  | Quantos? |
|  |  |  | 01 a 99 | Abortos |
|  |  |  |  | Não aplicável |
| R042 | 1002 | 1 |  | A Sra já teve algum aborto provocado? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| R04201 | 1003 | 2 |  | Quantos? |
|  |  |  | 01 a 99 | Abortos |
|  |  |  |  | Não aplicável |
| R043 | 1005 | 2 |  | Quantos partos a Sra já teve? |
|  |  |  | 01 a 99 | Partos |
|  |  |  | 00 | Nenhum |
|  |  |  |  | Não aplicável |
| R044 | 1007 | 2 |  | Quantos partos foram cesarianas? |
|  |  |  | 01 a 99 | Partos |
|  |  |  | 00 | Nenhum |
|  |  |  |  | Não aplicável |
| R045 | 1009 | 2 |  | Quantos filhos nasceram vivos (ou seja, que apresentaram algum sinal de vida ao nascer)? |
|  |  |  | 01 a 99 | Filhos vivos |
|  |  |  | 00 | Nenhum |
|  |  |  |  | Não aplicável |
| R046 | 1011 | 2 |  | Destes filhos nascidos vivos, quantos já morreram? |
|  |  |  | 01 a 99 | Filhos |
|  |  |  | 00 | Nenhum |
|  |  |  |  | Não aplicável |
| R047 | 1013 | 2 |  | Destes filhos nascidos vivos, quantos nasceram com peso menor que dois quilos e meio? |
|  |  |  | 01 a 99 | Filhos |
|  |  |  | 00 | Nenhum |
|  |  |  |  | Não aplicável |
| R048 | 1015 | 2 |  | Destes filhos nascidos vivos, quantos nasceram antes do tempo, isto é antes de completar 9 meses de gestação? |
|  |  |  | 01 a 99 | Filhos |
|  |  |  | 00 | Nenhum |
|  |  |  |  | Não aplicável |
| R04901 | 1017 | 2 |  | Em que dia foi o último parto? |
|  |  |  | 01 a 31 | Dia |
|  |  |  |  | Não aplicável |
| R04902 | 1019 | 2 |  | Em que mês foi o último parto? |
|  |  |  | 01 a 12 | Mês |
|  |  |  |  | Não aplicável |
| R04903 | 1021 | 4 |  | Em que ano foi o último parto? |
|  |  |  | 1900 a 2013 | Ano |
|  |  |  |  | Não aplicável |
| MÓDULO S – ATENDIMENTO PRÉ-NATAL |  |  |  |  |
| S001 | 1025 | 1 |  | Na última vez que a Sra esteve grávida, a Sra fez pré-natal? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S002 | 1026 | 1 |  | Na última vez que a Sra esteve grávida a Sra recebeu o cartão de pré-natal? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S003 | 1027 | 2 |  | Com quantas semanas de gravidez a Sra iniciou o pré-natal? |
|  |  |  | 01 a 45 | Semanas |
|  |  |  | 88 | Não sabe |
|  |  |  |  | Não aplicável |
| S004 | 1029 | 2 |  | Quantas consultas de pré-natal a Sra teve? |
|  |  |  | 01 a 99 | Consultas |
|  |  |  |  | Não aplicável |
| S005 | 1031 | 1 |  | Onde foi realizada a maioria das consultas do pré-natal? |
|  |  |  | 1 | Unidade básica de saúde (posto ou centro de saúde ou unidade de saúde da família) |
|  |  |  | 2 | Centro de Especialidades, Policlínica pública ou PAM Posto de Assistência Médica |
|  |  |  | 3 | Hospital público/ambulatório |
|  |  |  | 4 | Consultório particular ou Clínica privada |
|  |  |  | 5 | Ambulatório ou consultório de empresa ou sindicato |
|  |  |  | 6 | Outro |
|  |  |  |  | Não aplicável |
| S006 | 1032 | 1 |  | As consultas do pré-natal foram cobertas por algum plano de saúde? |
|  |  |  | 1 | Sim, todas |
|  |  |  | 2 | Sim, algumas |
|  |  |  | 3 | Não, nenhuma |
|  |  |  |  | Não aplicável |
| S007 | 1033 | 1 |  | A Sra pagou algum valor pelas consultas do pré-natal? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S008 | 1034 | 1 |  | As consultas do pré-natal foram feitas através do Sistema Único de Saúde (SUS)? |
|  |  |  | 1 | Sim, todas |
|  |  |  | 2 | Sim, algumas |
|  |  |  | 3 | Não, nenhuma |
|  |  |  | 4 | Não sabe |
|  |  |  |  | Não aplicável |
| S009 | 1035 | 1 |  | Quem a atendeu na maioria das consultas? |
|  |  |  | 1 | Médico |
|  |  |  | 2 | Enfermeira |
|  |  |  | 3 | Técnico ou auxiliar de enfermagem |
|  |  |  | 4 | Parteira |
|  |  |  | 5 | Outro |
|  |  |  |  | Não aplicável |
| S01001 | 1036 | 1 |  | Durante as consultas de pré-natal, a Sra recebeu algum aconselhamento para não faltar às consultas agendadas? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S01002 | 1037 | 1 |  | Durante as consultas de pré-natal, a Sra recebeu algum aconselhamento para manter uma alimentação saudável? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S01003 | 1038 | 1 |  | Durante as consultas de pré-natal, a Sra recebeu algum aconselhamento para não fumar? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S01004 | 1039 | 1 |  | Durante as consultas de pré-natal, a Sra recebeu algum aconselhamento para não beber? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S01005 | 1040 | 1 |  | Durante as consultas de pré-natal, a Sra recebeu algum aconselhamento para não fazer uso de tintura/alisamento de cabelo? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S01101 | 1041 | 1 |  | Durante as consultas de pré-natal, a Sra recebeu alguma orientação sobre sinais de trabalho de parto? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S01102 | 1042 | 1 |  | Durante as consultas de pré-natal, a Sra recebeu  alguma orientação sobre sinais de risco na gravidez? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S01103 | 1043 | 1 |  | Durante as consultas de pré-natal, a Sra recebeu  alguma orientação sobre aleitamento materno? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S012 | 1044 | 1 |  | Durante o pré-natal a Sra foi informada sobre a qual serviço de saúde a Sra deveria ir no momento do parto? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S013 | 1045 | 1 |  | Mediram a sua altura na primeira consulta de pré-natal? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S01401 | 1046 | 1 |  | Durante o pré-natal, em quantas consultas mediram sua pressão arterial? |
|  |  |  | 1 | Todas |
|  |  |  | 2 | Algumas |
|  |  |  | 3 | Nenhuma |
|  |  |  |  | Não aplicável |
| S01402 | 1047 | 1 |  | Durante o pré-natal, em quantas consultas mediram o seu peso? |
|  |  |  | 1 | Todas |
|  |  |  | 2 | Algumas |
|  |  |  | 3 | Nenhuma |
|  |  |  |  | Não aplicável |
| S01403 | 1048 | 1 |  | Durante o pré-natal, em quantas consultas mediram a sua barriga? |
|  |  |  | 1 | Todas |
|  |  |  | 2 | Algumas |
|  |  |  | 3 | Nenhuma |
|  |  |  |  | Não aplicável |
| S01404 | 1049 | 1 |  | Durante o pré-natal, em quantas consultas ouviram o coração do bebê? |
|  |  |  | 1 | Todas |
|  |  |  | 2 | Algumas |
|  |  |  | 3 | Nenhuma |
|  |  |  |  | Não aplicável |
| S01405 | 1050 | 1 |  | Durante o pré-natal, em quantas consultas examinaram suas mamas? |
|  |  |  | 1 | Todas |
|  |  |  | 2 | Algumas |
|  |  |  | 3 | Nenhuma |
|  |  |  |  | Não aplicável |
| S015 | 1051 | 1 |  | Em alguma consulta do pré-natal o médico ou enfermeiro falou que sua pressão estava alta? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S016 | 1052 | 1 |  | O médico ou enfermeiro explicou sobre os riscos da pressão alta para a Sra e para o bebê? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S017 | 1053 | 1 |  | A Sra foi encaminhada para consulta com médico especialista por causa da pressão alta? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S018 | 1054 | 1 |  | A Sra foi à consulta com o médico especialista? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S019 | 1055 | 2 |  | Qual o principal motivo da Sra não ter ido à consulta com o especialista? |
|  |  |  | 01 | Não conseguiu marcar |
|  |  |  | 02 | Não achou necessário |
|  |  |  | 03 | Não sabia quem procurar ou aonde ir |
|  |  |  | 04 | Estava com dificuldades financeiras |
|  |  |  | 05 | O plano de saúde não cobria a consulta |
|  |  |  | 06 | O serviço de saúde era muito distante |
|  |  |  | 07 | O tempo de espera no serviço de saúde era muito grande |
|  |  |  | 08 | O horário de funcionamento do serviço de saúde era incompatível com as atividades de trabalho ou domésticas |
|  |  |  | 09 | Não havia especialista no serviço de saúde |
|  |  |  | 10 | Dificuldade de transporte |
|  |  |  | 11 | Outro |
|  |  |  |  | Não aplicável |
| S020 | 1057 | 1 |  | Durante o pré-natal, a Sra fez exame de sangue? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S021 | 1058 | 1 |  | Em alguma consulta do pré-natal o médico ou enfermeiro falou que seu exame de sangue mostrou açúcar alto (presença de diabetes)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S022 | 1059 | 1 |  | O médico ou enfermeiro explicou os riscos do açúcar alto no sangue para a Sra e seu bebê? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S023 | 1060 | 1 |  | Explicaram sobre a alimentação que a Sra deveria ter para ajudar a controlar o açúcar no sangue? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S024 | 1061 | 1 |  | A Sra foi encaminhada para consulta com médico especialista por causa do diabetes? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S025 | 1062 | 1 |  | A Sra foi à consulta com o médico especialista? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S026 | 1063 | 2 |  | Qual o principal motivo da Sra não ter ido à consulta com o médico especialista? |
|  |  |  | 01 | A consulta está marcada, mas ainda não foi à consulta |
|  |  |  | 02 | Não conseguiu marcar |
|  |  |  | 03 | Não achou necessário |
|  |  |  | 04 | Não sabia quem procurar ou aonde ir |
|  |  |  | 05 | Estava com dificuldades financeiras |
|  |  |  | 06 | Teve dificuldades de transporte |
|  |  |  | 07 | O tempo de espera no serviço de saúde era muito grande |
|  |  |  | 08 | O plano de saúde não cobria a consulta |
|  |  |  | 09 | O serviço de saúde era muito distante |
|  |  |  | 10 | O horário de funcionamento do serviço de saúde era incompatível com as atividades de trabalho ou domésticas |
|  |  |  | 11 | Outro |
|  |  |  |  | Não aplicável |
| S027 | 1065 | 1 |  | Durante o atendimento pré-natal a Sra realizou exame de sangue para sífilis? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| S028 | 1066 | 1 |  | A Sra recebeu o resultado do exame para sífilis antes do parto? |
|  |  |  | 1 | Sim, foi negativo |
|  |  |  | 2 | Sim, foi positivo |
|  |  |  | 3 | Não recebeu o resultado/Não foi informada antes do parto |
|  |  |  |  | Não aplicável |
| S029 | 1067 | 1 |  | A Sra recebeu tratamento para sífilis? |
|  |  |  | 1 | Sim, antes do parto |
|  |  |  | 2 | Sim, depois do parto |
|  |  |  | 3 | Não |
|  |  |  |  | Não aplicável |
| S030 | 1068 | 1 |  | A Sra foi orientada a usar preservativo? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S031 | 1069 | 1 |  | Foi pedido exame de sífilis para o seu parceiro? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S032 | 1070 | 1 |  | O seu parceiro foi tratado? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S033 | 1071 | 1 |  | Durante seu pré-natal, foi solicitado o teste para HIV? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| S034 | 1072 | 1 |  | A Sra fez o teste de HIV? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, pois já sabia que estava infectada pelo HIV |
|  |  |  | 3 | Não |
|  |  |  |  | Não aplicável |
| S035 | 1073 | 1 |  | Durante o atendimento pré-natal a Sra realizou exame de urina? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S036 | 1074 | 2 |  | Durante o pré-natal, quantos exames de ultrasonografia foram solicitados? |
|  |  |  | 01 a 99 | Exames |
|  |  |  | 00 | Nenhum |
|  |  |  |  | Não aplicável |
| S037 | 1076 | 1 |  | A Sra conseguiu realizar os exames de ultrassonografia solicitados? |
|  |  |  | 1 | Sim, todos |
|  |  |  | 2 | Sim, alguns |
|  |  |  | 3 | Não, nenhum |
|  |  |  |  | Não aplicável |
| S038 | 1077 | 2 |  | Qual o principal motivo da Sra não ter conseguido fazer todos os exames de ultras-sonografia solicitados? |
|  |  |  | 01 | Não conseguiu marcar |
|  |  |  | 02 | Não achou necessário |
|  |  |  | 03 | Não sabia quem procurar ou aonde ir |
|  |  |  | 04 | Estava com dificuldades financeiras |
|  |  |  | 05 | Teve dificuldades de transporte |
|  |  |  | 06 | O serviço de saúde era muito distante |
|  |  |  | 07 | O tempo de espera no serviço de saúde era muito grande |
|  |  |  | 08 | O horário de funcionamento do serviço de saúde era incompatível com as atividades de trabalho ou domésticas |
|  |  |  | 09 | Não havia especialista no serviço de saúde para fazer o exame |
|  |  |  | 10 | Não havia equipamento disponível no serviço de saúde |
|  |  |  | 11 | O plano de saúde não cobria todos os exames |
|  |  |  | 12 | Outro |
|  |  |  |  | Não aplicável |
| S039 | 1079 | 1 |  | Os exames de ultrassonografia foram cobertos por algum plano de saúde? |
|  |  |  | 1 | Sim, todos |
|  |  |  | 2 | Sim, alguns |
|  |  |  | 3 | Não, nenhum |
|  |  |  |  | Não aplicável |
| S040 | 1080 | 1 |  | A Sra pagou algum valor pelos exames de ultrassonografia? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S041 | 1081 | 1 |  | Os exames de ultrassonografia foram feitos através do Sistema Único de Saúde (SUS)? |
|  |  |  | 1 | Sim, todos |
|  |  |  | 2 | Sim, alguns |
|  |  |  | 3 | Não, nenhum |
|  |  |  | 4 | Não sabe |
|  |  |  |  | Não aplicável |
| S042 | 1082 | 1 |  | Quanto tempo antes do parto foi a sua última consulta de pré-natal? |
|  |  |  | 1 | Menos de  7 dias |
|  |  |  | 2 | De 7 a 14 dias |
|  |  |  | 3 | De 15 a 30 dias |
|  |  |  | 4 | Mais de 30 dias |
|  |  |  | 5 | Não sabe, não lembra |
|  |  |  |  | Não aplicável |
| S043 | 1083 | 2 |  | Com quantas semanas de gravidez a Sra estava na última consulta de pré-natal? |
|  |  |  | 01 a 45 | Semanas |
|  |  |  | 88 | Não sabe |
|  |  |  |  | Não aplicável |
| S044 | 1085 | 3 |  | Qual o seu peso (kg) antes de engravidar? |
|  |  |  | 001 a 999 | Quilogramas |
|  |  |  | 000 | Não sabe |
|  |  |  |  | Não aplicável |
| S045 | 1088 | 3 |  | Quantos quilos (kg) a Sra engordou na gestação? |
|  |  |  | 001 a 887 | Quilogramas |
|  |  |  | 000 | Não sabe |
|  |  |  | 888 | Não engordou |
|  |  |  |  | Não aplicável |
| S046 | 1091 | 1 |  | Quem a atendeu no último parto? |
|  |  |  | 1 | Médico |
|  |  |  | 2 | Enfermeira |
|  |  |  | 3 | Parteira |
|  |  |  | 4 | Auxiliar de enfermagem |
|  |  |  | 5 | Estudantes de enfermagem ou medicina |
|  |  |  | 6 | Doula |
|  |  |  | 7 | Outra pessoa (parente, amigo, vizinho) sem treinamento |
|  |  |  | 8 | Ninguém |
|  |  |  |  | Não aplicável |
| S047 | 1092 | 1 |  | Onde foi realizado o seu último parto? |
|  |  |  | 1 | Hospital ou maternidade |
|  |  |  | 2 | Casa de parto |
|  |  |  | 3 | Outro tipo de serviço de saúde |
|  |  |  | 4 | Em casa |
|  |  |  | 5 | Outro |
|  |  |  |  | Não aplicável |
| S048 | 1093 | 1 |  | O parto foi realizado no estabelecimento de saúde indicado no pré-natal? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não houve indicação |
|  |  |  |  | Não aplicável |
| S049 | 1094 | 1 |  | O parto foi realizado no primeiro estabelecimento de saúde que procurou? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S050 | 1095 | 2 |  | Quantos estabelecimentos de saúde a Sra teve que ir até conseguir a internação para o parto? |
|  |  |  | 01 a 99 | Estabelecimentos |
|  |  |  |  | Não aplicável |
| S051 | 1097 | 1 |  | O parto foi coberto por algum plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S052 | 1098 | 1 |  | A Sra pagou algum valor pelo parto? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S053 | 1099 | 1 |  | O parto foi feito através do Sistema Único de Saúde (SUS)? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| S054 | 1100 | 1 |  | O seu companheiro ou alguma pessoa da família, ou amiga ficou com a Sra durante o trabalho de parto? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S055 | 1101 | 1 |  | Por que a Sra não teve acompanhante durante o trabalho de parto? |
|  |  |  | 1 | Não sabia que podia |
|  |  |  | 2 | Não quis |
|  |  |  | 3 | Não deixaram |
|  |  |  | 4 | Não tinha quem a acompanhasse |
|  |  |  |  | Não aplicável |
| S056 | 1102 | 1 |  | O seu parto foi: |
|  |  |  | 1 | Vaginal |
|  |  |  | 2 | Cesáreo |
|  |  |  |  | Não aplicável |
| S057 | 1103 | 1 |  | A cesariana foi marcada com antecedência, durante o pré-natal? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| S058 | 1104 | 1 |  | Qual o principal motivo da Sra ter tido parto cesáreo? |
|  |  |  | 1 | Já tinha um parto cesáreo anterior |
|  |  |  | 2 | Queria ligar as trompas |
|  |  |  | 3 | Não queria sentir a dor do parto/Por ser mais conveniente |
|  |  |  | 4 | Por escolha do médico durante o pré-natal |
|  |  |  | 5 | Indicação médica por complicações na gravidez ou no trabalho de parto |
|  |  |  | 6 | Indicação médica porque não entrou em trabalho de parto |
|  |  |  | 7 | Outro |
|  |  |  |  | Não aplicável |
| MÓDULO U – SAÚDE BUCAL |  |  |  |  |
| U001 | 1105 | 1 |  | Com que frequência o(a) Sr(a) escova os dentes? |
|  |  |  | 1 | Nunca escovei os dentes |
|  |  |  | 2 | Não escovo todos os dias |
|  |  |  | 3 | 1 vez por dia |
|  |  |  | 4 | 2 vezes ou mais por dia |
|  |  |  | 5 | Não se aplica/Morador não tinha dente nenhum |
|  |  |  |  | Não aplicável |
| U00201 | 1106 | 1 |  | O(A) Sr(a) usa escova de dente para fazer a limpeza de sua boca? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| U00202 | 1107 | 1 |  | O(A) Sr(a) usa pasta de dente para fazer a limpeza de sua boca? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| U00203 | 1108 | 1 |  | O(A) Sr(a) usa fio dental para fazer a limpeza de sua boca? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| U004 | 1109 | 1 |  | Com que frequência o(a) Sr(a)  troca a sua escova de dente por uma nova? |
|  |  |  | 1 | Com menos de 3 meses |
|  |  |  | 2 | Entre 3 meses e menos de 6 meses |
|  |  |  | 3 | Entre 6 meses e menos de 1 ano |
|  |  |  | 4 | Com mais de um ano |
|  |  |  | 5 | Nunca trocou |
|  |  |  |  | Não aplicável |
| U005 | 1110 | 1 |  | Em geral, como o(a) Sr(a)  avalia sua saúde bucal (dentes e gengivas)? |
|  |  |  | 1 | Muito Boa |
|  |  |  | 2 | Boa |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| U006 | 1111 | 1 |  | Que grau de dificuldade o(a) Sr(a)  tem para se alimentar por causa de problemas com seus dentes ou dentadura? |
|  |  |  | 1 | Nenhum |
|  |  |  | 2 | Leve |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Intenso |
|  |  |  | 5 | Muito intenso |
|  |  |  |  | Não aplicável |
| U009 | 1112 | 2 |  | Qual o principal motivo da sua última consulta ao dentista? |
|  |  |  | 01 | Limpeza, revisão, manutenção ou prevenção |
|  |  |  | 02 | Dor de dente |
|  |  |  | 03 | Extração |
|  |  |  | 04 | Tratamento dentário |
|  |  |  | 05 | Problema na gengiva |
|  |  |  | 06 | Tratamento de ferida na boca |
|  |  |  | 07 | Implante dentário |
|  |  |  | 08 | Aparelho nos dentes (ortodôntico) |
|  |  |  | 09 | Colocação/manutenção de prótese ou dentadura |
|  |  |  | 10 | Fazer radiografia |
|  |  |  | 11 | Fazer o orçamento do tratamento |
|  |  |  | 12 | Outro |
|  |  |  |  | Não aplicável |
| U010 | 1114 | 2 |  | Onde foi a última consulta odontológica? |
|  |  |  | 01 | Unidade básica de saúde (posto ou centro de saúde ou unidade de saúde da família) |
|  |  |  | 02 | Centro de Especialidades, Policlínica pública ou PAM - Posto de Assistência Médica |
|  |  |  | 03 | UPA (Unidade de Pronto Atendimento) |
|  |  |  | 04 | CEO - Centro de Especialidades Odontológicas |
|  |  |  | 05 | Outro tipo de Pronto Atendimento Público (24 horas) |
|  |  |  | 06 | Pronto-socorro ou emergência de hospital público |
|  |  |  | 07 | Hospital público/ambulatório |
|  |  |  | 08 | Consultório particular ou Clínica privada |
|  |  |  | 09 | Ambulatório ou consultório de empresa ou sindicato |
|  |  |  | 10 | Pronto-atendimento ou emergência de hospital privado |
|  |  |  | 11 | Outro |
|  |  |  |  | Não aplicável |
| U011 | 1116 | 1 |  | O local onde o(a) Sr(a) teve atendimento odontológico fica: |
|  |  |  | 1 | Na mesma cidade que o(a) Sr(a) mora |
|  |  |  | 2 | Em outra cidade |
|  |  |  |  | Não aplicável |
| U014 | 1117 | 1 |  | Como o(a) Sr(a) conseguiu a consulta odontológica? |
|  |  |  | 1 | Foi direto ao serviço de saúde, sem marcar consulta |
|  |  |  | 2 | Agendou a consulta previamente |
|  |  |  | 3 | Foi encaminhado(a) ou ajudado(a) por equipe de saúde da família |
|  |  |  | 4 | Foi encaminhado(a) ou ajudado(a) pela Unidade Básica de Saúde |
|  |  |  | 5 | Foi encaminhado(a) por outro serviço ou profissional de saúde |
|  |  |  | 6 | Outro |
|  |  |  |  | Não aplicável |
| U015 | 1118 | 1 |  | Como foi feito o agendamento? |
|  |  |  | 1 | Deixou agendado em consulta anterior |
|  |  |  | 2 | Por meio de visita à unidade de saúde para marcação de consulta |
|  |  |  | 3 | Por telefone |
|  |  |  | 4 | Agendamento virtual, pela internet |
|  |  |  | 5 | Outra forma |
|  |  |  |  | Não aplicável |
| U01701 | 1119 | 2 |  | Quantas horas no total que o(a) Sr(a) ficou em fila de espera desde a hora que chegou ao serviço de saúde até conseguir o atendimento com dentista? |
|  |  |  | 00 | - |
|  |  |  | 01 a 99 | Horas |
|  |  |  |  | Não aplicável |
| U01702 | 1121 | 2 |  | Quantas horas no total que o(a) Sr(a) ficou em fila de espera desde a hora que chegou ao serviço de saúde até conseguir o atendimento com dentista? |
|  |  |  | 00 | - |
|  |  |  | 01 a 59 | Minutos |
|  |  |  |  | Não aplicável |
| U01801 | 1123 | 2 |  | Quantas horas durou a consulta odontológica? |
|  |  |  | 00 | - |
|  |  |  | 01 a 99 | Horas |
|  |  |  |  | Não aplicável |
| U01802 | 1125 | 2 |  | Quantos minutos durou a consulta odontológica? |
|  |  |  | 00 | - |
|  |  |  | 01 a 59 | Minutos |
|  |  |  |  | Não aplicável |
| U019 | 1127 | 1 |  | A consulta odontológica foi coberta por algum plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| U020 | 1128 | 1 |  | O(a) Sr(a) pagou algum valor pela consulta odontológica? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| U021 | 1129 | 1 |  | A consulta odontológica foi feita pelo SUS? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| U022 | 1130 | 1 |  | De forma geral, como o(a) Sr(a) avalia o atendimento recebido? |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| U023 | 1131 | 1 |  | Lembrando-se dos seus dentes de cima, o(a) Sr(a)  perdeu algum dente? |
|  |  |  | 1 | Não |
|  |  |  | 2 | Sim, perdi |
|  |  |  | 3 | Sim, perdi todos os dentes de cima |
|  |  |  |  | Não aplicável |
| U02301 | 1132 | 2 |  | Especifique quantos dentes (U023 item 2 - Sim, perdi) |
|  |  |  | 01 a 16 | Dentes |
|  |  |  |  | Não aplicável |
| U024 | 1134 | 1 |  | Lembrando-se dos seus dentes de baixo, o(a) Sr(a)  perdeu algum dente? |
|  |  |  | 1 | Não |
|  |  |  | 2 | Sim, perdi |
|  |  |  | 3 | Sim, todos os dentes de baixo |
|  |  |  |  | Não aplicável |
| U02401 | 1135 | 2 |  | Especifique quantos dentes (U024 item 2 - Sim, perdi) |
|  |  |  | 01 a 16 | Dentes |
|  |  |  |  | Não aplicável |
| U025 | 1137 | 1 |  | O(a) Sr(a)  usa algum tipo de prótese dentária (dente artificial)? |
|  |  |  | 1 | Não |
|  |  |  | 2 | Sim, para substituir um dente |
|  |  |  | 3 | Sim, para substituir mais de um dente |
|  |  |  | 4 | Sim, prótese dentária total (dentadura/chapa) em cima |
|  |  |  | 5 | Sim, prótese dentária total (dentadura/chapa) em baixo |
|  |  |  | 6 | Sim, próteses dentárias totais (dentaduras/chapas) em cima e em baixo |
|  |  |  |  | Não aplicável |
| MÓDULO X – ATENDIMENTO MÉDICO |  |  |  |  |
| X001 | 1138 | 1 |  | Quando foi a última vez que o(a) Sr(a) consultou um médico? |
|  |  |  | 1 | Há menos de 2 semanas |
|  |  |  | 2 | Entre 15 dias e um mês |
|  |  |  | 3 | Entre um mês e 3 meses atrás |
|  |  |  | 4 | Entre três meses e um ano |
|  |  |  | 5 | Há mais de um ano |
|  |  |  | 6 | Nunca foi ao médico |
|  |  |  |  | Não aplicável |
| X002 | 1139 | 1 |  | Por qual motivo o(a) Sr(a) precisou consultar um médico? |
|  |  |  | 1 | Acidente ou lesão |
|  |  |  | 2 | Continuação de tratamento ou terapia |
|  |  |  | 3 | Consulta pré-natal |
|  |  |  | 4 | Exame médico periódico |
|  |  |  | 5 | Outro exame médico (admissional, para carteira de motorista, etc.) |
|  |  |  | 6 | Problema de saúde mental |
|  |  |  | 7 | Doença ou outro problema de saúde |
|  |  |  | 8 | Outro |
|  |  |  |  | Não aplicável |
| X003 | 1140 | 2 |  | Onde procurou o primeiro atendimento médico por este motivo? |
|  |  |  | 01 | Unidade básica de saúde (posto ou centro de saúde ou unidade de saúde da família) |
|  |  |  | 02 | Centro de Especialidades, Policlínica pública ou PAM - Posto de Assistência Médica |
|  |  |  | 03 | CAPS - Centro de Atenção Psicossocial |
|  |  |  | 04 | UPA (Unidade de Pronto Atendimento) |
|  |  |  | 05 | Outro tipo de Pronto Atendimento Público (24 horas) |
|  |  |  | 06 | Pronto-socorro ou emergência de hospital público |
|  |  |  | 07 | Hospital público/ambulatório |
|  |  |  | 08 | Consultório particular ou Clínica particular |
|  |  |  | 09 | Ambulatório ou consultório de empresa ou sindicato |
|  |  |  | 10 | Pronto-atendimento ou emergência de hospital privado |
|  |  |  | 11 | No domicílio, com médico particular |
|  |  |  | 12 | No domicílio, com médico da equipe de saúde da família |
|  |  |  | 13 | Outro |
|  |  |  |  | Não aplicável |
| X004 | 1142 | 1 |  | Na primeira vez que procurou atendimento médico por este motivo, o(a) Sr(a) conseguiu ser atendido? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| X005 | 1143 | 2 |  | Quantas vezes voltou a procurar atendimento médico por este motivo? |
|  |  |  | 00 | Nenhuma/Desistiu |
|  |  |  | 01 a 99 | Vezes |
|  |  |  |  | Não aplicável |
| X006 | 1145 | 1 |  | O(a) Sr(a) conseguiu o atendimento médico que precisava? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não, mas continua tentando |
|  |  |  | 3 | Não, desistiu |
|  |  |  |  | Não aplicável |
| X007 | 1146 | 2 |  | Onde conseguiu o atendimento médico por este motivo? |
|  |  |  | 01 | Unidade básica de saúde (posto ou centro de saúde ou unidade de saúde da família) |
|  |  |  | 02 | Centro de Especialidades, Policlínica pública ou PAM - Posto de Assistência Médica |
|  |  |  | 03 | UPA (Unidade de Pronto Atendimento) |
|  |  |  | 04 | CAPS - Centro de Atenção Psicossocial |
|  |  |  | 05 | Outro tipo de Pronto Atendimento Público (24 horas) |
|  |  |  | 06 | Pronto-socorro ou emergência de hospital público |
|  |  |  | 07 | Hospital público/ambulatório |
|  |  |  | 08 | Consultório particular ou Clínica particular |
|  |  |  | 09 | Ambulatório ou consultório de empresa ou sindicato |
|  |  |  | 10 | Pronto-atendimento ou emergência de hospital privado |
|  |  |  | 11 | No domicílio, com médico particular |
|  |  |  | 12 | No domicílio, com médico da equipe de saúde da família |
|  |  |  | 13 | Outro |
|  |  |  |  | Não aplicável |
| X008 | 1148 | 1 |  | Onde fica o serviço de saúde em que o(a) Sr(a) teve a consulta médica? |
|  |  |  | 1 | Na mesma cidade que o(a) Sr(a) mora |
|  |  |  | 2 | Em outra cidade |
|  |  |  |  | Não aplicável |
| X011 | 1149 | 1 |  | Como o(a) Sr(a) conseguiu a consulta médica? |
|  |  |  | 1 | Foi direto ao serviço de saúde, sem marcar consulta. |
|  |  |  | 2 | Agendou a consulta previamente |
|  |  |  | 3 | Foi encaminhado(a) ou ajudado(a) por equipe de saúde da família |
|  |  |  | 4 | Foi encaminhado(a) ou ajudado(a) por Unidade Básica de Saúde |
|  |  |  | 5 | Foi encaminhado(a) por outro serviço ou profissional de saúde |
|  |  |  | 6 | Exame periódico pago ou encaminhado pelo empregador |
|  |  |  | 7 | Atendimento de emergência |
|  |  |  | 8 | Outro |
|  |  |  |  | Não aplicável |
| X012 | 1150 | 1 |  | Como foi feito o agendamento? |
|  |  |  | 1 | Deixou agendado em consulta anterior |
|  |  |  | 2 | Por meio de visita à unidade de saúde para marcação de consulta |
|  |  |  | 3 | Por telefone |
|  |  |  | 4 | Agendamento virtual, pela internet |
|  |  |  | 5 | Outra forma |
|  |  |  |  | Não aplicável |
| X01401 | 1151 | 2 |  | Quantas horas no total que o(a) Sr(a) ficou em fila de espera desde a hora que chegou ao serviço de saúde até conseguir o atendimento com médico? |
|  |  |  | 00 | - |
|  |  |  | 01 a 99 | Horas |
|  |  |  |  | Não aplicável |
| X01402 | 1153 | 2 |  | Quantos minutos no total que o(a) Sr(a) ficou em fila de espera desde a hora que chegou ao serviço de saúde até conseguir o atendimento com médico? |
|  |  |  | 00 | - |
|  |  |  | 01 a 59 | Minutos |
|  |  |  |  | Não aplicável |
| X01501 | 1155 | 2 |  | Quantas horas durou a consulta médica? |
|  |  |  | 00 | - |
|  |  |  | 01 a 99 | Horas |
|  |  |  |  | Não aplicável |
| X01502 | 1157 | 2 |  | Quantos minutos durou a consulta médica? |
|  |  |  | 00 | - |
|  |  |  | 01 a 59 | Minutos |
|  |  |  |  | Não aplicável |
| X016 | 1159 | 1 |  | Que tipo de médico o/a atendeu? |
|  |  |  | 1 | Médico da família ou generalista |
|  |  |  | 2 | Clínico geral |
|  |  |  | 3 | Ginecologista |
|  |  |  | 4 | Médico especialista (cardiologista, nefrologista, oftalmologista, dermatologista, urologista, oncologista, otorrinolaringologista, etc.) |
|  |  |  | 5 | Outro |
|  |  |  |  | Não aplicável |
| X017 | 1160 | 1 |  | A consulta médica foi coberta por plano de saúde? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| X018 | 1161 | 1 |  | O(a) Sr(a) pagou algum valor pela consulta médica? (Entrevistador: Se o(a) entrevistado(a) responder que pagou mas teve reembolso total, marque a opção 2) |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| X019 | 1162 | 1 |  | A consulta médica foi feita pelo SUS? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  | 3 | Não sabe |
|  |  |  |  | Não aplicável |
| X02001 | 1163 | 1 |  | De um modo geral, como o(a) Sr(a) avalia o atendimento recebido quanto à disponibilidade de equipamentos necessários para a consulta médica? |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| X02002 | 1164 | 1 |  | De um modo geral, como o(a) Sr(a) avalia o atendimento recebido quanto ao espaço disponível para a consulta médica? |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| X02003 | 1165 | 1 |  | De um modo geral, como o(a) Sr(a) avalia o atendimento recebido quanto ao tempo gasto com deslocamento? |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| X02004 | 1166 | 1 |  | De um modo geral, como o(a) Sr(a) avalia o atendimento recebido quanto ao tempo de espera até ser atendido? |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| X02005 | 1167 | 1 |  | De um modo geral, como o(a) Sr(a) avalia o atendimento recebido quanto à forma como os atendentes o/a receberam? |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| X02006 | 1168 | 1 |  | De um modo geral, como o(a) Sr(a) avalia o atendimento recebido quanto à limpeza das instalações, incluindo os banheiros? |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| X02201 | 1169 | 1 |  | De um modo geral, como o(a) Sr(a) avalia o atendimento recebido quanto às habilidades do médico para tratá-lo(a)? |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| X02202 | 1170 | 1 |  | De um modo geral, como o(a) Sr(a) avalia o atendimento recebido quanto ao respeito do médico na maneira de atendê-lo(a)? |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| X02203 | 1171 | 1 |  | De um modo geral, como o(a) Sr(a) avalia o atendimento recebido quanto à clareza nas explicações do médico? |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| X02204 | 1172 | 1 |  | De um modo geral, como o(a) Sr(a) avalia o atendimento recebido quanto à disponibilidade de tempo para fazer perguntas sobre o seu problema ou tratamento? |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| X02205 | 1173 | 1 |  | De um modo geral, como o(a) Sr(a) avalia o atendimento recebido quanto à possibilidade de falar em privacidade com o médico? |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| X02206 | 1174 | 1 |  | De um modo geral, como o(a) Sr(a) avalia o atendimento recebido quanto à liberdade em escolher o médico? |
|  |  |  | 1 | Muito bom |
|  |  |  | 2 | Bom |
|  |  |  | 3 | Regular |
|  |  |  | 4 | Ruim |
|  |  |  | 5 | Muito ruim |
|  |  |  |  | Não aplicável |
| X024 | 1175 | 2 |  | Qual o principal motivo do(a) Sr(a) ter desistido de procurar atendimento médico? |
|  |  |  | 01 | Não houve mais necessidade, pois melhorou |
|  |  |  | 02 | Procurou diretamente a farmácia |
|  |  |  | 03 | Não teve mais tempo ou disponibilidade para procurar atendimento |
|  |  |  | 04 | Falta de dinheiro ou dificuldades financeiras |
|  |  |  | 05 | Não conseguiu marcar a consulta ou pegar senha |
|  |  |  | 06 | Nas vezes que procurou, não tinha médico atendendo |
|  |  |  | 07 | Nas vezes que procurou, esperou muito e desistiu |
|  |  |  | 08 | Nas vezes que procurou, o serviço de saúde não estava funcionando |
|  |  |  | 09 | Não podia pagar pela consulta |
|  |  |  | 10 | O plano de saúde não cobria a consulta |
|  |  |  | 11 | Outro |
|  |  |  |  | Não aplicável |
| X02501 | 1177 | 1 |  | O(a) Sr(a) já se sentiu discriminado (a) ou tratado(a) pior do que as outras pessoas no serviço de saúde, por algum médico ou outro profissional de saúde por motivo de falta de dinheiro? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| X02502 | 1178 | 1 |  | O(a) Sr(a) já se sentiu discriminado (a) ou tratado(a) pior do que as outras pessoas no serviço de saúde, por algum médico ou outro profissional de saúde por motivo de classe social? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| X02503 | 1179 | 1 |  | O(a) Sr(a) já se sentiu discriminado (a) ou tratado(a) pior do que as outras pessoas no serviço de saúde, por algum médico ou outro profissional de saúde por motivo de raça/cor? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| X02504 | 1180 | 1 |  | O(a) Sr(a) já se sentiu discriminado (a) ou tratado(a) pior do que as outras pessoas no serviço de saúde, por algum médico ou outro profissional de saúde por tipo de ocupação? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| X02505 | 1181 | 1 |  | O(a) Sr(a) já se sentiu discriminado (a) ou tratado(a) pior do que as outras pessoas no serviço de saúde, por algum médico ou outro profissional de saúde por tipo de doença? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| X02506 | 1182 | 1 |  | O(a) Sr(a) já se sentiu discriminado (a) ou tratado(a) pior do que as outras pessoas no serviço de saúde, por algum médico ou outro profissional de saúde por preferência sexual? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| X02507 | 1183 | 1 |  | O(a) Sr(a) já se sentiu discriminado (a) ou tratado(a) pior do que as outras pessoas no serviço de saúde, por algum médico ou outro profissional de saúde por religião/crença? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| X02508 | 1184 | 1 |  | O(a) Sr(a) já se sentiu discriminado (a) ou tratado(a) pior do que as outras pessoas no serviço de saúde, por algum médico ou outro profissional de saúde por sexo? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| X02509 | 1185 | 1 |  | O(a) Sr(a) já se sentiu discriminado (a) ou tratado(a) pior do que as outras pessoas no serviço de saúde, por algum médico ou outro profissional de saúde por idade? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| X02510 | 1186 | 1 |  | O(a) Sr(a) já se sentiu discriminado (a) ou tratado(a) pior do que as outras pessoas no serviço de saúde, por algum médico ou outro profissional de saúde por outro motivo? |
|  |  |  | 1 | Sim |
|  |  |  | 2 | Não |
|  |  |  |  | Não aplicável |
| MÓDULO W – INFORMAÇÕES LABORATORIAIS |  |  |  |  |
| W00101 | 1187 | 5 | 3 dígitos e 1 casa decimal | Peso - 1ª pesagem (em kg) |
|  |  |  | 30 a 200 | Quilogramas |
|  |  |  | 999 | Erro |
|  |  |  |  | Não aplicável |
| W00102 | 1192 | 5 | 3 dígitos e 1 casa decimal | Peso - 2ª pesagem (em kg) |
|  |  |  | 30 a 200 | Quilogramas |
|  |  |  | 999 | Erro |
|  |  |  |  | Não aplicável |
| W00103 | 1197 | 5 | 3 dígitos e 1 casa decimal | Peso - Final (em kg) |
|  |  |  | 30 a 200 | Quilogramas |
|  |  |  | 999 | Erro |
|  |  |  |  | Não aplicável |
| W00201 | 1202 | 5 | 3 dígitos e 1 casa decimal | Altura - 1ª medição (em cm) |
|  |  |  | 120 a 210 | Centímetros |
|  |  |  | 999 | Erro |
|  |  |  |  | Não aplicável |
| W00202 | 1207 | 5 | 3 dígitos e 1 casa decimal | Altura - 2ª medição (em cm) |
|  |  |  | 120 a 210 | Centímetros |
|  |  |  | 999 | Erro |
|  |  |  |  | Não aplicável |
| W00203 | 1212 | 5 | 3 dígitos e 1 casa decimal | Altura - Final (em cm) |
|  |  |  | 120 a 210 | Centímetros |
|  |  |  | 999 | Erro |
|  |  |  |  | Não aplicável |
| W00301 | 1217 | 5 | 3 dígitos e 1 casa decimal | Circunferência da cintura - 1ª medição (em cm) |
|  |  |  | 20 a 210 | Centímetros |
|  |  |  |  | Não aplicável |
| W00302 | 1222 | 5 | 3 dígitos e 1 casa decimal | Circunferência da cintura - 2ª medição (em cm) |
|  |  |  | 20 a 210 | Centímetros |
|  |  |  |  | Não aplicável |
| W00303 | 1227 | 5 | 3 dígitos e 1 casa decimal | Circunferência da cintura - Final (em cm) |
|  |  |  | 20 a 210 | Centímetros |
|  |  |  |  | Não aplicável |
| W00401 | 1232 | 3 |  | Pressão arterial sistólica  - 1ª medição (em mmHg) |
|  |  |  | 60 a 290 | mmHg |
|  |  |  | 999 | Erro |
|  |  |  |  | Não aplicável |
| W00402 | 1235 | 3 |  | Pressão arterial diastólica  - 1ª medição (em mmHg) |
|  |  |  | 30 a 200 | mmHg |
|  |  |  | 999 | Erro |
|  |  |  |  | Não aplicável |
| W00403 | 1238 | 3 |  | Pressão arterial sistólica  - 2ª medição (em mmHg) |
|  |  |  | 60 a 290 | mmHg |
|  |  |  | 999 | Erro |
|  |  |  |  | Não aplicável |
| W00404 | 1241 | 3 |  | Pressão arterial diastólica  - 2ª medição (em mmHg) |
|  |  |  | 30 a 200 | mmHg |
|  |  |  | 999 | Erro |
|  |  |  |  | Não aplicável |
| W00405 | 1244 | 3 |  | Pressão arterial sistólica  - 3ª medição (em mmHg) |
|  |  |  | 60 a 290 | mmHg |
|  |  |  | 999 | Erro |
|  |  |  |  | Não aplicável |
| W00406 | 1247 | 3 |  | Pressão arterial diastólica  - 3ª medição (em mmHg) |
|  |  |  | 30 a 200 | mmHg |
|  |  |  | 999 | Erro |
|  |  |  |  | Não aplicável |
| W00407 | 1250 | 5 | 3 dígitos e 1 casa decimal | Pressão arterial sistólica  - Final (em mmHg) |
|  |  |  | 60 a 290 | mmHg |
|  |  |  | 999 | Erro |
|  |  |  |  | Não aplicável |
| W00408 | 1255 | 5 | 3 dígitos e 1 casa decimal | Pressão arterial diastólica  - Final (em mmHg) |
|  |  |  | 30 a 200 | mmHg |
|  |  |  | 999 | Erro |
|  |  |  |  | Não aplicável |
| VARIÁVEIS DE AMOSTRAGEM |  |  |  |  |
| V0028 | 1260 | 14 | 5 dígitos e 8 casas decimais | Peso do domicílio com correção de não entrevista sem calibração pela projeção de população |
| V0029 | 1274 | 14 | 5 dígitos e 8 casas decimais | Peso do morador selecionado com correção de não entrevista sem calibração pela projeção de população para morador selecionado |
| V00281 | 1288 | 14 | 5 dígitos e 8 casas decimais | Peso do domicílio com correção de não entrevista com calibração pela projeção de população - usado no cálculo de indicadores de domicílio |
| V00291 | 1302 | 14 | 5 dígitos e 8 casas decimais | Peso do morador selecionado com correção de não entrevista com calibração pela projeção de população para morador selecionado - usado no cálculo de indicadores de morador selecionado |
| V00282 | 1316 | 9 |  | Projeção da população |
| V00292 | 1325 | 17 | 8 dígitos e 8 casas decimais | Projeção da população obtida com os dados dos moradores dos domicílios da pesquisa - Só aplicável para domicílios com entrevista realizada para morador selecionado |
| V00283 | 1342 | 3 |  | Domínio de pós-estrato 1 |
| V00293 | 1345 | 5 |  | Domínio de pós-estrato 2. Só aplicável para domicílios com entrevista realizada para morador selecionado |
| VARIÁVEIS DERIVADAS DE MORADOR |  |  |  |  |
| VDD004 | 1350 | 1 |  | Nível de instrução mais elevado alcançado (pessoas de 5 anos ou mais de idade) |
|  |  |  | 1 | Sem instrução |
|  |  |  | 2 | Fundamental incompleto ou equivalente |
|  |  |  | 3 | Fundamental completo ou equivalente |
|  |  |  | 4 | Médio incompleto ou equivalente |
|  |  |  | 5 | Médio completo ou equivalente |
|  |  |  | 6 | Superior incompleto ou equivalente |
|  |  |  | 7 | Superior completo |
|  |  |  |  | Não aplicável |
| VDE001 | 1351 | 1 |  | Condição em relação à força de trabalho na semana de referência para pessoas de 14 anos ou mais de idade |
|  |  |  | 1 | Pessoas na força de trabalho |
|  |  |  | 2 | Pessoas fora da força de trabalho |
|  |  |  |  | Não aplicável |
| VDE002 | 1352 | 1 |  | Condição de ocupação na semana de referência para pessoas de 14 anos ou mais de idade |
|  |  |  | 1 | Pessoas Ocupadas |
|  |  |  | 2 | Pessoas desocupadas |
|  |  |  |  | Não aplicável |
| VDDATAM | 1353 | 8 |  | Data de geração do arquivo de microdados. Data ordenada na forma: ano (4 algarismos), mês (2) e dia (2) -  AAAAMMDD |
