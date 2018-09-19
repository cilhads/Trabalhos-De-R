attach(Salario)
library(dplyr)

agregar <- summarise(group_by(Salario,id), 
                     salario_m = mean(salario_m),
                     data_pagamento_min = min(data_pagamento),
                     data_pagamento_max = max(data_pagamento),
                     contagem = n())

agregar

agregar1 <- summarise(group_by(Salario,id), 
                     salario_mm = sum(salario_m),
                     data_pagamento_min = min(data_pagamento),
                     data_pagamento_max = max(data_pagamento),
                     media = mean(salario_m),
                     contagem = n())

agregar1

filtro = filter(agregar1, contagem >=3)
filtro

select(agregar1, id, salario_mm)
select(agregar1, id:data_pagamento_max)
select(agregar1, id, data_pagamento_max:contagem)
#faz o select ignorando as colunas indicadas
select(agregar1, -(data_pagamento_max:contagem))

#cria uma nova coluna
transmute(agregar1, 
          salario_novo = salario_mm * 0.10, 
          contagem_x = contagem * 2)

#adciona os dados as colunas na tabela
mutate(agregar1,
       salario_novo = salario_mm * 0.10, 
       contagem_x = contagem * 2)

agregar1

