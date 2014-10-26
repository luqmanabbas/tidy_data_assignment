# Create one R script called run_analysis.R that does the following:





# 1. Merges the training and the test sets to create one data set.






# 2. Extracts only the measurements on the mean and standard deviation for each measurement.






# 3. Uses descriptive activity names to name the activities in the data set


# 4. Appropriately labels the data set with descriptive activity names.










# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

if (!require("data.table")) { # if data.table package is required 
  
  
  
  
  
  install.packages("data.table")
  
  
  ## then install it 
  
  
}

if (!require("reshape2")) {
  
  
  ## if reshape2 package is required
  
  
  install.packages("reshape2")
  
  ## then install it 
  
  
}

require("data.table")


## get data.table



require("reshape2")


## get reshape2

# Now  Load: activity labels



activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]





#  Then Load:                   data column names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]






#  time to Extract   # the measurements             #   on the mean and                   standard deviation for each measurement.
extract_features <- grepl("mean|std", features)







#      then  Load and    # process   # X_test & y_test data.


# ----------


X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

#-----------


y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")


#####################
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(X_test) = features

# Get names as features

#  now   Extract only 
#  the measurements on the mean and
#  standard deviation for each measurement.



X_test = X_test[,extract_features]

# for loading of  activity labels



y_test[,2] = activity_labels[y_test[,1]]


names(y_test) = c("Activity_ID", "Activity_Label")



names(subject_test) = "subject"

# to Bind all data as one



test_data <- cbind(as.data.table(subject_test), y_test, X_test)



# for Loading  and processing  X_train as well as y_train data d0 :
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")


#--------
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")



#--------
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")


#--------
names(X_train) = features

# _______
X_train = X_train[,extract_features]

# _____ Load 
#             activity 
#                       data
y_train[,2] = activity_labels[y_train[,1]]



#----

names(y_train) = c("Activity_ID", "Activity_Label")

#-------


#------

names(subject_train) = "subject"





# Bind data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)




#######################################################################

# Merge test and train data
data = rbind(test_data, train_data)


#------------------------------

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

#-------------------------------

# Apply mean function to dataset using dcast function



#-----------------------------
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)
###################################################


# Finally


write.table(tidy_data, file = "./tidy_data.txt")

# All is well :)