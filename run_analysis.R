# GETTING AND CLEANING DATA
# COURSE PROJECT


# 1. Merge the training and the test sets
#    to create one data set.

# Download the data if it does not already exist in the working directory and unzip it
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileZipped <- "./getdata%2Fprojectfiles%2FUCI HAR Dataset.zip"
fileUnzipped <- "./UCI HAR Dataset"

if(!file.exists(fileZipped)) {
    download.file(fileUrl, destfile = fileZipped, method = "curl")
}

if (!file.exists(fileUnzipped)) { 
    unzip(fileZipped) 
}

# Load the training and test data into R
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")


# Merge the sets into one big dataframe
mergedData <- rbind(cbind(subject_train, y_train, X_train), cbind(subject_test, y_test, X_test))

# Remove the unnecessary data from memory
rm(subject_train, X_train, y_train,
   subject_test, X_test, y_test,
   fileUrl, fileZipped, fileUnzipped)


# 2. Extract only the measurements on the mean
#    and standard deviation for each measurement.

# Load the features data
features <- read.table("./UCI HAR Dataset/features.txt")

# Name columns of the merged data
colnames(mergedData) <- c("subject", "activity", as.character(features[, 2]))

# Select a subset of columns with 'mean' or 'sd' in their names 
# (and with subjects and measures, too)
selectedColumns <- grep("-mean\\()|-std\\()", colnames(mergedData))
mergedData <- mergedData[, c(1, 2, selectedColumns)]


# 3. Use descriptive activity names to name
#    the activities in the data set

# Load the activity labels data and factorise activities IDs the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
mergedData$activity <- factor(mergedData$activity,
                              levels = activity_labels[, 1],
                              labels = activity_labels[, 2])


# 4. Appropriately label the data set
#    with descriptive variable names.

# Extract column names
columnNames <- colnames(mergedData)

# Make the names more descriptive and get rid of unnecessary symbols
columnNames <- gsub("\\(\\)", "", columnNames)
columnNames <- gsub("\\-", "\\_", columnNames)
columnNames <- gsub("mean", "Mean", columnNames)
columnNames <- gsub("std", "StandardDeviation", columnNames)
columnNames <- gsub("^t", "Time_", columnNames)
columnNames <- gsub("Acc", "Acceleration", columnNames)
columnNames <- gsub("Gyro", "Gyroscope", columnNames)
columnNames <- gsub("Mag", "Magnitude", columnNames)
columnNames <- gsub("^f", "Frequency_", columnNames)

# Update the names of the dataset
colnames(mergedData) <- columnNames


# 5. From the data set in step 4, create a second, independent
#    tidy data set with the average of each variable
#    for each activity and each subject.

# Aggregate the data using dplyr package
library(dplyr)

finalData <- mergedData %>% 
    group_by(subject, activity) %>%
    summarise_all(mean)

# Save the data in a text file
write.table(finalData, "tidy_data.txt", row.names = FALSE, quote = FALSE)
