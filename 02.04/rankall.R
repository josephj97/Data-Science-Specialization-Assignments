rankall <- function(outcome, rank = "best"){
    careMeasures <- read.csv("E:/Courses/Data Science/Assignments/02.04/outcome-of-care-measures.csv", colClasses = "character")
    
    if(!outcome %in% c("heart attack", "heart failure", "pneumonia"))
        stop("invalid outcome")
    
    if(outcome == "heart attack")
        colNum <- 11
    else if(outcome == "heart failure")
        colNum <- 17
    else if(outcome == "pneumonia")
        colNum <- 23
    
    dataFrame <- data.frame()
    for(i in sort(unique(careMeasures[,7]))){
        oneStateRank <- careMeasures[(careMeasures[,7] == i),]
        oneStateRank[,colNum]<-as.numeric(oneStateRank[,colNum])
        oneStateRank <- oneStateRank[!is.na(oneStateRank[,colNum]),]
        oneStateRank <- oneStateRank[order(oneStateRank[, colNum], oneStateRank[, 2]), ]
        if(rank=="best")
            targetRow <- 1
        else if(rank=="worst")
            targetRow <- nrow(oneStateRank)
        else
            targetRow <- rank
        targetHospital <- oneStateRank[targetRow,2]
        dataFrame <- rbind(dataFrame,data.frame("hospital" = targetHospital, "state" = i), stringsAsFactors = FALSE)
    }
    return(dataFrame)
}

head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)
