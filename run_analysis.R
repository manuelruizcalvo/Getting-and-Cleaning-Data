## Load the plyr library
library(plyr) 

## Merges the training and the test sets to create one data set.

train <- read.table("X_train.txt")
trainActivities <- read.table("y_train.txt")
subjectTrain <- read.table("subject_train.txt")

test <- read.table("X_test.txt")
testActivities <- read.table("y_test.txt")
subjectTest <- read.table("subject_test.txt")

total <- merge(train,test,all=TRUE)
totalActivities <- as.data.frame(c(trainActivities[,1],testActivities[,1]))
subjectTotal <- merge(subjectTrain,subjectTest,all=TRUE)

## Extracts only the measurements on the mean and standard deviation for each measurement. 
validColumns <- c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)
validData <- total[,validColumns]

## Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("activity_labels.txt")

## Appropriately labels the data set with descriptive variable names. 
features <- read.table("features.txt")
variableNames <- features[validColumns,2]
names(validData) <- variableNames

## Add activities and subject data
validData[,"Activities"] <- totalActivities
validData[,"Subjects"] <- subjectTotal

## Change activity numeric values to string values
validData[,67] <- activityLabels[validData[,67],2]

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
summaryData <- ddply(validData,.(Activities,Subjects),function(x) colMeans(x[,1:66]))

write.table(summaryData,"summaryData.txt",row.name=FALSE)
