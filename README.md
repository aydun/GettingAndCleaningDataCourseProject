# Getting and Cleaning Data Course Project

## Introduction

The code in this repository relates to the course project for the "Getting and Cleaning Data" course on http://www.coursera.org

## Data source
The data source is https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data description is at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Preparation
The zip file should be downloaded and extracted before running the run_analysis.R script included here.  The top directory of the zip file ("UCI HAR Dataset") should be a subdirectory of the working directory.  This can be done manually or by using the get_data.R script.

## Scripts
* get_data.R - this script can be used to download and extract the required data
* run_analysis.R - all the analysis is done in this script using the source data and creating the output files below

## Output
* means.txt - This file is tidied data set consisting of the means of a selection of variables from the original source as specified in the project description.  See CodeBook.md for details.
* cols.txt - This file lists the column names used in means.txt with the associated column numbers and feature names from the original data.

## Script processing
The run_analysis.R scripts follows the processing steps outlined in the course description.  

1.  Merge the training and data sets.
    + The relevant source data files are read and stored as data frames. 
    + The subject and activity data for the test and train data is attached to the respective data frames.
    + The testing and training data frames are combined.
2.  Extract the mean and standard deviation measurements.
    + Find the feature names that match "-mean()" or "-stdev()"
    + Create a subset of the combined data including only the columns just found, and the subject and activity columns.
3.  Use descriptive activity names.
    + Replace the activity column id's by the corresponding activity name.
4.  Label the dataset with descriptive variable names.
    + Create new variable names from the existing measurement names by converting to lowercase and removing dots, dashes and brackets.
    + Apply the appropriate subset of names to the selected data frame.
5.  Create a second, independent tidy data set with the average of each variable for each activity and each subject.
    + This uses the "reshape" library to first melt the data into a standard form.  The id variables are "subject" and "activity" with the remaining variables being measured variables.  This results in all other column names becoming values of a new "variable" column.
    + The dcast function further reshapes the data by taking the mean of each subject/activity/(variable) combination.
    + Write the tidy dataset and the generate feature mapping to text files.

Note that the ideal "tidy" form depends on what further processing is required.  I have left the data in a wide form, but it could be narrowed again using melt.

## References
*  "Tidy Data", Hadley Wickham, http://vita.had.co.nz/papers/tidy-data.pdf
*  "Reshaping Data with the reshape Package", Hadley Wickham, http://www.jstatsoft.org/v21/i12/paper
*  "David's Course Project FAQ", David Hood, https://class.coursera.org/getdata-005/forum/thread?thread_id=23


