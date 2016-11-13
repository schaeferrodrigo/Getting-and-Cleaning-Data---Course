# QUIZ SECOND WEEK

#FIRST QUESTION

library(httr) # biblioteca necessária

#acessar os github usando os requerimentos que obtive com a minha aplicaçao
my_app <- oauth_app("github" , key = "66f7d366b3f132fd3ff0" , secret="498e40e16f298543670ae5e40e46171f67ccac59")
# os valores "key" e "secret" foram dados quando registrei a aplicaçao


#Second questiom

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl , destfile =  "~/GitHub/Getting-and-Cleaning-Data---Course/Second Week/question_2.csv")
acs <- read.csv("question_2.csv")


#Fourth questiom
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
html = readLines(con )
answer <- c( nchar(html[10]) , nchar(html[20]) , nchar(html[30]), nchar(html[100]) )
answer

#fifth question
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", destfile = "~/GitHub/Getting-and-Cleaning-Data---Course/Second Week/question_5.for")
data <- read.fwf("question_5.for", widths = c(-1 , 9 , -5 , 4, 4 , -5 , 4 , 4, -5 , 4  ,4 ,-5 ,4, 4), skip = 4)
#widths indica o "tamanho" de cada valor das colunas e os números negativos os espaços entre as colunas
answer <- sum(data[,4])



