library(readxl)
Bebes <- read_excel("E:/Arquivos de Aula - Linguagem R/Arquivos Aulas Fiap/Bebes.xlsx")

attach(Bebes)

library(glm2) # Pacote para criar o modelo

# binomial � uam distribui��o de probabilidade discreta 0 ou 1.
# Fun��o glm � uma fun��o que est� dentro do pacote glm2 e vai criar o modelo
# a variavel low � minha variave de estudo (0= bebes peso normal e 1= bebes com bx peso)
# quero saber se as outras vari�veis consegue explicar pq o bebes nasce com bx peso.
# o sinal ~ significa rela��o, ou seja, quero saber se as vari�veis (ht,lwt,ptl,smoke e age) tem rela��o para explicar
# o evento de interesse. o evento de interesse � sempre o 1. bebes bx peso nesse caso.


Logistica <-glm(low ~ ht+lwt+ptl+smoke+age, family = binomial)
Logistica
                
summary(Logistica) 
# fun��o summary: resumo do modelo. Essa linha calcula os Betas (coeficientes para serem interpretados)

probabilidade <-predict(Logistica, Bebes, type = "response")
# estou criando uma vari�vel/ coluna chamada probabilidade. Essa vari�vel est� recebendo a probabilidade prevista do modelo
# que � calculada pela fun��o predict. a observa��o type=response, sig que estou calculando a probabilidade para resposta.

Bebes$probabilidade <-probabilidade # colocando a probabilidade no arquivo.

predito <- ifelse(probabilidade >= 0.5,1,0)
# estou criando um coluna predito que utiliza probabilidade criada anteriormente. como a probabilidade vaira de 0 a 1,
# qq valor que ficar igual ou acima de 0,5 ser� classificado como 1 que no nosso caso e bx peso. Valores de probabilidades
# menores que 0.49 ser� classificado como peso normal ou seja "0".

Bebes$predito <- predito # colocando a classifica��o no arquivo peso normal "0" ou bx peso "1".
Bebes

table(predito,low) # tabela cruada serve para saber quantos acertara e quantos erraram.
classificacao_geral <-((119+21)/(119+38+11+21))*100 # essa classifica��o geral. mede o quanto o modelo acerta no geral
classificacao_geral

resumo <-table(predito,low)
tx_acerto <-(resumo[1]+resumo[4])/sum(resumo)
tx_acerto



install.packages("ResourceSelection")
require(ResourceSelection)
bondade_ajuste <- hoslem.test(low, predito, g=2)
bondade_ajuste
