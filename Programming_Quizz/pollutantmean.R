pollutantmean <- function(directory, pollutant, id = 1:332) {
   filelist <- list.files(directory,full.names=T)
   clean <- gsub(directory, "", filelist)
   clean <- gsub(".csv","", clean)
   clean <- gsub("/", "", clean)
   indx <- as.numeric(clean)
   sel <- filelist[indx %in% id]
   final <- c()
   for (k in 1:length(sel)){
        data <- read.csv(sel[k])
        col <- data[names(data)==pollutant]
        col <- col[is.na(col)==FALSE]
        final <- append(final, col)
   }
   mean(final)
}

