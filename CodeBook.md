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



## Description of the input Dataset

## Features Information

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ

tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag

fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ

fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt', included in the dataset


## Description of the files on the data set

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



## Description of the operations performed


## 1) Reading of the data

Data was read from the following files:

- Test data:

- 'test/X_test.txt': Test set (feature vectors).
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


- Training data:

- 'train/X_train.txt': Training set (feature vectors).
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- Domain data:

- 'activity_labels.txt': Links the class labels with their activity name.
- 'features.txt': List of all features.


The data files were read to the following dataframes in R, whose dimensions are shown after their description:

- Test data:
measTst 	- Test measurements set, 2947 x 561 data frame
labTst 	- Test activity labels, 2947 x 1 data frame
subTst	- Test subject identification, 2947 x 1 data frame 

- Training data:
measTrn 	- Training measurements set, 7352  x 561 data frame
labTrn 	- Training activity labels, 7352  x 1 data frame
subTrn 	- Training subject identification, 7352  x 1 data frame 

- Domain data:
actNames      - Activity names, 6 x 2 data frame
measNames  - measurements names, 561 x 2 data frame

## 2) Merging of the training and the test sets

Data from training and test sets were merged to create a unique dataset.
For this purpose, data from the measTst, labTst, and subTst data frames were binded to the measTrn, labTrn and subTrn, respectively. 

The obtained data frames were named measAll, labAll and subAll, with the following dimensions:
measAll 	- Complete measurements set, 10299  x 561 data frame
labAll  	- Complete labels, 10299  x 1 data frame
subAll 	- Complete subject identification, 10299  x 1 data frame

## 3) Naming activities and variables

In order to provide the dataset with descritive variable names, the following tasks were performed:
- the columns of the measAll data frame were named using the features list in the second column of the measNames data frame;
- the only column of the subAll data frame was named  'Subject'; and
- a new column 'Activity' was added to the labAll data frame, containing the Activity name (second column from actNames data frame) related to the activity label of each row (only column in labAll data frame).

## 4) Selecting features

The goal of this step was to selected only the measurements on the mean and standard deviation for each measurement of the features vector.
The initially selected features were those including the 'mean()' or the 'std()' strings in the feature names (column names of the measAll data frame), but it should be noted that this selection includes also the meanFreq() values, which were not considered to be within the task requirements because these are somehow different categories than the simple mean measurements that the question asks for. 
So these meanFreq() values were retired from the selected columns. The final selection, performed creating a selCols vector using the intersection of two R grep commands, returns 66 features names, that will reference the selected columns in the measurements data set.

## 5) Intermediate data frame

The selected features from the measAll data frame were added to the column-only subAll data frame, containing the subject identification, followed by the  second column of the labAll data frame, containing the Activity name, to form a new complete data frame that was named fullData. 

So, this fullData data frame contains:

- the subject who performed the activity for each recorded data, in a column named 'Subject'. Its range is from 1 to 30; 

- the name of the performed activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), in a column named 'Activity', and 

- the selected features (means and standard deviation for each measurement) each in a different column, with the same name of the selected variables, as provided in the  'features.txt' file. The range of these columns is [3:68].

The dimensions of the data frame are: 10299   rows and 68 columns.

## 6) New tidy data frame

From the data frame obtained in the prior step, was obtained the average of each of the selected features, subgrouped by subject and activity, generating the new data frame newData. 
  
This newData data frame contains:

- the subject who performed the activity for each recorded data, in a column named 'Subject'. Its range is from 1 to 30; 

- the name of the performed activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), in a column named 'Activity', and 

- the average of each of the selected features (means and standard deviation for each measurement), each in a different column, with the same name of the selected variables, as provided in the  'features.txt' file. The range of these columns is [3:68].

The dimensions of the data frame are: 180 rows and 68 columns.

This final data frame is written in a 'csv' format as "NewData.txt"


