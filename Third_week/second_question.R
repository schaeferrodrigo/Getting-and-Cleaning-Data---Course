library(jpeg)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile = "./data/photo.jpg" , mode="wb")

photo <-  jpeg::readJPEG("./data/photo.jpg" , native = TRUE)

quantile(photo, probs = seq(0, 1,0.1))

# -15259150 -10575416 