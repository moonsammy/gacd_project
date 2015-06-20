
# Load features data
feature_data_file <- "data/UCI\ HAR\ Dataset/features.txt"
features_data <- read.table( feature_data_file, colClasses = c("character") )
# Load activity labels
activity_labels_file <- "data/UCI\ HAR\ Dataset/activity_labels.txt"
activity_labels <- read.table( activity_labels_file, col.names = c("ActivityId", "Activity") )
# Load training data
x_train_data_file <- "data/UCI\ HAR\ Dataset/train/X_train.txt"
x_train_data <- read.table( x_train_data_file )
y_train_data_file <- "data/UCI\ HAR\ Dataset/train/y_train.txt"
y_train_data <- read.table( y_train_data_file )
subject_train_data_file <- "data/UCI\ HAR\ Dataset/train/subject_train.txt"
subject_train_data <- read.table( subject_train_data_file )
# Load testing data
x_test_data_file <- "data/UCI\ HAR\ Dataset/test/X_test.txt"
x_test_data <- read.table( x_test_data_file )
y_test_data_file <- "data/UCI\ HAR\ Dataset/test/y_test.txt"
y_test_data <- read.table( y_test_data_file )
subject_test_data_file <- "data/UCI\ HAR\ Dataset/test/subject_test.txt"
subject_test_data <- read.table( subject_test_data_file )

# 1. Merges the training and the test sets to create one data set.
# ---------------------------------------------------------------------------------------

# Combine training and test sets to a single data set
training_sensor_data <- cbind( cbind(x_train_data, subject_train_data), y_train_data )
test_sensor_data <- cbind( cbind(x_test_data, subject_test_data), y_test_data )
combined_data <- rbind( training_sensor_data, test_sensor_data )


# Apply labels to the combined dataset
combined_labels <- rbind( rbind(features_data, c(562, "Subject") ), c(563, "ActivityId"))[,2]
names( combined_data ) <- combined_labels


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# ---------------------------------------------------------------------------------------

# Filter for mean and std of each reading
mean_standard_data <- combined_data[,grepl("mean|std|Subject|ActivityId", names(combined_data))]


# 3. Uses descriptive activity names to name the activities in the data set
# ---------------------------------------------------------------------------------------

# Attach the activity labels to the filtered data set
mean_standard_data <- join( mean_standard_data, activity_labels, by = "ActivityId", match = "first" )
mean_standard_data <- mean_standard_data[,-1]


# 4. Appropriately labels the data set with descriptive variable names. 
# ---------------------------------------------------------------------------------------

# Remove parens
names( mean_standard_data ) <- gsub( '\\(|\\)', "", names(mean_standard_data), perl = TRUE )
# Make names
names( mean_standard_data ) <- make.names( names(mean_standard_data) )
# Apply display friendly more descriptive names
names( mean_standard_data ) <- gsub( 'Acc', "Acceleration", names(mean_standard_data) )
names( mean_standard_data ) <- gsub( 'GyroJerk', "AngularAcceleration", names(mean_standard_data) )
names( mean_standard_data ) <- gsub( 'Gyro', "AngularSpeed", names(mean_standard_data) )
names( mean_standard_data ) <- gsub( 'Mag', "Magnitude", names(mean_standard_data) )
names( mean_standard_data ) <- gsub( '^t', "TimeDomain.", names(mean_standard_data) )
names( mean_standard_data ) <- gsub( '^f', "FrequencyDomain.", names(mean_standard_data) )
names( mean_standard_data ) <- gsub( '\\.mean', ".Mean", names(mean_standard_data) )
names( mean_standard_data ) <- gsub( '\\.std', ".StandardDeviation", names(mean_standard_data) )
names( mean_standard_data ) <- gsub( 'Freq\\.', "Frequency.", names(mean_standard_data) )
names( mean_standard_data ) <- gsub( 'Freq$', "Frequency", names(mean_standard_data) )

# 5. From the data set in step 4, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject.
# ---------------------------------------------------------------------------------------
library( plyr )
# Build the tidy dataset
sensor_avg_by_act_sub = ddply( mean_standard_data, c("Subject","Activity"), numcolwise(mean) )
# Write out the new dataset fie
write.table( sensor_avg_by_act_sub, file = "gacd_project/tidy_data.txt" )

