## run_analysis.R
## For "Getting and Cleaning Data" course project - rprog-005

library(reshape2)

# File paths
features.file <- "UCI HAR Dataset/features.txt"
activity.file <- "UCI HAR Dataset/activity_labels.txt"
xtrain.file   <- "UCI HAR Dataset/train/X_train.txt"
ytrain.file   <- "UCI HAR Dataset/train/y_train.txt"
strain.file   <- "UCI HAR Dataset/train/subject_train.txt"
xtest.file    <- "UCI HAR Dataset/test/X_test.txt"
ytest.file    <- "UCI HAR Dataset/test/y_test.txt"
stest.file    <- "UCI HAR Dataset/test/subject_test.txt"

## Step 1: we read in data from the various files for the test and 
## training data and combine them

# Read features and activity labels
features <- read.table(features.file, stringsAsFactors=FALSE, col.names=c("origcol","origname"))
activities <- read.table(activity.file, stringsAsFactors=FALSE)

# Read Test data
# Read xtest
xtest <- read.table(xtest.file)

# Read ytest & add as column "activity" to xtest
ytest <- read.table(ytest.file)
xtest$activity <- ytest[, 1]

# Read stest & add as column "subject" to xtest
stest <- read.table(stest.file)
xtest$subject <- stest[, 1]

# Read Train data - same steps
xtrain <- read.table(xtrain.file)

# Read ytrain & add as column "activity" to xtrain
ytrain <- read.table(ytrain.file)
xtrain$activity <- ytrain[, 1]

# Read strain & add as column "subject" to xtrain
strain <- read.table(strain.file)
xtrain$subject <- strain[, 1]

# Combine test and train data
combined <- rbind(xtest, xtrain)

## This completes Step 1 of the project

## For Step 2, we find the names that match "-mean()" or "-std()"
## and then subset those columns.
## Note that the project is not clear about whether only variables
## ending in "-mean()" are required or whether anything including
## "mean" in the name.  I have interpreted as the first but adjusting
## the script to handle the second just involves using the commented-out
## grep statement instead.  
## See https://class.coursera.org/getdata-005/forum/thread?thread_id=23

# Extract mean & stdev
# Look at features names for "-mean()" and "-std()"
fcols <- grep("-mean\\(\\)|-std\\(\\)", features[,2])
# fcols <- grep("mean|-std\\(\\)", features[,2])

# Include the two extra columns for "activity" and "subject"
cols <- c(fcols,ncol(combined)-1,ncol(combined))

# Select the required subset of columns
selected <- combined[,cols]

## For Step 3, we replace the activity number with the corresponding
## name from the activities dataframe

# Change activity column to name
selected$activity <- activities[selected$activity, 2]

## For Step 4, we create a tidy vetsion of the feature name by removing 
## dots, dashes and brackets and converting to lower case.  Then we apply
## the right subset as column names.

features$newname <- tolower(gsub("[\\.\\(\\)-]", "", features$origname))

names(selected) <- c(features$newname[fcols], "activity", "subject")

## For Step 5, we use the reshape2 libary to melt the data into a standard form
## and then re-cast it to calculate the mean of each variable for each subject 
## and each activity

melted <- melt(selected, c("subject", "activity"))

means <- dcast(melted, subject + activity ~ variable, mean)

## Save the new data set to a file, and write the column names to a file
write.table(means, file="means.txt", row.names=FALSE)
write.table(features[fcols,c(3,1,2)], file="cols.txt", row.names=FALSE)
