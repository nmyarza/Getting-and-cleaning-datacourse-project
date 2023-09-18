### R script to performing the analysis for coursera 'Getting and Cleaning Data Course Project'

## Download and unzip dataset
Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
File <- "UCI HAR Dataset.zip"

if (!file.exists(File)) {download.file(Url, File, mode = "wb")}

Data <- "UCI HAR Dataset"
if (!file.exists(Data)) {unzip(zipFile)}


## Merge training and test datasets
  
  # 1 Read training datasets
  trainingSubjects <- read.table(file.path(Data, "train", "subject_train.txt"))
  trainingValues <- read.table(file.path(Data, "train", "X_train.txt"))
  trainingActivity <- read.table(file.path(Data, "train", "Y_train.txt"))

  # 2 Read test datasets
  testSubjects <- read.table(file.path(Data, "test", "subject_test.txt"))
  testValues <- read.table(file.path(Data, "test", "X_test.txt"))
  testActivity <- read.table(file.path(Data, "test", "y_test.txt"))
        
  # 3 Read feature vector
  features <- read.table(file.path(Data, "features.txt"), as.is = TRUE)

  # 4 Read activity labels
  activities <- read.table(file.path(Data, "activity_labels.txt"))
  colnames(activities) <- c("activityId", "activityLabel")

  # 5 Merge datasets
  onetrain <- rbind(
  cbind(trainingSubjects, trainingValues, trainingActivity),
  cbind(testSubjects, testValues, testActivity)
  )

  rm(trainingSubjects, trainingValues, trainingActivity, 
   testSubjects, testValues, testActivity)

  colnames(onetrain) <- c("subject", features[, 2], "activity")

## Extract only the measurements on the mean and standard deviation for each measurement
  columnsToKeep <- grepl("subject|activity|mean|std", colnames(onetrain))
  
  onetrain <- onetrain[, columnsToKeep]

## Use descriptive activity names to name the activities in the data set
  onetrain$activity <- factor(onetrain$activity, 
  levels = activities[, 1], labels = activities[, 2])

## Appropriately label the data set with descriptive variable names
  onetrainCols <- colnames(onetrain)
  onetrainCols <- gsub("[\\(\\)-]", "", onetrainCols)
  onetrainCols <- gsub("^f", "frequencyDomain", onetrainCols)
  onetrainCols <- gsub("^t", "timeDomain", onetrainCols)
  onetrainCols <- gsub("Acc", "Accelerometer", onetrainCols)
  onetrainCols <- gsub("Gyro", "Gyroscope", onetrainCols)
  onetrainCols <- gsub("Mag", "Magnitude", onetrainCols)
  onetrainCols <- gsub("Freq", "Frequency", onetrainCols)
  onetrainCols <- gsub("mean", "Mean", onetrainCols)
  onetrainCols <- gsub("std", "StandardDeviation", onetrainCols)
  onetrainCols <- gsub("BodyBody", "Body", onetrainCols)
  colnames(onetrain) <- onetrainCols

## From the data set in the previous step, create a second, independent tidy data set
  onetrainMeans <- onetrain %>% 
  group_by(subject, activity) %>%
  summarise_each(funs(mean))
  
  write.table(onetrainMeans, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)