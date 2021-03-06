#Base de dados da UC Irvine
#http://archive.ics.uci.edu/ml/datasets/Daily+and+Sports+Activities#

#K-Means em Stanford: http://stanford.edu/~cpiech/cs221/handouts/kmeans.html

## Tipos de Exerc�cios
#A1 - Sentar
#A2 - Levantar
#A3 / A4 - Deitar de costas e no lado direito 
#A5 / A6 - Subir e descer escadas
#A7 - Levantar e permanecer em p�
#A8 - Movimentar-se em p�
#A9 - Caminhar parado
#A10 - Caminhar na esteira a 4 km/h sem inclina��o
#A11 - Caminhar na esteira a 4 km/h com 15 graus de inclina��o 
#A12 - Correr na esteira a 8 km/h sem inclina��o
#A13 - Exercitar-se no Stepper
#A14 - Exercitar-se no CrossTrainer
#A15 / A16 - Pedalar na bicicleta ergom�trica na horizontal e na vertical
#A17 - Remar
#A18 - Saltar
#A19 - Jogar Basket

#ATIVIDADE
#MEMBRO: RA (BRA�O DIREITO)
#ATIVIDADE: 13
#SENSORES: DGX | DGY
#K: 5

install.packages("RColorBrewer")
library(RColorBrewer)
cores <- brewer.pal(5, "Dark2")

folder <- "C:\\Users\\logonrmlocal\\Desktop\\data"

#if (file.exists(folder) == FALSE )
  #dir.create(folder)

setwd(folder)

# url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00256/data.zip"
# destfile <- "data.zip"
# download.file(url, destfile, mode="wb")
# 
# unzip("data.zip")

atividade <- "17" #Informar o n�mero da atividade
DadosDeOrigem <- paste(folder, "\\a", atividade, sep='')

setwd( DadosDeOrigem )
getwd()

##Individuos divididos entre homens e mulhers de 20 a 30 anos
#p1 .. p8
Diretorios <- list.files()
TotalPessoas <- length(Diretorios)

DadoBruto <- NULL

i <- 1
while (i <= TotalPessoas)
{
  #setwd( gsub("_"," ", gsub(" ","",paste(DadosDeOrigem, "//", Diretorios[i]))) )
  setwd( paste(DadosDeOrigem, "\\p", i, sep=''))

  LerArquivos <- list.files()

  j <- 1
  while (j <= length(LerArquivos))
  {
    DadoBruto <- rbind(DadoBruto, read.table(LerArquivos[j], sep=","))
    j <- j+1
  }
  
  i <- i+1
}

#setwd(gsub(" ", "", paste(folder,"/data")))
#getwd()
#write.csv(DadoBruto, file="dadosBrutos.csv")

#1-9 TRONCO
#10-18 - BRA�O DIREITO
#19-27 - BRA�O ESQUERDO
#28-36 - PERNA DIREITA
#37-45 - PERNA ESQUERDA

#Colocar as colunas que s�o interessantes olhar
bracoDireito <- DadoBruto[,13:14]

#SoPernas <- DadoBruto[,28:45]
#summary(SoPernas)
summary(bracoDireito)

#Renomear as Colunas
#colnames(SoPernas) <- c("DAX", "DAY", "DAZ", "DGX", "DGY", "DGZ", "DMX", "DMY", "DMZ", "EAX", "EAY", "EAZ", "EGX", "EGY", "EGZ", "EMX", "EMY", "EMZ")
colnames(bracoDireito) <-  c("DGX", "DGY")
#D = Direita
#E = Esquerda
#A = Accelerometer (Aceler�metro)
#G = Gyroscopes (Girosc�pio)
#M = Magnetometers (Magnet�metro)

# #Descobrir a quantidade de centr�ides
# MinMax <- apply(SoPernas[1:2], 2, max) - apply(SoPernas[1:2], 2, min)
# Pernas <- sweep(SoPernas[1:2], 2, MinMax, FUN = "/")
# n <- nrow(Pernas)
# wss <- rep(0, 8)
# wss[1] <- (n - 1) * sum(apply(Pernas, 2, var))
# for (i in 2:8)
#   wss[i] <- sum(kmeans(Pernas,centers = i)$withinss)
# 
# plot(1:8, wss, type = "l", xlab = "N�mero de Centr�ides", ylab = "Encontrar o plat�", col="red")
# points(1:8, wss, type = "p", col="blue")
# points(1:8, wss, type = "h", col="blue")

#Plotar o grafico com os grupos
Resultado <- kmeans(bracoDireito[1:2], 5);
# Resultado$size
# Resultado$cluster

#plot(SoPernas[1:2], pch= 19)
#points(Resultado$centers[,1:2], col="orange", pch=8, cex=2)

plot(bracoDireito[1:2], pch= 19, xlab="", ylab="")
points(Resultado$centers[,1:2], col="orange", pch=8, cex=2)

plot(bracoDireito[1:2], col = cores[Resultado$cluster], pch= 19, xlab="", ylab="")
points(Resultado$centers[,1:2], col="black", pch=8, cex=2)
