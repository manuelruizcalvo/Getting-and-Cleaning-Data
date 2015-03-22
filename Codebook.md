## Introduction

1. Measurements, activities and subjects data are merged into three single datasets. 
2. Filter not needed columns
3. Read activity labels from file
4. Give meaningful names to the columns
5. Add activities and subjects data to measurements data dataframe
6. Replace activities' numbers by names
7. Summarize data
8. Generate output

## Variables
* train, trainActivities, subjectTrain, test, testActivities and subjectTest contains data from downloaded files.
* total, totalActivities and subjectTotal cotains merged data.
* validColumns contains the number of the columns of interest 
* validData filters valid columns of total dataframe
* activityLabels contains labels for the 6 different activities
* features contains data from file "features.txt" and variableNames the names of all the variables of interest
* summaryData contains the solution of the current project