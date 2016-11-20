#third question

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url , destfile = "./data/third_question.csv")
url_2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url_2 , destfile = "./data/third_question_b.csv")
date_download <- date()

GDP_data <- read.csv("./data/third_question.csv" , na.strings = "Not Available", stringsAsFactors = FALSE) # Gross Domestic Product
Edu_data <- read.csv("./data/third_question_b.csv") #educational data


head(CDP_data)
GDP_data <- read.csv("./data/third_question.csv", skip = 4) # Gross Domestic Product
GDP_data <- select(GDP_data , X , X.1 , X.3, X.4)
GDP_data <- rename(GDP_data , CountryCode = X ,ranking =X.1 , coutry =X.3, economy= X.4)
GDP_data <- GDP_data[1:190,]
GDP_data$ranking <- as.numeric(levels(GDP_data$ranking))[GDP_data$ranking]

new_data <- merge(GDP_data , Edu_data , by = intersect(names(GDP_data), names(Edu_data)) , all = FALSE )

nrows(new_data)
new_data <- arrange(new_data, desc(ranking))
pos<- new_data[,"ranking"][13]
new_data[new_data$ranking == pos,"Long.Name"]

#189 Kitts and NEvis

tapply(new_data$ranking , new_data$Income.Group , mean) 

# 32.96667 91.91304

new_data2 <- mutate(new_data , quantileGroups = cut2(ranking, g = 5))
table(new_data2$quantileGroups , new_data2$Income.Group)


# 5




