#### Teste McNEMAR ----
#
# obs: No R ele considera a diagonal principal como sendo o que Nao tem mudança
# Trocar Mudança: (A+D) por Mudança:(B+C)

Input =("
Frequencia  Sem_carie  Com_caries
Sem_caries      45      4
Com_caries       17     34  
")


M1 = as.matrix(read.table(textConnection(Input),header=TRUE, row.names=1))
M1

mcnemar.test(M1,  correct = T)


### EXEMPLO 2 
# Suponha que os pesquisadores queiram saber se um determinado 
# video de marketing 
# pode mudar a opiniÃo das pessoas sobre uma determinada lei. 
# Eles pesquisaram 100 pessoas para descobrir se elas apoiam ou nao a lei. 
# Em seguida, eles mostram o video de marketing a todas as 100 pessoas 
# e fazem uma pesquisa novamente quando o video termina.

## Dados
data <- matrix(
               c(30, 12, 40, 18), nrow = 2,
               dimnames = list(
                 "Depois do Video" = c("Apoiam", "Nao Apoiam"),
                 "Antes do Video" = c("Apoiam", "Nao Apoiam"))
               )
data


mcnemar.test(data,  correct = T)



