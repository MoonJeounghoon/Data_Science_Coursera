corr <- function(directory, threshold = 0) {
        filelist <- list.files(directory,full.names=T)
        correl <- c()
        for (k in 1:length(filelist)){
              data <- read.csv(filelist[k])
              data <- data[complete.cases(data),]
              if (nrow(data) > threshold) {
                  tt <- cor(data$sulfate,data$nitrate)
                  correl <- append(correl, tt)
             }
   }
   correl
}
