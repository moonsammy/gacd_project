Code Book
=================

Purpose
=================
Clean the raw data that was derived from this study http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and is available for download here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into a more easily digested dataset of only the mean and standard deviation for each measurement.

Project Specs (from Coursera)
=================
Create one R script called run_analysis.R that does the following. 
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Process
=================
The script run_analysis.R has five steps to convert the original raw data into a tidy dataset as set in the project specification.

First, all the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.
Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
On the whole dataset, those columns with vague column names are corrected.
Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this repository.

Variables and package specific functions
=================
Variables 'feature_data_file', 'activity_labels_file', 'x_train_data_file', 'y_train_data_file', 'subject_train_data_file', 'x_test_data_file', 'y_test_data_file', and 'subject_test_data_file' 
* Simple hard-coded names of the raw data files that need to be loaded for tidy data processing. 

Variables 'x_train_data', 'y_train_data', 'x_test_data', 'y_test_data', 'subject_train_data' and 'subject_test_data'
* Hold the raw data that was loaded from the downloaded files.

Variable 'training_sensor_data' 
* Holds the merged dataset created from x_train_data, subject_train_data and y_train_data
Variable 'test_sensor_data'
* Holds the merged dataset created from x_test_data, subject_test_data and y_test_data
Variable 'combined_data' 
* Holds the merged dataset created from 'training_sensor_data' and 'test_sensor_data'

Variable 'combined_labels'
* Holds the names for the 'combined_data' dataset, which are applied to the column names stored in mean_standard_data.

Variable 'sensor_avg_by_act_sub' 
* Is the tidy combined result data which contains the relevant averages that are the written into the tidy_data.txt file. 

The plyr package is required for this script to process correctly.  
ddply() is used from the plyr package to apply the 'Subject' and 'Activity' to mean_standard_data using the plyr pacakge numcolwise function.





