library(dplyr)
library(magrittr)

### Exemplo aula 

normal = c(0.55,0.48,7.8,8.72,0.65,1.51,0.55)
benzaldeido = c(0.81,0.56,1.11,0.74,0.77,0.83,0.81)
acetaldeido = c(0.65,13.69,17.11,7.43,5.48,0.99,0.65)

bd1 = data.frame( id=1:length(normal), normal, benzaldeido, acetaldeido )
bd=reshape2::melt( bd1, id.vars=c("id") )
bd

kruskal.test(value~variable, data = bd )


## Exemplos Kruskal Wallis 

head(airquality) 

glimpse(airquality)

airquality %>% group_by( Month ) %>% summarise( media = mean(Ozone, na.rm = T), mediana = median(Ozone, na.rm = T) )
table(airquality$Month)

airquality %>% group_by( Month ) %>% summarise( media = mean(Temp, na.rm = T), mediana = median(Temp, na.rm = T) )
table(airquality$Month)

kruskal.test(Ozone ~ Month, data = airquality) 
kruskal.test(Wind ~ Month, data = airquality) 
kruskal.test(Temp ~ Month, data = airquality) 








