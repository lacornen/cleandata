## Getting and Cleaning Data project Readme

This file is the Readme for course project of [Getting and Cleaning Data Course] on platform Coursera. The objective of this project is to read the dataset  ["Human Activity Recognition Using Smartphones"], merge datas appropriately, compute relevant aggregate and output a tidy data set.

**Summary [run_analysis.R](run_analysis.R)**

This script is taking as an input a set of file that describes a train and a test dataset. 
The files are downloaded form the site link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Input data need to be processed in order to obtain a comprehensive output.

The script is first creating a dataframe with each row having a clear activity label and subject id, as well as comprehensive column name by merging various information contain in the input file. The train and test dataset are merged in a single dataframe.

The script is then computing mean and standard deviation aggregate for each column, aggregated by (subject, activity).

Finally, the tidy dataset is written to an ouput file. 

Please find detailed information about the analysis  in the [CodeBook](CodeBook.md).
                             

**The R script [run_analysis.R] output is a tidy data set [tidy_data_output.txt](tidy_data_output.txt).**

Please find more information about data in the [CodeBook](CodeBook.md).

