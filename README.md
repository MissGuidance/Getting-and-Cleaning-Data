## Getting-and-Cleaning-Data Project 
### Objectives 

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.

*You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

*Review criteria

1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

*run_analysis.R

1. The script creates a new directory for storing the UCI data, downloads the UCI HAR Dataset and unzips it into the newly created directory.
2. The test and training datasets for x, y and subject are then saved as separate data frames and combined row wise.
3. The mean and standard deviation values are then extracted for each measurement from the features.txt file and the names are applied to the merged tests and training dataset x.
4. Activity_labels.txt file is then used to incorporate the activity and subject names into the y and subject datasets.
5. The 3 datasets are then bound column wise and exported as clean_dataset.txt 
6. The average for each variable, activity and subject is then computed and exported as a separate text file called average_values.txt




