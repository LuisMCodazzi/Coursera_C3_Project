### Coursera_C3_Project
# Getting and Cleaning Data - Course Project

## Purpose of the project: 

To prepare tidy data, that can be used for later analysis, from provided raw data 

## Input Data: 

Given Dataset (Human Activity Recognition Using Smartphones Dataset, Version 1.0) that contains data regarding 
experiments carried out with a group of 30 subjects,  which performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. 

The sensor signals of the the smartphone's embedded accelerometer and gyroscope were captured, pre-processed 
and sampled in fixed-width sliding windows, and from each window, a vector of features was obtained by calculating 
variables. Each feature vector is a row on the text file.

The dataset is partitioned into two sets, where 70% of the subjects  generated the training data and 30% the test data.


## Output Data: 

New Dataset, containing averages of some selected features (measurements on the mean and standard deviation for each 
measurement), grouped for each activity and each subject, from the complete dataset unifying test and trainig data.


## Description of the procedure:


### 1) Reading of the data

Data was read from the following files:

1.1 Test data:

* 'test/X_test.txt': Test set (feature vectors).
* 'test/y_test.txt': Test labels.
* 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


1.2 Training data:

- 'train/X_train.txt': Training set (feature vectors).
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

1.3 Domain data:

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


### 2) Merging of the training and the test sets

Data from training and test sets were merged to create a unique dataset.
For this purpose, data from the measTst, labTst, and subTst data frames 
were binded to the measTrn, labTrn and subTrn, respectively. 

The obtained data frames were named measAll, labAll and subAll, 
with the following dimensions:
measAll 	- Complete measurements set, 10299  x 561 data frame
labAll  	- Complete labels, 10299  x 1 data frame
subAll 	- Complete subject identification, 10299  x 1 data frame

### 3) Naming activities and variables

In order to provide the dataset with descritive variable names, 
the following tasks were performed:
- the columns of the measAll data frame were named using the features list 
   in the second column of the measNames data frame;
- the only column of the subAll data frame was named  'Subject'; and
- a new column 'Activity' was added to the labAll data frame, containing the 
   Activity name (second column from actNames data frame) related to the activity 
   label of each row (only column in labAll data frame).

### 4) Selecting features

The goal of this step was to selected only the measurements on the mean and standard deviation 
for each measurement of the features vector.

The initially selected features were those including the 'mean()' or the 'std()' strings in the 
feature names (column names of the measAll data frame), but it should be noted that this selection 
includes also the meanFreq() values, which were not considered to be within the task requirements 
because these are somehow different categories than the simple mean measurements that the question 
asks for. So these meanFreq() values were retired from the selected columns. 

The final selection, performed creating a selCols vector using the intersection of two R grep commands, 
returns 66 features names, that will reference the selected columns in the measurements data set.

### 5) Intermediate data frame

The selected features from the measAll data frame were added to the column-only subAll data frame, 
containing the subject identification, followed by the  second column of the labAll data frame, 
containing the Activity name, to form a new complete data frame that was named fullData. 

So, this fullData data frame contains:

- the subject who performed the activity for each recorded data, in a column named 'Subject'.
  Its range is from 1 to 30; 

- the name of the performed activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, 
  STANDING, LAYING), in a column named 'Activity', and 

- the selected features (means and standard deviation for each measurement) each in a different column, 
  with the same name of the selected variables, as provided in the  'features.txt' file. 
  The range of these columns is [3:68].

The dimensions of the data frame are: 10299   rows and 68 columns.

### 6) New tidy data frame

From the data frame obtained in the prior step, was obtained the average of each of the selected 
features, subgrouped by subject and activity, generating the new data frame newData. 
  
This newData data frame contains:

- the subject who performed the activity for each recorded data, in a column named 'Subject'. 
  Its range is from 1 to 30; 

- the name of the performed activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, 
  STANDING, LAYING), in a column named 'Activity', and 

- the average of each of the selected features (means and standard deviation for each measurement), 
  each in a different column, with the same name of the selected variables, as provided in the 
  'features.txt' file. The range of these columns is [3:68].

The dimensions of the data frame are: 180 rows and 68 columns.

This final data frame is written in a 'csv' format as "NewData.txt"
