# Getting and Cleaning Data - Course Project

## Purpose of the project: 

Prepare tidy data, that can be used for later analysis, from provided raw data 

## Input Data: 

Dataset (Human Activity Recognition Using Smartphones Dataset, Version 1.0) that contains data regarding experiments carried out with a group of 30 subjects,  which performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist.

Using the smartphone's embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate.
The experiments were also video-recorded to label the data manually with the performed activities.

The sensor signals (accelerometer and gyroscope) were pre-processed and sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 

From each window, a vector of features was obtained by calculating variables from the time and frequency domain (see Features of the input Dataset for more details).  The features were normalized and bounded within [-1,1], and each feature vector is a row on the text file.

The obtained dataset was randomly partitioned into two sets, where 70% of the subjects were selected for generating the training data and 30% the test data.

## Output Data: 

New Dataset, containing averages of some selected features (measurements on the mean and standard deviation for each measurement), grouped for each activity and each subject.



## Description of the files on the input data set

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


## Links to the data and description of the experiments:

- Data set:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

- Description of the data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


  
## Description of the output data set

This newData data frame contains:

- the subject who performed the activity for each recorded data, in a column named 'Subject'. Its range is from 1 to 30; 

- the name of the performed activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), in a column named 'Activity', and 

- the average of each of the selected features (means and standard deviation for each measurement), each in a different column, with the same name of the selected variables, as provided in the  'features.txt' file. The range of these columns is [3:68].

The dimensions of the data frame are: 180 rows and 68 columns.

This output data frame is written in a 'csv' format as "NewData.txt"


