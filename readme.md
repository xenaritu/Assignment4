
##Introduction

Data was provided for experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

A series of measurements were taken for each activity. Our aim was to summarize this data of each activity at subject level.

##Steps of Analysis

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Codebook.md

Describes the variables, the data, and transformations performed to clean up the data

##run_analysis.R

Is the working code to create the tidy data set in the desired form. 
That calculates the mean of each measurement for each activity (of the six activities) for each subject (of the 30 subjects). 

