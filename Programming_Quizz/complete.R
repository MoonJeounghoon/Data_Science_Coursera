complete <- function(directory, id ) {
   filelist <- list.files(directory,full.names=T)
   clean <- gsub(directory, "", filelist)
   clean <- gsub(".csv","", clean)
   clean <- gsub("/", "", clean)
   indx <- as.numeric(clean)
   sel <- filelist[indx %in% id]
   idout <- indx[indx %in% id]
   final <- matrix(nrow=length(sel),ncol=2, dimnames=list(NULL, c("id", "nobs")))
   for (k in 1:length(sel)){
        data <- read.csv(sel[k])
        final[k,1] <- idout[k]
        final[k,2] <- nrow(data[complete.cases(data),])
   }
   final <- data.frame(final)
   test <- final[with(final, order(-final$id)), ]
   test
}
