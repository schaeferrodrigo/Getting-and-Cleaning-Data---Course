# quiz first question

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, destfile = "./data/question_1.csv") #data

url_2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
download.file(url_2 , destfile = "./data/code_book_1.pdf") # code book


data <- read.csv("./data/question_1.csv")

names <- names(data)
split_name <- strsplit(names, "^wgtp")
split_name[123]
#[[1]]
#[1] ""   "15"