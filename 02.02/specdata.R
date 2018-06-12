setwd("E:/Courses/Data Science/Assignments/02.02/specdata")
pollutantmean <- function(directory="E:/Courses/Data Science/Assignments/02.02/specdata", pollutant, id=1:332)
{
  file<- list.files(path="E:/Courses/Data Science/Assignments/02.02/specdata")
  totalData<-c()
  for(i in id)
  {
    currentData<-read.csv(file[i],TRUE)
    colnames(currentData)<-c("Date", "sulfate", "nitrate","ID")
    #cleanData<-na.omit(currentData)
    cleanData<-currentData[!is.na(currentData[,pollutant]),pollutant]
    totalData<-c(totalData,cleanData)
  }
  result<-mean(totalData)
  return(round(result,3))
}