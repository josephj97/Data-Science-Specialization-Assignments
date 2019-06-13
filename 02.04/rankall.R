rankall <- function(outcome, rank = "best"){
    careMeasures <- read.csv("E:/Courses/Data Science/Assignments/02.04/outcome-of-care-measures.csv", colClasses = "character")
    dataFrame<-as.data.frame(cbind(careMeasures[,2],  ## hospital names
                                   careMeasures[,7],    ## states
                                   careMeasures[,11],   ## heart attack rates
                                   careMeasures[,17],   ## heart failure rates
                                   careMeasures[,23]),  ## Pneumonia rates
                             stringsAsFactors = FALSE)
    colnames(dataFrame)<-c("hospital names", "states", "heart attack", "heart failure", "pneumonia")
    dataFrame<-subset(careMeasures,careMeasures[,outcome]!="Not Available")
    if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
        stop("invalid outcome")
    }
    if(rank == "best"){
        rank = 1
    }
    else if(rank == "worst"){
        rank <- length(dataFrame[,outcome])
    }
    sortedDF <- sort(as.numeric(dataFrame[,outcome]))
    stateDF <- subset(dataFrame,as.numeric(dataFrame[,outcome])==sortedDF)
}

head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)