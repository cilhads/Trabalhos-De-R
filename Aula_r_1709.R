attach(Banco)
selecao_casos = Banco[Banco$sexo == "Masculino" | Banco$catemp == "A",]

subset = subset(Banco, estudo >= 10 & sexo == "Masculino")

library(sqldf)

masculino = sqldf("Select * from Banco where sexo = 'Masculino'")

selecao = sqldf("Select avg(salário) from Banco")

uniao = rbind(Apend_1,Apend_2)

Lazer = c(10)
Apend_2$Lazer = Lazer

library(plyr)

apend = rbind.fill(Apend_1, Apend_2)

chave = merge(Apend_A, Apend_B, by="id", all = TRUE)

merge(Apend_A, Apend_B, by = "id", all.x = TRUE)

merge(Apend_A, Apend_B, by = "id", all.y = TRUE)


