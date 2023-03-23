library(magrittr)
library(dplyr)

## Exemplo simulado teste t-student 

bd1 = data.frame( x = rnorm( 100, mean = 1.1, sd = 1  ),  y = rnorm( 100, mean = 1, sd = 1) )
head(bd1)

## Medias

colMeans(bd1)

### testar normalidade 

## populacao x

shapiro.test(bd1$x) # teste de normalidade
#ks.test(group1$extra)
hist(bd1$x, breaks = 4)

## populacao y

shapiro.test(bd1$y) # teste de normalidade
hist(bd1$y, breaks = 5)

### Teste das variancias homogeneas
var.test(bd1$x,bd1$y) # Variancias homogenias 

## Como as duas populacoes seguem uma distribuicao normal e as variancias entre elas sao iguais
## então podemos usar o teste t-student

t.test(bd1$x,bd1$y)

