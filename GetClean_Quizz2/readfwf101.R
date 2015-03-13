# Read this data set into R and report the sum of the numbers in the fourth of the nine columns. 
#https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for 

#This is a fixed width file. Use read.fwf()

x <- read.fwf(file=url("http://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"), skip=4, widths=c(12, 7,4, 9,4, 9,4, 9,4))
sum(x$V4)

#Answer: [1] 32426.7
