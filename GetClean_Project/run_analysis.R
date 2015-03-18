#The code assumes the files are in your working directory

#Read the general description file
features = read.table("./features.txt")

#Read the useful data for the training sample
training = read.table("./train/X_train.txt")
trainlabel = read.table("./train/y_train.txt")
trainsub = read.table("./train/subject_train.txt")
#Rename the data in a comprehensive way (4.Appropriately labels the data set with descriptive variable names.)
names(training) <-features$V2
names(trainlabel) <-c("Activity")
names(trainsub)<-c("Subject")
#Creates the training set
finaltrain <- cbind(training, trainlabel, trainsub)

#Read the useful data for the test sample
test = read.table("./test/X_test.txt")
testlabel = read.table("./test/y_test.txt")
testsub = read.table("./test/subject_test.txt")
#Rename the data in a comprehensive (and coherent with above names) way (4.Appropriately labels the data set with descriptive variable names.)
names(test) <-features$V2
names(testlabel) <-c("Activity")
names(testsub) <-c("Subject")
#Creates the test set
finaltest <- cbind(test, testlabel, testsub)

# 1.Merges the training and the test sets to create one data set.
data <- rbind(finaltrain,finaltest)
# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
subdata <- subset(data, select = grep("mean()|std()|Activity|Subject", colnames(data)))
# 3.Uses descriptive activity names to name the activities in the data set
subdata$Activity[subdata$Activity==1] <- "walk"
subdata$Activity[subdata$Activity==2] <- "walkup"
subdata$Activity[subdata$Activity==3] <- "walkdown"
subdata$Activity[subdata$Activity==4] <- "sitting"
subdata$Activity[subdata$Activity==5] <- "standing"
subdata$Activity[subdata$Activity==6] <- "laying"

# 4.Appropriately labels the data set with descriptive variable names by reformatting according to R standards
valid_column_names <- make.names(names=names(subdata), unique=TRUE, allow_ = TRUE)
names(subdata) <- valid_column_names

# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata <- aggregate(subdata[0:(ncol(subdata)-2)], by=list(subdata$Activity, subdata$Subject), FUN=mean)
colnames(tidydata)[1] <- "Activity"
colnames(tidydata)[2] <- "Subject"
write.table(tidydata,file="MyData.txt",row.names=FALSE)
