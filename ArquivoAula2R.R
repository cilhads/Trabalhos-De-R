estudantes <- list(cbind(nome=c("Edmar","Pedro","Matheus"),
                         idade=c(30,28,29),
                         salario=c(1500,1600,1700),
                         prestacao=c(680,650,640),
                         escolaridade=c("MBA", "Doutorado","Mestrado")))

estudantes
filhos <-c(1,2,3)
filhos
estudantes$filhos <- filhos
estudantes

estudantes.data

nome<-c("Edmar","Pedro","Matheus")
idade<-c(30,28,29)
salario<-c(1500,1600,1700)
prestacao<-c(680,650,640)
escolaridade<-c("MBA", "Doutorado","Mestrado")

cadastro <- data.frame(nome,idade,salario,prestacao,escolaridade)
cadastro

filhos<-c(1,2,3)
cadastro$filhos<-filhos

cadastro

compretimentoRenda <- round((prestacao/salario), digits = 4) * 100
compretimentoRenda

cadastro$compretimentoRenda <- compretimentoRenda
cadastro
