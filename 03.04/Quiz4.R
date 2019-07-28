#Question 1
fileURL1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
destFile1 <- "E:/Courses/Data Science/Assignments/03.04/ss06hid.csv"
if(!file.exists(destFile1)){
    download.file(fileURL1,destfile = destFile1, method = "curl")
}
data <- read.csv(destFile1)
nameSplit <- strsplit(names(data), "wgtp")
nameSplit[123]

#---------------------------------------------------------------------------------------------

#Question 2
library(data.table)
fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
destFile2 <- "E:/Courses/Data Science/Assignments/03.03/GDP.csv"
if(!file.exists(destFile2)){
    download.file(fileURL2,destFile2, method = 'curl')
}
gdp <- fread(destFile3a, skip=5, nrows = 190, select = c(1, 2, 4, 5)
             , col.names = c("CountryCode", "Rank", "Economy", "Total"))
gdp[, mean(as.integer(gsub(pattern = ',', replacement = '', x = Total)))]

#---------------------------------------------------------------------------------------------

#Question 3
#grep("^United", countryNames),3

#---------------------------------------------------------------------------------------------

#Question 4
library(data.table)
fileURL3a <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
destFile3a <- "E:/Courses/Data Science/Assignments/03.03/GDP.csv"
fileURL3b <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
destFile3b <- "E:/Courses/Data Science/Assignments/03.03/EDSTATS.csv"
if(!file.exists(destFile3a)){
    download.file(fileURL3a,destFile3a, method = 'curl')
}
gdp <- fread(destFile3a, skip=5, nrows = 190, select = c(1, 2, 4, 5)
             , col.names = c("CountryCode", "Rank", "Economy", "Total"))
if(!file.exists(destFile3b)){
    download.file(fileURL3b,destFile3b, method = 'curl')
}
edstats <- fread(destFile3b)
mergedData <- merge(gdp, edstats, by = "CountryCode")
mergedData[grepl(pattern = "Fiscal year end: June 30;", mergedData[,`Special Notes`]), .N]

#---------------------------------------------------------------------------------------------

#Question 5
library(quantmod)
amzn <- getSymbols("AMZN", auto.assign = FALSE)
sampleTimes <- index(amzn)
timeData <- data.table(timeCol = sampleTimes)
timeData[(timeCol >= "2012-01-01") & (timeCol < "2013-01-01"), .N]
timeData[((timeCol >= "2012-01-01") & (timeCol <"2013-01-01")) & (weekdays(timeCol) == "Monday"), .N]
