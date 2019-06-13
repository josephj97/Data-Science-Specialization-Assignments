best <- function(state, outcome){
    careMeasures <- read.csv("E:/Courses/Data Science/Assignments/02.04/outcome-of-care-measures.csv", colClasses = "character")
    dataFrame<-as.data.frame(cbind(careMeasures[,2],  ## hospital names
                                 careMeasures[,7],    ## states
                                 careMeasures[,11],   ## heart attack rates
                                 careMeasures[,17],   ## heart failure rates
                                 careMeasures[,23]),  ## Pneumonia rates
                           stringsAsFactors = FALSE)
    colnames(dataFrame)<-c("hospital names", "states", "heart attack", "heart failure", "pneumonia")
    if(!state %in% dataFrame[,"states"]){
        stop("invalid state")
    }
    else if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
        stop("invalid outcome")
    }
    else{
        isState <- which(dataFrame[,"states"] == state)
        stateResults <- dataFrame[isState,]
        values <- as.numeric(stateResults[,eval(outcome)])
        minValues <- min(values,na.rm = TRUE)
        res <- stateResults[,"hospital names"][which(values == minValues)]
        output <- res[order(res)]
    }
    return(output)
}
best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")