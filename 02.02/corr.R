setwd("E:/Courses/Data Science/Assignments/02.02/specdata")
corr<-function(directory="E:/Courses/Data Science/Assignments/02.02/specdata", threshold = 0)
{
  file<- list.files(path="E:/Courses/Data Science/Assignments/02.02/specdata")
  correlations<-c()
  myData<-complete("specdata")
  myData<-myData[myData$nobs > threshold,]
  for(i in myData$id)
  {
    currentMonitor<-read.csv(file[i],TRUE)
    colnames(currentMonitor)<-c("Date", "sulfate", "nitrate","ID")
    #cor computes the correlation of x and y, if x and y are matrices then the correlations
    #between the columns of x and the columns of y are computed.
    correlations<-c(correlations,cor(currentMonitor[["sulfate"]],currentMonitor[["nitrate"]],use= "pairwise.complete.obs"))
  }
  correlations
}




complete <- function(directory="E:/Courses/Data Science/Assignments/02.02/specdata", id=1:332)
{
  file<- list.files(path="E:/Courses/Data Science/Assignments/02.02/specdata")
  completeCases<-rbind()
  #names(completeCases)<-c("id", "nobs")
  for(i in id)
  {
    currentData<-read.csv(file[i],TRUE)
    cleanData<-na.omit(currentData)
    nobs<-nrow(cleanData)
    completeCases<-rbind(completeCases,c(i,nobs))
  }
  colnames(completeCases)<-c("id", "nobs")
  completeCases<-as.data.frame(completeCases)
  completeCases
}