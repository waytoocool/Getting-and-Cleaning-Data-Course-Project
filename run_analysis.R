install.packages("data.table")
install.packages("dplyr")
library(data.table)
library(dplyr)

#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# download zip file containing data if it hasn't already been downloaded
zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"

if (!file.exists(zipFile)) {
  download.file(zipUrl, zipFile, mode = "wb")
}

# unzip zip file containing data if data directory doesn't already exist
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
  unzip(zipFile)
}

# 4. Read the File with descriptive variable names
features <- fread(file.path(dataPath, "features.txt"))

# Read Training Dataset and Appropriately Label the dataset with descriptive variable names
X_train <- fread(file.path(dataPath, "train", "X_train.txt"), col.names = features$V2)
Y_train <- fread(file.path(dataPath, "train", "Y_train.txt"), col.names = "ActivityNumber")
sub_train <- fread(file.path(dataPath, "train", "subject_train.txt"), col.names = "Subject")


#Read Test Dataset
X_test <- fread(file.path(dataPath, "test", "X_test.txt"), col.names = features$V2)
Y_test <- fread(file.path(dataPath, "test", "Y_test.txt"), col.names = "ActivityNumber")
sub_test <- fread(file.path(dataPath, "test", "subject_test.txt"), col.names = "Subject")


# 1. Merges the training and the test sets to create one data set.
X_Total <- rbind(X_train, X_test)
Y_Total <- rbind(Y_train, Y_test)
sub_Total <- rbind(sub_train, sub_test)

XY_Total <- cbind(X_Total, Y_Total, sub_Total)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
FilteredColumn <- grepl("\\bmean()\\b", names(XY_Total)) | grepl("\\bstd()\\b", names(XY_Total)) |  grepl("\\bSubject\\b", names(XY_Total)) | grepl("\\bActivityNumber\\b", names(XY_Total))
XY_Total <- XY_Total[, ..FilteredColumn]


# Read the File with Activity names
ActivityLabels <- fread(file.path(dataPath, "activity_labels.txt"), col.names = c("ActivityNumber", "ActivityName"))

#3., 4. Uses descriptive activity names to name the activities in the data set


Melted <- melt(XY_Total, c("Subject","ActivityNumber"))

Melted$ActivityNumber <- factor(Melted$ActivityNumber, labels = ActivityLabels$ActivityName)

Casted <- dcast(Melted, Subject + ActivityNumber ~ variable, mean)

write.table(Casted, "tidy.txt", row.names = FALSE)