#########################   Testes para duas amostras independentes #########################


# Passo 1: Carregar os pacotes 

    
library(dplyr)
library(rstatix)



# Passo 2: Ler o banco de dados 

# Diretorio de trabalho:
setwd("C:/Users/pedro/Dropbox/disciplinas_UEPB/Estatistica_nao_parametrica/Codigos/")

# Carregamento do Banco

dados <- read.csv("Banco.csv", sep=";", comment.char="#")
dados$alvo <- ifelse( dados$Diabetes == "Sim", 1, 0 )

View(dados)                                # Visualiza??o dos dados em janela separada
glimpse(dados)                             # Visualiza??o de um resumo dos dados


# Realiza??o do teste de Qui-quadrado

## Cria??o da tabela de conting?ncia

summary(dados$Faixa_Etaria)

table(dados$Diabetes, dados$Faixa_Etaria  )

dados$Faixa_Etaria <- factor(dados$Faixa_Etaria,
                             levels = c("Menos de 30 anos",
                                        "30 a 50 anos",
                                        "Mais de 50 anos"))

tabela <- table(dados$Diabetes, dados$Faixa_Etaria)
tabela

## Realiza??o do teste

## usando a tabela
qui2 <- chisq.test(tabela)

## entrando com as variaveis 
qui2 <- chisq.test(dados$Faixa_Etaria,dados$Diabetes)

qui2

### Em tabelas 2x2: "correct = TRUE" ativa a correção de Yates


# Passo 3: Análise das frequências esperadas
## Pressuposto: frequências esperadas > 5

qui2$expected


#### Construindo a tabela no R #####

Input =("
Estrategias  Fumou  Nao_Fumou
Comportamental      15      24
Cognitiva       15      21  
Comportamental_Cognitiva 13 43
Nenhuma 22  6
")

M1 = as.matrix(read.table(textConnection(Input),header=TRUE, row.names=1))
M1

qui2 <- chisq.test(M1)
qui2

qui2$expected



### Teste Exato de Fisher ----


Input =("
Frequencia  Sim  Nao
Naive      2      7
experiente       8     4  
")

M1 = as.matrix(read.table(textConnection(Input),header=TRUE, row.names=1))
M1


teste.fisher = fisher.test(M1, alternative = "less") 

rstatix::fisher_test(xtab = M1, alternative = "less")


### Exemplo do tipo de preparacao

Input =("
preparacao  infeccao  Nao_infeccao
iodo_aquoso      14      94
iodo_insoluvel       4      97
")

M1 = as.matrix(read.table(textConnection(Input),header=TRUE, row.names=1))
M1

qui2 <- chisq.test(M1, correct = F)
qui2

qui2$expected


### Teste Exato de Fisher ----


Input =("
Frequencia  Sim  Nao
Naive      2      7
experiente       8     4  
")

M1 = as.matrix(read.table(textConnection(Input),header=TRUE, row.names=1))
M1


teste.fisher = fisher.test(M1, alternative = "less") 

rstatix::fisher_test(xtab = M1, alternative = "less")


