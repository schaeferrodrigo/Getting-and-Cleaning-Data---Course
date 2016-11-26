library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
list_2012 <- grep("2012",sampleTimes,value = TRUE)
answer_1 <- length(list_2012)
answer_1
#[1] 250

dates <- as.Date(list_2012)
weekdays <- weekdays(dates)
length(grep("lunes", weekdays))
#[1] 47