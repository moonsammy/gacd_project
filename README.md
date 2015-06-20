Getting and Cleaning Data Course Project
========================================

Coursera project for the Getting and Cleaning Data course https://www.coursera.org/course/getdata),


Project background and requirements
========================================
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers
on a series of yes/no questions related to the project.

You will be required to submit:
1. a tidy data set as described below
2. a link to a Github repository with your script for performing the analysis, and
3. a code book that describes the variables, the data, and any transformations or
   work that you performed to clean up the data called CodeBook.md. You should also
   include a README.md in the repo with your scripts. This file explains how all
   of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing.
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced
algorithms to attract new users. The data linked to from the course website represent
data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive activity names. 
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


This repository
========================================
* CodeBook.md: Information about the proess of transforming raw data to a smaller and tidy set
* README.md: this file
* run_analysis.R: Script that transforms raw data set in a tidy one, when run from the working directory with data/


Processing steps
========================================
1. Clone this repository: `git clone git@github.com:moonsammy/gacd_project.git`
2. Download [compressed raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
3. Unzip raw data and copy the directory `data/UCI HAR Dataset` to the cloned repository root directory
4. Open a R console and set the working directory to the repository root
5. Source run_analisys.R script 

The script will result in the file `tidy_data.txt` being created in the root directory.
