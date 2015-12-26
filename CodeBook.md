## Getting and Cleaning Data project Codebook

This file is the CodeBook for course project of [Getting and Cleaning Data Course] on platform Coursera. The objective of this project is to read the dataset  ["Human Activity Recognition Using Smartphones"], merge the data appropriately, compute relevant aggregate and output a tidy data set.

**Input files**

Find below description of the input files.

"UCI HAR Dataset/features.txt": features id to features label mapping table
"UCI HAR Dataset/activity_labels.txt" : activity id to activity label mapping table
"UCI HAR Dataset/test/X_test.txt" : features variable of the test dataset
"UCI HAR Dataset/test/Y_test.txt" : activity id of the test dataset
"UCI HAR Dataset/test/subject_test.txt": subject id of the test dataset
"UCI HAR Dataset/train/X_train.txt": features variable of the train dataset
"UCI HAR Dataset/train/Y_train.txt": activity id of the train dataset
"UCI HAR Dataset/train/subject_train.txt": subject id of the train dataset

**Detailed operations performed by R script [run_analysis.R](run_analysis.R):**

Find below analysis performed by the script.

Note that it requires the [plyr package](https://cran.r-project.org/web/packages/plyr/index.html) which can be downloaded from CRAN.

1. Download the zip file from location [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip].
2. Extract the files in the subdirectory "UCI HAR Dataset/"."

3. Load in a dataframe data of the features label file "features.txt". That correspond to the name of each column in the X dataframe.

4. Load in a dataframe data of the activity labels "activity_labels.txt".  

3. Use the function GetTransFormSet to load and transform the Test set. Following operation are pefromed:
        * Load in a dataframe df.x the features variables from the test set : UCI HAR Dataset/test/X_test.txt
        * Load in a dataframe df.y , the activity id variables vector from the test set : UCI HAR Dataset/test/Y_test.txt
        * Load in a dataframe df.subject the subject number file . "UCI HAR Dataset/test/subject_test.txt".
        * Rename the column of features variable dataframe df.x according to label file features.txt.
        * Transform features variable dataframe df.x in order to filter out column that are neither Mean or Standard Deviation.
        * Tidy the column names using TidyVariableName function.
        * Create a column with activity label that correpsond to activity id vector in df.y$V1.
        * Create a column with subject number vector contained in file subject_test.txt.
        
4. Use the same function GetTransFormSet to load and transfrom the Train Set.

5. Bind the two train and test dataframe.

6. Compute mean of each feature variable column aggregated by subject and acitivity using ddply.

7. Ouput tidy data set.


**Description of the data in the tidy data set [tidy_data_output.txt](tidy_data_output.txt).**

Please find below description of the column of the output dataset.

- "subject" : Subject id of the row

- "activity" : Label of the activity performed

- "timeBodyAccelerationMean/StdDev-X/Y/Z" : averages of Mean and standard deviation of timeBodyAcceleration feature variable for each axis X,Y,Z for (subject,activity).

- "timeGravityAccelerationMean/StdDev-X/Y/Z"  : averages of Mean and standard deviation of timeGravityAcceleration feature variable for each axis X,Y,Z for (subject,activity).

- "timeBodyAccelerationJerkMean/StdDev-X/Y/Z" : averages of Mean and standard deviation of timeBodyAccelerationJerk feature variable for each axis X,Y,Z for (subject,activity).

- "timeBodyGyroMean/StdDev-X/Y/Z" : averages of Mean and standard deviation of timeBodyGyro feature variable for each axis X,Y,Z for (subject,activity).

- "timeBodyGyroJerkMean/StdDev-X/Y/Z" : averages of Mean and standard deviation of timeBodyGyroJerk feature variable for each axis X,Y,Z for (subject,activity).

- "timeBodyAccelerationMagnitudeMean/StdDev" : averages of Mean and standard deviation of timeBodyAccelerationMagnitude feature variable f for (subject,activity).

- "timeGravityAccelerationMagnitudeMean/StdDev" : averages of Mean and standard deviation of timeGravityAccelerationMagnitude feature variable f for (subject,activity). 

- "timeBodyAccelerationJerkMagnitudeMean/StdDev" : averages of Mean and standard deviation of timeBodyAccelerationJerkMagnitude feature variable f for (subject,activity). 

- "timeBodyGyroMagnitudeMean/StdDev" : averages of Mean and standard deviation of timeBodyGyroMagnitude feature variable f for (subject,activity). 

- "timeBodyGyroJerkMagnitudeMean/StdDev" : averages of Mean and standard deviation of timeBodyGyroJerkMagnitude feature variable f for (subject,activity). 

- "freqBodyAccelerationMean/StdDev-X/Y/Z" : averages of Mean and standard deviation of freqBodyAcceleration feature variable for each axis X,Y,Z for (subject,activity).

- "freqBodyAccelerationJerkMean/StdDev-X/Y/Z" : averages of Mean and standard deviation of freqBodyAccelerationJerk feature variable for each axis X,Y,Z for (subject,activity).

- "freqBodyGyroMean/StdDev-X/Y/Z" : averages of Mean and standard deviation of freqBodyGyro feature variable for each axis X,Y,Z for (subject,activity).

- "freqBodyAccelerationMagnitudeMean/StdDev" : averages of Mean and standard deviation of freqBodyAccelerationMagnitude feature variable f for (subject,activity).

- "freqBodyAccelerationJerkMagnitudeMean/StdDev" : averages of Mean and standard deviation of freqBodyAccelerationJerkMagnitude feature variable f for (subject,activity).

- "freqBodyGyroMagnitudeMean/StdDev"  : averages of Mean and standard deviation of freqBodyGyroMagnitude feature variable f for (subject,activity).

- "freqBodyGyroJerkMagnitudeMean/StdDev"  : averages of Mean and standard deviation of freqBodyGyroJerkMagnitude feature variable f for (subject,activity).

