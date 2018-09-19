library(dplyr)
attach(Banco)

data_atual <- Sys.Date()
data_atual

Banco$data_atual <- data_atual
Banco

idade <- round(difftime(data_atual,datanasc)/365.25, digits = 0)
idade

Banco$idade <- idade
Banco

#names mostra os nomes das colunas
names(Banco)

#48 a 90
min(Banco$idade)
max(Banco$idade)
#pergunta se a variavel se é numerica
is.numeric(idade)
#transforma a varivel em numerica
idade <- as.numeric(idade)

fax_etaria <- cut(idade, 
                  breaks=c(47, 56,66,78,88,90), 
                  labels=c(1,2,3,4,5),
                  right=T)
fax_etaria

Banco$fax_etaria <- fax_etaria
Banco
#calcular média
mean(salarin)

#função para limpar nulos (NA) - na.rm NA remove
mean(salarin, na.rm = TRUE)

by(Banco$salário, Banco$sexo, mean)

table(sexo)
table(catemp)

table(sexo,catemp)



library(gmodels)
CrossTable(sexo, catemp, chisq = TRUE)
