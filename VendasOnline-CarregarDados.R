#Base de dados
#http://archive.ics.uci.edu/ml/datasets/Online+Retail

setwd('C:\\Users\\logonrmlocal\\Downloads')
dados <- read.csv('Online Retail.csv', header = T, sep=',')

dados <- dados[!grepl("C", dados$InvoiceNo),]
dados <- subset(dados, Quantity >= 1)
dados <- subset(dados, UnitPrice >= 0.01)
dados <- subset(dados, Quantity < 40000)

View(dados)

install.packages("RColorBrewer")
library(RColorBrewer)
cores <- brewer.pal(3, "Dark2")

dados$TotalCompra <- dados$Quantity * dados$UnitPrice
Quantidade <- aggregate(Quantity ~ InvoiceNo, data = dados, sum)
TotalPrice <- aggregate(TotalCompra ~ InvoiceNo, data = dados, sum)



dadosAgrupados <- merge(Quantidade, TotalPrice)

summary(dadosAgrupados)

Resultado <- kmeans(dadosAgrupados[2:3], 3)

plot(dadosAgrupados[2:3], pch= 19, xlab="", ylab="")
points(Resultado$centers[,1:2], col="orange", pch=8, cex=2)

plot(dadosAgrupados[2:3], col = cores[Resultado$cluster], pch= 19, xlab="", ylab="")
points(Resultado$centers[,1:2], col="black", pch=8, cex=2)




