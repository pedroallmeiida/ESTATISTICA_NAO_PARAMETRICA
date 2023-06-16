## Exemplo --

#Grupo x: Sociedades com explanações orais ausentes
x = c(13,12,12,10,10,10,10,9,8,8,7,7,7,7,7,6)

#Grupo y: Sociedades com explanação orais presentes
y = c(17,16,15,15,15,14,14,14,13,13,13,12,12,12,12,11,11,10,10,10,8,8,6  )

## Criar os labels para os grupos x e y
# 1: Grupo x
# 2: Grupo y
grupo = c( rep(1,length(x)), rep(2, length(y) )  )

# Juntando os vetores dos grupos x e y em um unico vetor
var = c(x,y)

# Criando um banco de dados com os escores e os grupos ao qual pertencem
bd = data.frame(var,grupo)
bd 

## Ordenando o banco de dados pelos escores em ordem crescente
bd_order = bd[order(var),]
bd_order

## Calcula o posto para o vetor de escores ordenados
posto = rank(bd_order$var)
bd_order$posto = posto # adionando no banco
bd_order$index=seq( 1:length(var) ) # Criando uma variavel de indice

bd_order

library(magrittr) # para usar o operador pipe %>%
library(tidyverse)

Soma_postos = bd_order %>% group_by(grupo) %>% summarise( soma.posto = sum(posto) )
Soma_postos  


### Exemplos praticos ----

## Banco 1: sleep
bd1 = datasets::sleep

?datasets::sleep

bd1 %>% group_by(group) %>% summarise( media = mean(extra), med = median(extra) )


# Vamos verificar se podemos usar o teste t

# 1) Os escores de ambos os grupos tem distribuição normal 
# 2) As variâncias dos escores são iguais para ambos os grupos


### testar normalidade 
group1 = bd1 %>% filter( group == 1 ) %>% select(extra)
shapiro.test(group1$extra) # teste de normalidade
#ks.test(group1$extra)
hist(group1$extra, breaks = 4)

group2 = bd1 %>% filter( group == 2 ) %>% select(extra)
shapiro.test(group2$extra) 
hist(group2$extra, breaks = 4)

### Teste das variancias homogeneas
var.test(group1$extra, group2$extra) # Variancias homogenias 

t.test(group1$extra, group2$extra)

wilcox.test(extra~group, data = bd1)

wilcox.test(group1$extra, group2$extra, data = bd1)

### Exemplo 2 ----


datasets::ToothGrowth
?ToothGrowth

alvo = ifelse(ToothGrowth$len > median(ToothGrowth$len), 1, 0)
bd1 = data.frame(ToothGrowth, alvo)



### testar normalidade 
group1 = bd1 %>% filter( supp == "VC" ) 
shapiro.test(group1$len)
hist(group1$len)


group2 = bd1 %>% filter( supp == "OJ" ) 
shapiro.test(group2$len) 
hist(group2$len)


### Teste das variancias homogeneas
var.test(group1$len, group2$len) # Variancias homogenias 

wilcox.test(len~supp, data = bd1)

