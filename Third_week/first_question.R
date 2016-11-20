# first question

if(!file.exists("./data")){dir.create(("./data"))} #creating the dir data

url <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" #source 
download.file(url , destfile = "./data/quiz_1.csv")
date_download <- date()

# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf booking code

data <- read.csv("./data/quiz_1.csv")

selected_data <- select(data, ACR , AGS)
selected_data <- rename(selected_data, Size = ACR , Sold = AGS)
agricultureLogical <- (selected_data$Size == 3 & selected_data$Sold ==6 )
which(agricultureLogical)

#  125  238  262 

