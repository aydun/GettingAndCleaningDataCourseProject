# CodeBook.md 
for Getting and Cleaning Data course project

## Data

The data in means.txt are the means for a selection of measurements from the original data, grouped by subject and activity.

The selected measurements are those with "-mean()" or "-stdev()" in the original measurement name.  

Note that the project requirements are not clear as to exactly which variables should be included, for example, whether it is only names with "-mean()" or those with "mean" anywhere in them such as "angle(tBodyAccJerkMean),gravityMean)".  The project FAQ in the forum https://class.coursera.org/getdata-005/forum/thread?thread_id=23 leaves the question open.  I have interpreted it to be just those with "-mean()" or "-stdev()" but this could easily be changed by adjusting the "grep" statement in Step 2 of run_analysis.R

## Variables

### subject
The "subject" column is the identifier of the subject being measured.  This has the same meaning as the source data and is in the range 1 to 30.

### activity
The "activity" column is the name of the activity being measured.  The activity id in the source data is mapped via the data in the "activities.txt" file to obtain this activity name.  There are 6 activities.

### other variables
The remaining variables are the means of the selected measurements for each subject and activity.  The table below shows the mean variable name, the source column id (from X-train.txt and X-test.txt) and the source feature name (from activity_labels.txt).

Units: all measurements in the source data were normalized and bounded with [-1,1]

The variable name is derived from the original measurement name by converting to lowercase and removing dots, dashes and brackets.  The mapping is saved to the file "cols.txt" when the script is run.

For descriptions of the measurements see the original source data, particularly the features_info.txt file.

Note that since all variables here are means, the variable names have not further lengthened by appending "mean" or similar.


Variable name|Source column|Source feature name
-------|-------|--------
tbodyaccmeanx|1|tBodyAcc-mean()-X
tbodyaccmeany|2|tBodyAcc-mean()-Y
tbodyaccmeanz|3|tBodyAcc-mean()-Z
tbodyaccstdx|4|tBodyAcc-std()-X
tbodyaccstdy|5|tBodyAcc-std()-Y
tbodyaccstdz|6|tBodyAcc-std()-Z
tgravityaccmeanx|41|tGravityAcc-mean()-X
tgravityaccmeany|42|tGravityAcc-mean()-Y
tgravityaccmeanz|43|tGravityAcc-mean()-Z
tgravityaccstdx|44|tGravityAcc-std()-X
tgravityaccstdy|45|tGravityAcc-std()-Y
tgravityaccstdz|46|tGravityAcc-std()-Z
tbodyaccjerkmeanx|81|tBodyAccJerk-mean()-X
tbodyaccjerkmeany|82|tBodyAccJerk-mean()-Y
tbodyaccjerkmeanz|83|tBodyAccJerk-mean()-Z
tbodyaccjerkstdx|84|tBodyAccJerk-std()-X
tbodyaccjerkstdy|85|tBodyAccJerk-std()-Y
tbodyaccjerkstdz|86|tBodyAccJerk-std()-Z
tbodygyromeanx|121|tBodyGyro-mean()-X
tbodygyromeany|122|tBodyGyro-mean()-Y
tbodygyromeanz|123|tBodyGyro-mean()-Z
tbodygyrostdx|124|tBodyGyro-std()-X
tbodygyrostdy|125|tBodyGyro-std()-Y
tbodygyrostdz|126|tBodyGyro-std()-Z
tbodygyrojerkmeanx|161|tBodyGyroJerk-mean()-X
tbodygyrojerkmeany|162|tBodyGyroJerk-mean()-Y
tbodygyrojerkmeanz|163|tBodyGyroJerk-mean()-Z
tbodygyrojerkstdx|164|tBodyGyroJerk-std()-X
tbodygyrojerkstdy|165|tBodyGyroJerk-std()-Y
tbodygyrojerkstdz|166|tBodyGyroJerk-std()-Z
tbodyaccmagmean|201|tBodyAccMag-mean()
tbodyaccmagstd|202|tBodyAccMag-std()
tgravityaccmagmean|214|tGravityAccMag-mean()
tgravityaccmagstd|215|tGravityAccMag-std()
tbodyaccjerkmagmean|227|tBodyAccJerkMag-mean()
tbodyaccjerkmagstd|228|tBodyAccJerkMag-std()
tbodygyromagmean|240|tBodyGyroMag-mean()
tbodygyromagstd|241|tBodyGyroMag-std()
tbodygyrojerkmagmean|253|tBodyGyroJerkMag-mean()
tbodygyrojerkmagstd|254|tBodyGyroJerkMag-std()
fbodyaccmeanx|266|fBodyAcc-mean()-X
fbodyaccmeany|267|fBodyAcc-mean()-Y
fbodyaccmeanz|268|fBodyAcc-mean()-Z
fbodyaccstdx|269|fBodyAcc-std()-X
fbodyaccstdy|270|fBodyAcc-std()-Y
fbodyaccstdz|271|fBodyAcc-std()-Z
fbodyaccjerkmeanx|345|fBodyAccJerk-mean()-X
fbodyaccjerkmeany|346|fBodyAccJerk-mean()-Y
fbodyaccjerkmeanz|347|fBodyAccJerk-mean()-Z
fbodyaccjerkstdx|348|fBodyAccJerk-std()-X
fbodyaccjerkstdy|349|fBodyAccJerk-std()-Y
fbodyaccjerkstdz|350|fBodyAccJerk-std()-Z
fbodygyromeanx|424|fBodyGyro-mean()-X
fbodygyromeany|425|fBodyGyro-mean()-Y
fbodygyromeanz|426|fBodyGyro-mean()-Z
fbodygyrostdx|427|fBodyGyro-std()-X
fbodygyrostdy|428|fBodyGyro-std()-Y
fbodygyrostdz|429|fBodyGyro-std()-Z
fbodyaccmagmean|503|fBodyAccMag-mean()
fbodyaccmagstd|504|fBodyAccMag-std()
fbodybodyaccjerkmagmean|516|fBodyBodyAccJerkMag-mean()
fbodybodyaccjerkmagstd|517|fBodyBodyAccJerkMag-std()
fbodybodygyromagmean|529|fBodyBodyGyroMag-mean()
fbodybodygyromagstd|530|fBodyBodyGyroMag-std()
fbodybodygyrojerkmagmean|542|fBodyBodyGyroJerkMag-mean()
fbodybodygyrojerkmagstd|543|fBodyBodyGyroJerkMag-std()
