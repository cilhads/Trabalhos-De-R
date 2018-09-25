attach(Banco)

Banco$media<-(cartao_credito+Emprestimos)/2
Banco
Banco$classe <-NA
Banco

media <- is.numeric(media)
media

min(media)
max(media)

for (i in nrow(Banco)) {
  if(Banco[i, "media"]>=10000){
    Banco[i,"classe"] <-"classe A"
  } else if (Banco[i,"media"]< 10000 & Banco[i, "media"]>=5000){
    Banco[i,"classe"]<-"classe B"
  }else{
    Banco[i,"classe"]<-"classe C"
  }
  
}

funR <- function(row)
{
  if(row$media >= 10000)
    row$classe <- "Classe A"
  else if(row$media < 10000 & row$media >= 5000)
    row$classe <- "Classe B"
  else 
    row$classe <- "Classe C"
  
   x <- row$classe
}

for (row in 1:nrow(Banco)) {
  
  Banco[row,"classe"] <- funR(Banco[row,])
  
}

table(Banco$classe)
Banco

library(ggplot2)

#mostra disperção em ponto por sexo
dispersao <- ggplot(Banco, aes(x=estudo, y=salário, color=sexo))
dispersao+geom_point() 

dispersao2 <- ggplot(Banco, aes(x=estudo, y=salário))
#separa os dois graficos por sexo
dispersao2+geom_point() + facet_wrap((~sexo))

barplot(prop.table(table(Banco$sexo)) * 100,
        col=c("blue", "red"))
        title("Frequencia", xlab="sexo", ylab="%")
        
prop.table(table(Banco$sexo))


boxplot(Banco$salário ~ Banco$sexo,
        main="Grafico Box Plot",
        xlab="sexo",
        ylab="Salario",
        col=c("blue", "red"))

#as bolinhas que aparecem neste grafico chamados OUTLIERS
#se os outliers representam 5% significa que a base está OK
#caso esteja acima será necessário avaliar a base para talvez a 
#remoção de seus outliers
#nunca trocar o outliers pela média (pois você estará gerando)
#uma linha reta constante



boxplot(Banco$salário)
Banco[order(Banco$salário, decreasing=TRUE),]
Banco$substituir <- replace(Banco$salário, Banco$salário >= 60000,60000)
Banco

boxplot(Banco$substituir ~ Banco$sexo,
        main="Grafico Box Plot",
        xlab="sexo",
        ylab="Salario",
        col=c("blue", "red"))
