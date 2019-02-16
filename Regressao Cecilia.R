#Configuranco o ambiente
setwd('C:\\Users\\logonrmlocal\\Downloads')
dados <- read.csv('AirQualityUCI.csv', header = T, sep = ';')

#Alterando o tipo de dado
dados$Date <- as.Date(dados$Date, format("%d/%m/%Y"))
dados$CO.GT. <- as.numeric(as.character(gsub(x=dados$CO.GT., ',', '.')) )
dados$C6H6.GT. <- as.numeric(as.character(gsub(x=dados$C6H6.GT., ',', '.')) )
dados$T <- as.numeric(as.character(gsub(x=dados$T, ',', '.')) )
dados$RH <- as.numeric(as.character(gsub(x=dados$RH, ',', '.')) )
dados$AH <- as.numeric(as.character(gsub(x=dados$AH, ',', '.')) )

View(dados)

newDataSet <- dados[(dados$PT08.S1.CO.  > -200 
                     & dados$CO.GT. > -200 
                     & dados$NMHC.GT. > -200 
                     & dados$C6H6.GT. > -200 
                     & dados$PT08.S2.NMHC > -200 
                     & dados$NOx.GT. > -200 
                     & dados$PT08.S3.NOx. > -200 
                     & dados$NO2.GT. > -200 
                     & dados$PT08.S4.NO2. > -200 
                     & dados$PT08.S5.O3.  > -200 ), 
                    c('CO.GT.'
                      ,'PT08.S1.CO.'
                      ,'NMHC.GT.'
                      ,'C6H6.GT.'
                      ,'PT08.S2.NMHC.'
                      ,'NOx.GT.'
                      ,'PT08.S3.NOx.'
                      ,'NO2.GT.'
                      ,'PT08.S4.NO2.'
                      ,'PT08.S5.O3.')]
View(newDataSet)

#remove todos os NA existentes
newDataSet <- na.omit(newDataSet)

cor_dataSet <- data.frame(cor(newDataSet))

cor_dataSet2 <- cor(cor_dataSet[,c('CO.GT.'
                                  ,'PT08.S1.CO.'
                                  ,'NMHC.GT.'
                                  ,'C6H6.GT.'
                                  ,'PT08.S2.NMHC.'
                                  ,'NOx.GT.'
                                  ,'NO2.GT.'
                                  ,'PT08.S4.NO2.'
                                  ,'PT08.S5.O3.')])


newDataSet$x <- newDataSet$PT08.S2.NMHC.
newDataSet$y <- newDataSet$PT08.S3.NOx. 

View(newDataSet)

regressao <- lm(y~x, data=newDataSet)
regressao
plot(newDataSet$x, newDataSet$y)
abline(regressao, col="red", lwd=4)

summary(regressao)$r.squared
summary(regressao)$sigma
sd(newDataSet$x)
sd(newDataSet$y)

Co <- 9
y = regressao$coefficients[1] + (regressao$coefficients[2] * Co)
y

predict(regressao, data.frame(x=9))

#fazer o teste de 80% 20% com a base 100%



