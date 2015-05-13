rankhospital <- function(state, outcome, num="best") {
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        checkstate <- state %in% data$State
        checkout <- outcome %in% c("heart attack","heart failure","pneumonia")
        if(checkstate==FALSE) {
             stop("invalid state")
        }
        if(checkout==FALSE) {
             stop("invalid outcome")
        }
        if(checkstate==TRUE & checkout==TRUE) {
           data_state <- data[data$State==state,]

           if(outcome=="heart attack") {
              rate <- as.numeric(data_state[,11])[is.na(as.numeric(data_state[,11]))==FALSE]
              name <- data_state$Hospital.Name[is.na(as.numeric(data_state[,11]))==FALSE]
            }
            if(outcome=="heart failure") {
              rate <- as.numeric(data_state[,17])[is.na(as.numeric(data_state[,17]))==FALSE]
              name <- data_state$Hospital.Name[is.na(as.numeric(data_state[,17]))==FALSE]
            }  
            if(outcome=="pneumonia") {
              rate <- as.numeric(data_state[,17])[is.na(as.numeric(data_state[,23]))==FALSE]
              name <- data_state$Hospital.Name[is.na(as.numeric(data_state[,23]))==FALSE]
             }   
            frame <- cbind(rate, name)
            frame <- data.frame(frame)
            sortframe <- frame[order(rate, name),]
            if(num=="best") {
                output <- sortframe$name[1]
            } else if(num=="worst") {
                output <- sortframe$name[length(sortframe$name)]
            } else  {
                output <- sortframe$name[num]
            }
            as.character(output)
        }
        
}
