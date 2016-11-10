
# Reading MySQL data bases

# carregando bibliotecas necessárias:

library(DBI)
library(RMySQL)   

#DBI é sempre exigida pelo RMySQL.

#passo 2 : criando uma conexao com uma base de dados MySQL

ucsc <- dbConnect( MySQL() , user = "genome" , host = "genome-mysql.cse.ucsc.edu")
result <- dbGetQuery( ucsc , "show databases;"); dbDisconnect(ucsc)

# dbDisconnect desconecta a base de dados. Sempre fazer isso quando nao é mais necessaria a conexao
#dbGetQuery carrega a base de dados, cada elemento é um novo conjunto de dados.

#------------------------------------------------------------------------------------------
# Agora criando uma conexao com uma conjunto de dados da base de dados. o argumento db  descreve qual 
#qual elemento específico. Note que hg19 é um elemento de result definido anteriormente.

hg19 <- dbConnect(MySQL() , user = "genome", db = "hg19", host = "genome-mysql.cse.ucsc.edu")

allTables <- dbListTables(hg19)
#list all tables in database hg19
#---------------------------------------------------------------------------------------------------

#Pegando as dimensoes de uma tabela específica


dbListFields(hg19, "affyU133Plus2")
# descreve todas as colunas ou "varíaveis" da tabela "affyU133Plus2"
# em MySQL as colunas sao chamadas Fields

dbGetQuery(hg19 , "select count(*) from affyU133Plus2")
# pede quantas linhas ou "observaçoes" tem a tabela.
#"select count(*) from affyU133Plus2" é uma típica notaçao do MySQL

#------------------------------------------------------------------------------
#LER DE UMA TABELA

affydata <- dbReadTable(hg19 , "affyU133Plus2")
#para ler como de fato é a tabela

head(affydata) # para ler as primeiras observaçoes

#SUBCONJUNTOS DA TABELA LIDA
query <- dbSendQuery( hg19 , "select * from affyU133Plus2 where misMatches between 1 and 3")
# misMatches é uma variável da tabela affyu133plu2 " * " indica que estou pegando todas as linhas

affyMis <- fetch(query);quantile(affyMis$misMatches)
#aplicando a funçao quantile na coluna misMatches da subtabela defina anteriomente
#fetch transforma a tabela defina anteriomrmente em um data.frame, assim posso aplicar a notaçao de R

affyMisSmall <- fetch(query, n=10); dbClearResult(query)
# n  define o número de linhas

dbDisconnect(hg19)
#Desconectar do database remoto

# https://www.r-bloggers.com/mysql-and-r/
#https://www.pantz.org/software/mysql/mysqlcommands.html


######################################################################################################
#####################################################################################################
## HDF5

#INSTALLING PACKAGE
source("http://bioconductor.org/biocLite.R")
biocLite('rhdf5')

#LOADING 
library(rhdf5)

#Criando um arquivo
created = h5createFile("example.h5")

#Criando grupos dentro de um arquivo específico

created = h5createGroup("example.h5", "foo")
created = h5createGroup("example.h5", "baa")
created = h5createGroup("example.h5", "foo/foobaa") # é um subgrupo de foo

h5ls("example.h5") # para ver o conteúdo do arquivo, isto é, os grupos.

#ESCREVER EM GRUPOS

#definindo uma matrix
A = matrix(1:10, nr = 5 , nc = 2)

h5write(A,"example.h5", "foo/A")  # escreve o valor "A", no arquivo "example.h5" no destino "foo/A" 


B = array(seq(0.1,2.0,by = 0.1), dim = c(5,2,2))
h5write(B, "example.h5" , "foo/foobaa/B")
#exemplo análogo ao anterior.

#ESCREVER UM DATA SET

df = data.frame(1L:5L, seq(0,1,length.out = 5), c("ab", "cde" , "fghi" , "a" , "s"), stringAsFactors = FALSE)
#criando o data frame

h5write(df , "example.h5" , "df")
#escrevendo no arquivo, nao está em nenhum grupo

#LENDO OS DADOS
readA <- h5read("example.h5" , "foo/A")
readB <- h5read("example.h5" , "foo/foobaa/B")
readdf <- h5read("example.h5", "df")

h5write(c(12,13,14), "example.h5" , "foo/A" , index = list(1:3,1))
#isso modifica o valor "A" do grupo "foo" nos indices indicados

#notes = bioconductor.org/packages/release/bioc/vignettes/rhdf5/int/doc/rhdf5.pdf














