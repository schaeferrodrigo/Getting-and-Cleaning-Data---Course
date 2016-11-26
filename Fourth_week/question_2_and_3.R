# question 2

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url , "./data/question_2.csv")
data <- read.csv("./data/question_2.csv", skip = 4,na.strings = "Not Available", stringsAsFactors = FALSE)
data <- data[1:190,]
library(dplyr)
data <- rename(data, dollars = X.)
data$dollars <- gsub(",","",data$dollars)
data_dollars <- as.numeric(data$dollars)
answer <- mean(data_dollars, na.rm = TRUE)

#[1] 377652.4

#question 3

names(data)
data <- rename(data, countryNames = X.3)
length(grep("^United",data$countryNames))
# [1]  1  6 32
