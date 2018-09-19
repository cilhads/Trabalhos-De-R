nome=c("Edmar","Pedro","Matheus")
idade=c(30,28,29)
salario=c(1500,1600,1700)
prestacao=c(680,650,640)
escolaridade=c("MBA","Doutorado","Mestrado")

cadastro <- data.frame(nome, idade, salario, prestacao, escolaridade)
cadastro

filhos = c(1,2,3)
cadastro$filhos = filhos

comprometimento_de_renda = paste(round((prestacao/salario)*100,1),"%")
cadastro$comprometimento_de_renda = comprometimento_de_renda

#----------------------------------------------------------

attach(Ordenar)
Ordenar[order(Ordenar$id),]
Ordenar[order(Ordenar$id, decreasing = FALSE),]
Ordenar[order(Ordenar$id, decreasing = TRUE),]

remover_Ordenar = unique(Ordenar)

remover_duplicados = remover_Ordenar[duplicated(remover_Ordenar$id,
                                                fromLast = FALSE),]

remover_duplicados = remover_Ordenar[!duplicated(remover_Ordenar$id,
                                                fromLast = FALSE),]

#----------------------------------------------------------

attach(Salario)
library(base)
library(stats)
library(dplyr)
agregar = summarise(group_by(Salario,id),
                    salario_m = mean(salario_m),
                    data_pagamento_min = min(data_pagamento),
                    data_pagamento_max = max(data_pagamento),
                    contagem = n())

agregar1 = summarise(group_by(Salario,id),
                    salario_mm = sum(salario_m),
                    data_pagamento_min = min(data_pagamento),
                    data_pagamento_max = max(data_pagamento),
                    media = mean(salario_m),
                    contagem = n())

filtro = filter(agregar1, contagem >= 3)

select(agregar1,id,salario_mm)
select(agregar1, id:data_pagamento_max)
select(agregar, id, data_pagamento_max:contagem)
select(agregar, -(data_pagamento_max:contagem))

transmute(agregar1, 
          salario_novo = salario_mm*0.10,
          contagem_x = contagem*2)

mutate(agregar1,
       salario_novo = salario_mm*0.10,
       contagem_x = contagem*2)

#----------------------------------------------------------
attach(Banco)
data_atual = Sys.Date()
Banco$data_atual = data_atual

idade = difftime(data_atual, datanasc)/365.25
idade = round(idade, digits = 0)
Banco$idade = idade

names(Banco)

is.numeric(idade)
idade = as.numeric(idade)

fax_etaria = cut(idade, breaks = c(47,56,66,76,86,90), 
                 labels = c(1,2,3,4,5), right = T)
Banco$faixa_etaria = fax_etaria

mean(salarin, na.rm = TRUE)
by(Banco$salário, Banco$sexo, mean)

summary(Banco)
table(catemp)
table(sexo)
table(sexo, catemp)

library(gmodels)

CrossTable(sexo, catemp, chisq = TRUE)








