# Install useful packages
install.packages("sqldf")
library(sqldf)

# Download the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile="data", method="curl")

# Save the file version
dateDownloaded <-date()
 # Here: [1] "Fri Mar 13 05:51:46 2015"

# Read data
acs <- read.table("data", sep=",", header=TRUE)


# Equivalent function to unique(acs$AGEP)
sqldf("select distinct AGEP from acs")
