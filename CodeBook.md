---
title: "CodeBook"
author: "Phillip Henkels"
date: "July 23, 2015"
output: html_document
---

#Getting and Cleaning Data (Coursear) - Course Project
***

##Data Background 
***

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


##Orginal Data
***
The oringal data for this analysis was sourced from:  [Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

The zip folder contains the following files: 

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

For more information about the data please see the readme.txt file above click on the following link: [More Information](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


##Tidy Data
***
Running the script run_analysis.R will produce a tidy dataet which does the following:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Replaces the activitie variables with its respective name  
- Relabels the vectors in the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject

The final output file includes the following variables:

- 'subject': a unique identifier of the subject who carried out the experiment.
- 'activity': indicates what activty the subject was engaged in at the time the data was collected.
- 'avg_tBodyAcc_X_mean': the mean of movements on the X axis calculated by subject and activity
- 'avg_tBodyAcc_Y_mean': the mean of movements on the Y axis calculated by subject and activity
- 'avg_tBodyAcc_Z_mena': the mean of movements on the Z axis calculated by subject and activity
- 'avg_tBodyAcc_X_std': the standard deviation of movements on the X axis calculated by subject and activity
- 'avg_tBodyAcc_Y_std': the standard deviation of movements on the Y axis calculated by subject and activity
- 'avg_tBodyAcc_Z_std': the standard deviation of movements on the Z axis calculated by subject and activity


##References
***
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[2] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones