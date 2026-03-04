## Getting and Cleaning Data Course Project
## run_analysis.R

## 1. Load required data -----------------------------------------------------

# Load feature names and activity labels
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "name"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",
                              col.names = c("activity", "activity_name"))

# Load training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# Load test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")


## 2. Merge training and test sets -------------------------------------------

# Apply feature names to measurement columns
colnames(x_train) <- features$name
colnames(x_test)  <- features$name

# Combine subject, activity, and measurements
train_data <- cbind(subject_train, y_train, x_train)
test_data  <- cbind(subject_test, y_test, x_test)

# Merge into one dataset
merged_data <- rbind(train_data, test_data)


## 3. Extract mean and standard deviation measurements ------------------------

mean_std_features <- grep("mean\\(\\)|std\\(\\)", features$name)
extracted_data <- merged_data[, c(1, 2, mean_std_features + 2)]


## 4. Use descriptive activity names -----------------------------------------

extracted_data <- merge(extracted_data, activity_labels, by = "activity", all.x = TRUE)
extracted_data$activity <- NULL  # remove numeric activity column

# Reorder columns: subject, activity_name, then measurements
extracted_data <- extracted_data[, c("subject", "activity_name",
                                     setdiff(names(extracted_data),
                                             c("subject", "activity_name")))]


## 5. Label dataset with descriptive variable names ---------------------------

names(extracted_data) <- gsub("^t", "Time", names(extracted_data))
names(extracted_data) <- gsub("^f", "Frequency", names(extracted_data))
names(extracted_data) <- gsub("Acc", "Accelerometer", names(extracted_data))
names(extracted_data) <- gsub("Gyro", "Gyroscope", names(extracted_data))
names(extracted_data) <- gsub("Mag", "Magnitude", names(extracted_data))
names(extracted_data) <- gsub("BodyBody", "Body", names(extracted_data))
names(extracted_data) <- gsub("-mean\\(\\)", "Mean", names(extracted_data))
names(extracted_data) <- gsub("-std\\(\\)", "Std", names(extracted_data))
names(extracted_data) <- gsub("[()]", "", names(extracted_data))
names(extracted_data) <- gsub("-", "", names(extracted_data))


## 6. Create tidy dataset with averages ---------------------------------------

tidy_data <- aggregate(. ~ subject + activity_name,
                       data = extracted_data,
                       FUN = mean)

tidy_data <- tidy_data[order(tidy_data$subject, tidy_data$activity_name), ]


## 7. Write tidy dataset to file ----------------------------------------------

write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
