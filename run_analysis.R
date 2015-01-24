# Set working directory to root directory where UCI HAR Dataset is
# e.g. on windows:
# setwd("C://getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

# Requires installation of :
# "LaF" package to read in fixed length text files
# quickly - version 0.6.1 was used to test this script
#
# "data.table" package to manipulate table data more
# efficiently in memory
# version 1.9.4 was used to test this script
#
# "dplyr" package to manipulate in memory data with SQL 
# like operations
# version 0.4.0 was used to test this script
#

if (!"LaF" %in% installed.packages()) install.packages(LaF)
if (!"data.table" %in% installed.packages()) install.packages(data.table)
if (!"dplyr" %in% installed.packages()) install.packages(dplyr)

library(LaF)
library(data.table)
library(dplyr)

## PART 1: 
## Merges the training and the test sets to create one data set.
##

# feature file column info
feature_col_info <- rep(16, 561) # col_width = 16, col_count = 561

# Read training data
# A. Read feature data
laf <- laf_open_fwf("./train/X_train.txt", column_widths = feature_col_info, 
                    column_types=rep("double", length(feature_col_info)),
                    )
training_data <- data.table(laf[,])
# B. Read activity data
training_data[,activity:=fread("./train/y_train.txt", sep = "\n", colClasses = c("integer"))]
# C. Read subject data
training_data[,subject:=fread("./train/subject_train.txt", sep = "\n", colClasses = c("integer"))]

# Read test data
# A. Read feature data
laf <- laf_open_fwf("./test/X_test.txt", column_widths = feature_col_info, 
                    column_types=rep("double", length(feature_col_info)),
)
test_data <- data.table(laf[,])
# B. Read activity data
test_data[,activity:=fread("./test/y_test.txt", sep = "\n", colClasses = c("integer"))]
# C. Read subject data
test_data[,subject:=fread("./test/subject_test.txt", sep = "\n", colClasses = c("integer"))]

# merge training and test data set
tidy_data <- merge(training_data, test_data, by=colnames(training_data), all=TRUE)

## PART 2: 
## Extracts only the measurements on the mean and standard deviation 
## for each measurement.

# Read Features
feature_labels <- fread("./features.txt", sep = " ", colClasses = c("integer", "character") )
target_col <- filter(feature_labels, grepl("mean|std\\(\\)", V2))
# select col numbers of features and append the activity and subject col no [last two columns]
target_col_nums <- c(as.vector(target_col$V1), ncol(tidy_data) - 1, ncol(tidy_data))
tidy_data <- select(tidy_data, target_col_nums)

## PART 3: 
## Uses descriptive activity names to name the activities in the data set
##
# Read activity labels
activity_labels <- fread("./activity_labels.txt", sep = " ", colClasses = c("integer", "character") )
# map activity column to use names instead of numbers
tidy_data$activity <- factor(tidy_data$activity, levels = activity_labels$V1, labels = activity_labels$V2)

## PART 4: 
## Appropriately labels the data set with descriptive variable names.
##
# list existing columns with the exception of activity and subject columns
old_column_labels <- colnames(tidy_data)[!grepl('activity|subject', colnames(tidy_data))]
new_column_labels <- target_col$V2
setnames(tidy_data, old = old_column_labels, new = new_column_labels)

## PART 5:
## From the data set in step 4, creates a second, independent tidy data set with 
## the average of each variable for each activity and each subject.
##
grouped_tidy_data <-
        tidy_data[, lapply(.SD, mean, na.rm=TRUE), by=c("subject", "activity")] %>%
        arrange(subject, desc(activity))

write.table(grouped_tidy_data, file = "./tidy_data.txt", row.name = FALSE)
