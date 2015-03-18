#The American Community Survey distributes downloadable data about United States communities. Download the 2006 #microdata survey about housing for the state of Idaho using download.file() from here: 
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
#and load the data into R. The code book, describing the variable names is here: 
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 

#Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of #agriculture products. Assign that logical vector to the variable agricultureLogical. Apply the which() function like this to #identify the rows of the data frame where the logical vector is TRUE. which(agricultureLogical) What are the first 3 values #that result?

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="data.csv", method="curl")
mydata <- read.csv("data.csv")
mydata$agricultureLogical <- ifelse(mydata$ACR==3 & mydata$AGS==6, TRUE, FALSE)
which(mydata$agricultureLogical)

#Answer: 125  238  262

#Using the jpeg package read in the following picture of your instructor into R 
#https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg 
#Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data?

install.packages("jpeg")
library(jpeg)
pic <-readJPEG("data.jpg", native=TRUE)
quantile(pic, seq=(0,1,0.1))

#Answer:      0%       10%       20%       30%       40%       50%       60%       70% 
#-16776430 -15787693 -15518834 -15259150 -14927764 -14191406 -12363904 -11297076 
#      80%       90%      100% 
#-10575416  -5057565   -594524 

#Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
#Load the educational data from this data set: 
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 
#Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). What is the 13th country in the resulting data frame?
install.packages("dplyr")
library(dplyr)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile="data.csv", method="curl")
mydata1 <- read.csv("data.csv",na.strings=c(""))
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
mydata2 <- read.csv("data2.csv")

mydata1 <- mydata1[5:194,]
clean1 <- subset(mydata1, select=c("X", "Gross.domestic.product.2012", "X.3"))
clean2 <- subset(mydata2, select=c("CountryCode", "Income.Group"))

clean1 <- rename(clean1, Code=X, Rank=Gross.domestic.product.2012, GDP=X.3)
clean1$GDP <-gsub(",","",clean1$GDP)
clean1$GDP <-as.numeric(as.character(clean1$GDP))
clean1$Rank <-as.numeric(as.character(clean1$Rank))

clean2 <- rename(clean2, Code=CountryCode, Income=Income.Group)
mergedata <- merge(clean1, clean2, by.x="Code", by.y="Code")

#189 matches
sort <- arrange(mergedata, desc(Rank))
#St. Kitts and Nevis in 13th Rank

#What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
sel1<- mergedata[mergedata$Income=="High income: nonOECD",]
summary(sel1)
#Mean   : 91.91
sel2<- mergedata[mergedata$Income=="High income: OECD",]
summary(sel2)
#Mean   : 32.97

#Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP?
install.packages("Hmisc")
library(Hmisc)
sort <- arrange(mergedata, desc(GDP))
sel<-sort[1:38,]
sel2<-sel[sel$Income=="Lower middle income",]
str(sel2)
#Answer: 5
