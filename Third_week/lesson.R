# subsetting

set.seed(13435)

X <- data.frame("var1"=sample(1:5) , "var2" = (6:10) , "var3" = sample(11:15) )

X <- X[sample(1:5),];X$var2[c(1,3)] = NA #embaralhar as linhas ; linha 1 e 3 da variavel var2 recebem NA

library(plyr)
arrange(X,var1) #ordena

arrange(X,desc(var1)) #ordena decrescentemente

X$var4 <- rnorm(5) # adiciona uma variavel ao data X

Y <- cbind(X , "teste" = rnorm(5)) #adiciona uma variavel, mas preserva X 
#rbind adiociona uma linha

#######################################################################################3
#######################################################################################
#summarizing data

if(!file.exists("./data")){dir.create("./data")}
#criando arquivo caso ele nao exista

fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl , destfile = "./data/restaurants.csv")
## baixando arquivo

restData <- read.csv("./data/restaurants.csv")
# guardando data na variável "restData"

head( restData , n = 3)
tail(restData , n = 3)
# início e final do data.frame


summary(restData)
# resumo dos dados

str(restData)
#more information: estrutura

quantile(restData$councilDistrict, na.rm = TRUE)
quantile(restData$councilDistrict, probs = c(0.5,0.75,0.9))

table(restData$zipCode , useNA = "ifany")

table(restData$councilDistrict , restData$zipCode)
#cria uma tabela de council district e zipCode

sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
# duas maneiras diferentes para verificar a mesma coisa

all(restData$zipCode>0)

colSums(is.na(restData))
#soma para cada coluna do data.frame o número de NA's
all(colSums(is.na(restData)) == 0)
#verifica se sao todas 0

table(restData$zipCode %in% c(21212)) # numera elementos com uma característica especifica
table(restData$zipCode %in% c(21212,21213)) # exemplo análogo ao anterior

restData[restData$zipCode %in% c("21212","21213"), ] #outra maneira de fazer isso, mas agora preservando as informaçoes do dataframe

# TRoCANDO DE DATA SET
data(UCBAdmissions)
DF <- as.data.frame(UCBAdmissions)
summary(DF) #para ver um resumo

xt <- xtabs(Freq ~ Gender + Admit, data=DF) 
#mostra a frequencia  da tabele que cruza Gender e Admit



print(object.size(data) , units = "Mb")#tamanho que ocupa na memória


