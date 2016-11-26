#fourth question 

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url_2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(url, destfile = "./data/question_4.csv")
data <-  read.csv("./data/question_4.csv", skip = 4,na.strings = "Not Available", stringsAsFactors = FALSE)
data <- data[1:190,]

library(dplyr)
download.file(url_2 , destfile = "./data/question_4b.csv")
Edu <- read.csv("./data/question_4b.csv",na.strings = "Not Available", stringsAsFactors = FALSE)
merged_data <- merge(data, Edu , intersect(names(data),names(Edu)))
Special_notes <- merged_data[,"Special.Notes"]
length(grep("Fiscal year end: June",Special_notes,value = TRUE))
#[1] 13