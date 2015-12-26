## "Getting and Cleaning Data" project

This project is for [Getting and Cleaning Data Course] on platform Coursera. The objective of this project is to read the dataset  ["Human Activity Recognition Using Smartphones"], merge the data appropriately, compute relevant aggregate and output a tidy data set.

**Operations performed by R script run_analysis.R:**
Note that it requires the [plyr package](https://cran.r-project.org/web/packages/plyr/index.html) which can be downloaded from CRAN.

**The R script [run_analysis.R] is performing the below operations.** 

1. Download the zip file from location [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip].
2. Extract the files in the subdirectory "UCI HAR Dataset/"."

3. Load in a dataframe data of the features label file "features.txt". That correspond to the name of each column in the X dataframe.

4. Load in a dataframe data of the activity labels "activity_labels.txt".  

3. Use the function GetTransFormSet to load the Test set which perform the following operation:
        * Load in a dataframe df.x the features variables from the test set : UCI HAR Dataset/test/X_test.txt
        * Load in a dataframe df.y , the activity id variables vector from the test set : UCI HAR Dataset/test/Y_test.txt
        * Load in a dataframe df.subject the subject number file . "UCI HAR Dataset/test/subject_test.txt".
        * Rename the column of features variable dataframe df.x according to label file features.txt.
        * Transform features variable dataframe df.x in order to filter out column that are neither Mean or Standard Deviation.
        * Tidy the column names using TidyVariableName function.
        * Create a column with activity label that correpsond to activity id vector in df.y$V1.
        * Create a column with subject number vector contained in file subject_test.txt.
        
4. Use the same function GetTransFormSet to load the Train Set.

5. Bind the two datasets.

6. Compute mean of each feature variable column aggregated by subject and acitivity.

7. Ouput tidy data set.
                             

**The R script [run_analysis.R] output is a tidy data set, [tidy_data_output.txt](tidy_data_output.txt).**

Please find more about the data  in the [codebook](CodeBook.md).

