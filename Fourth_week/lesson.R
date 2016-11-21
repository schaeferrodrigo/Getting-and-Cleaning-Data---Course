if(!file.exists("./data")){dir.create("./data")}

url <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(url , destfile = "./data/cameras.csv")

cameraData <- read.csv("./data/cameras.csv")

names(cameraData)

splitNames = strsplit(names(cameraData),"\\.") # quebra "names" em uma lista

splitNames[[5]]

mylist <- list(letters = c("A" , "B", "C"), numbers=1:3, matrix(1:25 , ncol=5))
#cria uma lista 

mylist[[1]]
# [1] "A" "B" "C"
 mylist$letters
# [1] "A" "B" "C"
mylist[1]
#$letters
#[1] "A" "B" "C"


#fixin characters vectors

splitNames[[6]]
#[1] "Location" "1"       
 splitNames[[6]][1]
#[1] "Location"
 
firstElement <- function(x){x[1]}
sapply(splitNames , firstElement)
# [1] "address"      "direction"    "street"       "crossStreet"  "intersection" "Location"  


#PEER REVIEW DATA
url1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
url2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"

download.file(url1 , destfile = "./data/reviews.csv")
download.file(url2 , destfile = "./data/solutions.csv")

reviews <- read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")


names(reviews)
#[1] "id"          "solution_id" "reviewer_id" "start"       "stop"        "time_left"   "accept"     
sub("_","",names(reviews),)
#[1] "id"         "solutionid" "reviewerid" "start"      "stop"       "timeleft"   "accept"
############substitui "_" por "" nos nomes, mas só o primeiro "_" em cada palavra

test_name <- "this_is_a_test"
sub("_","",test_name)
#[1] "thisis_a_test"
gsub("_","",test_name)
#[1] "thisisatest"

grep("Alameda",cameraData$intersection) # é como fazer um ctrl+f e buscar "alameda" na variável indicada
# [1]  4  5 36 ### indice dos elementos em que aparece "alameda"

table(grepl("Alameda",cameraData$intersection))

#FALSE  TRUE 
#77     3 

cameraData2 <- cameraData[!grepl("Alameda" , cameraData$intersection),] 
# elimina as linhas em que alameda aparece na variável indicada



grep("Alameda", cameraData$intersection,value=TRUE)
 #[1] "The Alameda  & 33rd St"   "E 33rd  & The Alameda"    "Harford \n & The Alameda" 
####indica os valores completos

grep("JeffStreet", cameraData$intersection)
#len = 0

library(stringr)
nchar("Jeffrey Leek")  # número de characteres
substr("Jeffrey Leek",1,7) #extrai do caracter #1 até o #7
paste("Jeffrey" , "Leek") #cola os dois termos, provavelmente o "  " é por default
paste0("Jeffrey" , "Leek") # cola eliminando o espaço entre eles
str_trim("Jeff    ") # elimina os espaço final




