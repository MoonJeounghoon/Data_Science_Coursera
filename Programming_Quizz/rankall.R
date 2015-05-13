rankall <- function(outcome, num="best") {
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        checkout <- outcome %in% c("heart attack","heart failure","pneumonia")
        if(checkout==FALSE) {
             stop("invalid outcome")
        }
        if(checkout==TRUE) {
           if(outcome=="heart attack") {
              rate <- as.numeric(data[,11])[is.na(as.numeric(data[,11]))==FALSE]
              name <- data$Hospital.Name[is.na(as.numeric(data[,11]))==FALSE]
              state <- data$State[is.na(as.numeric(data[,11]))==FALSE]
            }
            if(outcome=="heart failure") {
              rate <- as.numeric(data[,17])[is.na(as.numeric(data[,17]))==FALSE]
              name <- data$Hospital.Name[is.na(as.numeric(data[,17]))==FALSE]
              state <- data$State[is.na(as.numeric(data[,17]))==FALSE]
            }  
            if(outcome=="pneumonia") {
              rate <- as.numeric(data[,23])[is.na(as.numeric(data[,23]))==FALSE]
              name <- data$Hospital.Name[is.na(as.numeric(data[,23]))==FALSE]
              state <- data$State[is.na(as.numeric(data[,23]))==FALSE]
             }   
            frame <- cbind(rate, name, state)
            frame <- data.frame(frame)
            indx <- unique(frame$state)
            indx <- sort(indx)
            final <- c()
            for (i in 1:length(indx)){
                 data_state <- frame[frame$state==indx[i],] 
                 sortframe <- data_state[order(as.numeric(as.character(data_state$rate)), data_state$name),]
                 if(num=="best") {
                    output <- sortframe$name[1]
                    #print(output)
                  } else if(num=="worst") {
                    output <- sortframe$name[length(sortframe$name)]
                  } else  {
                    output <- sortframe$name[num]
                  }
            final <- append(final, as.character(output))
            } 
            result <- cbind(as.character(final), as.character(indx))
            colnames(result) <- c('hospital', 'state')
            result <- data.frame(result)
            result
        }
        
}
