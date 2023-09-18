Peer-graded Assignment: Getting and Cleaning Data Course Project

This is the code book that describes the variables, the data, and any transformations or work that I performed to clean up the data as part of the Getting and Cleaning Data Course Project. 

The data source for the project are Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The data was downloaded from the following url ( 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzipped for the purposes of the present assignment. In addition to that, the data was transformed following these 5 steps: 

1. Merged the training and the test sets to create one data set: To do so, the training datasets, test datasets, feature vector and activity labels were read. Names were assigned to the main variables. Finally, both datasets, i.e. training dataset and test dataset were merged into one dataset namely "onedataset".
2. Extracted only the measurements on the mean and standard deviation for each measurement
3. Use descriptive activity names to name the activities in the data set
4. Appropriately labelled the data set with descriptive variable names. 
5. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.

The R script run_analysis.R can be employed to merge the data sets and create the independent tidy data set. 