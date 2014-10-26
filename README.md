# Getting and Cleaning Data

## Course Project

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to work on this course project

1. Download the data in folder on your PC. You will get a ```UCI HAR Dataset``` folder.
2. Copy ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```, then using ```setwd()``` function in RStudio; set that parent folder as your working directory .
3. Run ```source("run_analysis.R")```,it is expected to produce a  file named ```tidy_data.txt```.

## Requirments 
```run_analysis.R```  depends on ```reshape2``` and ```data.table```. This is already considered in ```run_analysis.R``` 