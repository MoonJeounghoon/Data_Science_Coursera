best <- function(state, outcome) {
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
              name <- data_state$Hospital.Name[data_state[,11]==min(data_state[,11], na.rm=TRUE)]
            }
            if(outcome=="heart failure") {
              name <- data_state$Hospital.Name[data_state[,17]==min(as.numeric(data_state[,17]), na.rm=TRUE)]
            }  
            if(outcome=="pneumonia") {
              name <- data_state$Hospital.Name[data_state[,23]==min(as.numeric(data_state[,23]), na.rm=TRUE)]
             }   
        
            if (length(name)==1) output <- name
            if (length(name) > 1) output <- sort(name)[1] 
            output
        }
        
}
