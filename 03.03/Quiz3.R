#Question 1
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
destFile <- "E:/Courses/Data Science/Assignments/03.03/ss06hid.csv"
if(!file.exists(destFile)){
    download.file(fileURL,destfile = destFile, method = 'curl')
}
data <- read.csv(destFile)
#data
agricultureLogical <- data$ACR == 3 & data$AGS == 6
head(which(agricultureLogical))

#--------------------------------------------------------------------------------------------------

#Question 2
library(jpeg)
fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
destFile2 <- "E:/Courses/Data Science/Assignments/03.03/jeff.jpg"
if(!file.exists(destFile2)){
    download.file(fileURL2,destFile2, mode = 'wb')
}
picture <- readJPEG(destFile2, native = TRUE)
quantile(picture,probs = c(0.3,0.8))

#--------------------------------------------------------------------------------------------------

#Question 3
library(data.table)
fileURL3a <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
destFile3a <- "E:/Courses/Data Science/Assignments/03.03/GDP.csv"
fileURL3b <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
destFile3b <- "E:/Courses/Data Science/Assignments/03.03/EDSTATS.csv"
if(!file.exists(destFile3)){
    download.file(fileURL3a,destFile3a, method = 'curl')
}
gdp <- fread(destFile3a, skip=5, nrows = 190, select = c(1, 2, 4, 5)
             , col.names = c("CountryCode", "Rank", "Economy", "Total"))
if(!file.exists(destFile3b)){
    download.file(fileURL3b,destFile3b, method = 'curl')
}
edstats <- fread(destFile3b)
mergedData <- merge(gdp, edstats, by = "CountryCode")
nrow(mergedData)
arrange(mergedData, desc(Rank))[13,'Economy']

#--------------------------------------------------------------------------------------------------

#Question 4
tapply(mergedData$Rank, mergedData$`Income Group`, mean)

#--------------------------------------------------------------------------------------------------

#Question 5
mergedData$Rank <- cut(mergedData$Rank, breaks = 5)
table(mergedData$Rank, mergedData$`Income Group`)
