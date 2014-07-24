# get_data.R
# Download and extract data for this project

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- "UCI-HAR-Dataset.zip"

download.file(url, destfile=zipfile, method="curl")

unzip(zipfile)