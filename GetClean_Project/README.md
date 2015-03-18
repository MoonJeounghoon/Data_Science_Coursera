### Code description

This code was run using R version 3.1.2 (2014-10-31) -- "Pumpkin Helmet"
It requires as an input the following files: (you can change the path accordingly, here my working directory was set in the UCI HAR Dataset directory)

-"X_train.txt"
-"y_train.txt"
-"subject_train.txt
-"X_testtxt"
-"y_test.txt"
-"subject_test.txt"
-"features.txt"

No library needs to be install. The output is a txt file called "MyData.txt" with the average of each variable for each activity and each subject.
The code can be run using: source("run_analysis.R")
