data <- read.csv("question_1.csv")
property_value <- data[!is.na(data$VAL), 'VAL']
answer_1 <- length(property_value[property_value == 24])

#Question 3

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",destfile = "~/GitHub/Getting-and-Cleaning-Data---Course/First Week/question_3.xlsx" , mode = 'wb')
library(xlsx)
dat <- read.xlsx("~/GitHub/Getting-and-Cleaning-Data---Course/First Week/question_3.xlsx" , sheetIndex = 1 , colIndex = 7:15 , rowIndex = 18:23 , header = TRUE )
sum(dat$Zip*dat$Ext,na.rm=T)

#question  4

download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",destfile = "~/GitHub/Getting-and-Cleaning-Data---Course/First Week/question_4.xlm") # it is not necessary
library(XML)
data_four <- xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml" , useInternal = TRUE)
rootNode <- xmlRoot(data_four)
zip_codes <- xpathSApply(rootNode, '//zipcode', xmlValue)
zip_21231 <- zip_codes[ zip_codes == '21231']
answer_4 <- length(zip_21231)
answer_4


#question 5
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",destfile = "~/GitHub/Getting-and-Cleaning-Data---Course/First Week/question_5.csv") 
library(data.table)
DT<- fread("~/GitHub/Getting-and-Cleaning-Data---Course/First Week/question_5.csv")
time_1 <- system.time(mean(DT[DT$SEX==1,]$pwgtp15)) + system.time(mean(DT[DT$SEX==2,]$pwgtp15))
time_2 <- system.time(rowMeans(DT)[DT$SEX==1]) + system.time(rowMeans(DT)[DT$SEX==2])
time_3 <- system.time(mean(DT$pwgtp15,by=DT$SEX))
time_4 <- system.time(DT[,mean(pwgtp15),by=SEX])
time_5 <- system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
time_6 <- system.time(tapply(DT$pwgtp15,DT$SEX,mean))
