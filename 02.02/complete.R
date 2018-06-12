setwd("E:/Courses/Data Science/Assignments/02.02/specdata")
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