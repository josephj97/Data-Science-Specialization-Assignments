rankhospital <- function(state,outcome,rank = "best"){
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
    else if(is.numeric(rank)){
        isState <- which(dataFrame[,"states"] == state)
        stateResults <- dataFrame[isState,]
        values <- as.numeric(stateResults[,eval(outcome)])
        res<- stateResults[order(values,stateResults[,"hospital names"]),]
        output <- res[,"hospital names"][rank]
    }
    else if(!is.numeric(rank)){
        if(rank == "best"){
            output <- best(state, outcome)
        }
        else if(rank == "worst"){
            isState <- which(dataFrame[,"states"] == state)
            stateResults <- dataFrame[isState,]
            values <- as.numeric(stateResults[,eval(outcome)])
            res<- stateResults[order(values,stateResults[,"hospital names"],decreasing = TRUE),]
            output <- res[,"hospital names"][1]
        }
        else{
            stop("invalid rank")
        }
    }
return(output)
}
rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)