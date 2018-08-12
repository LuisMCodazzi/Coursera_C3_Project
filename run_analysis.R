## Script run_analysis.R 
#
# 0.  Reads data from provided dataset, which must be located at the working directory
# 1.	Merges the training and the test sets to create one data set.
# 2.	Extracts only the measurements on the mean and standard deviation for each measurement.
# 3.	Uses descriptive activity names to name the activities in the data set
# 4.	Labels the data set with descriptive variable names.
# 5.	Creates a new tidy data set with the average of each variable for each activity and each subject.
#
#
# Read Files 
# test data 
#  measTst: measurements
#  labTst: activity labels
#  subTst: subjects
measTst <- read.table("X_test.txt")		# -> [2947, 561]
labTst <- read.table("y_test.txt")		# -> [2947, 1]
subTst <- read.table("subject_test.txt")	# -> [2947, 1]

# training data
#  measTrn: measurements
#  labTrn: activity labels
#  subTrn: subjects
measTrn <- read.table("X_train.txt")		# -> [7352, 561]
labTrn <- read.table("y_train.txt")	  	# -> [7352, 1]
subTrn <- read.table("subject_train.txt")		# -> [7352, 1]

# activity names
actNames <- read.table("activity_labels.txt")	# -> [6, 2]
# measurements names - featues list 
measNames <- read.table("features.txt")		# -> [561, 2]

# Combine Files
# join test and training data
measAll <- rbind(measTst, measTrn)		# -> [10299, 561]
labAll <- rbind(labTst, labTrn)		  	# -> [10299, 1]
subAll <- rbind(subTst, subTrn)	    	# -> [10299, 1]

# set data column names
names(measAll) <- measNames[ ,2]
names(subAll) <- "Subject"

# include new column in labAll with activity names
labAll$Activity <- as.character(actNames[labAll[,1],2])

# select columns in measAll with mean() or std() calculations
# and unselect from them those with meanFreq() calculations
# selected Columns are 66 
#
selCols <- intersect(grep("mean()|std()", measNames[,2]), 
                  grep("meanFreq()", measNames[,2],invert=TRUE))

# gather all data in one dataframe -> [10299, 68]
fullData <- cbind(subAll, 
                  labAll[2], 
                  measAll[selCols])

# 
# Creates a new tidy data set with the average of 
# each variable for each activity and each subject
# (each selected activity is at column range [3:68])
#
# dimensions of the newData data frame: [180, 68]
#
newData <- aggregate(fullData[,3:68], 
                list( Subject = fullData$Subject, 
                      Activity = fullData$Activity), 
                mean)
#
# Saves generated tidy Data
# Table rows contain:
#  Subject
#  Activity
#  Means of each selected variable
#  
write.table(newData,sep=",", row.name=FALSE, file="NewData.txt")
#
