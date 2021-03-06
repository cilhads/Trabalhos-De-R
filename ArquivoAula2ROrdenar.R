#ARQUIVO IMPORTADO "ORDENAR"
#fazendo ordena��o de base no R
#atach --> serve para setar o arquivo que eu estou usando dentro do script
attach(Ordenar)
#a virgula serve para tamb�m ordenar todas as outras variaveis
Ordenar[order(Ordenar$id),]
#ordenar do menor para o maior
Ordenar[order(Ordenar$id, decreasing = FALSE),]
#ordenar do maior para o menor
Ordenar[order(Ordenar$id, decreasing = TRUE),]
#� sempre bom criar novas variaveis para n�o destruir variaveis de mesmo nome
remover_Ordenar <- unique(Ordenar)
remover_Ordenar[order(remover_Ordenar$id),]
#traz some os id o que esta duplicado / 
#fromLast (Retorna o ultimo cara/ se false traz a primeira) 
#traz somente o que foi solicitado para remover
remover_duplicados <- remover_Ordenar[duplicated(remover_Ordenar$id
                                                  , fromLast = FALSE),]

#adicionando o ! voc� nega e traz tudo da tabela "removendo" a duplicidade
remover_duplicados <- remover_Ordenar[!duplicated(remover_Ordenar$id
                                                 , fromLast = FALSE),]

remover_duplicados
