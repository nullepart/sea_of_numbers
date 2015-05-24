
Description of the project
==========================

This project was done as part of the Coursera course "Getting and Cleaning Data" and represents an attempt to present the Human Activity Recognition Using Smartphones Dataset (Version 1.0) prepared by Aguita, Ghio, Oneto, Parra and Reyes-Ortiz [1], in a format that respects the principles of tidy data presented by Wickham (2014)[2]. Accordingly, a selection of the data collected by Aguita et al., comprised of only the mean and standard deviation measurements of their experiment, was combined in a single table where:

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.



[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013, retrieved on 2015-05-24 at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[2] Hadley Wickham, “Tidy Data”, Journal of Statistical Software, 2014, 59(10), 1–23. URL http://www.jstatsoft.org/v59/i10/.


Study Design
============

## Original Data

The original data was obtained from the readings of the accelerometer and gyroscope of a Samsung Galaxy S II phone in an experiment where 30 subjects had to perform six activies: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. The authors did several transformation of the data, resulting in 561 variables measured for each of the activities performed by each of the 30 candidates. The data was subsequently separated into a training set and a testing set for the purpose of experimentation, and for each, three tables were presented: a *subject* table (y_train.txt, y_test.txt), a *features* (i.e. measurements) table (features.txt), and the *measurements collected* (X_train.txt., X_test.txt). For further information on this experiment, we refer the reader to the original description of the data in the file README.txt of the dataset, that one can find at http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

For the purposes of this course, the data was retrieved from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

## Contents of this repository

This repository contains the following files:
- README.md: this file
- CodeBook.md: a description of the variables present in the tidy dataset
- tidy.txt: our tidy dataset, presenting a subset of the variables or the raw dataset summarized as explained below
- run_analysis.R: a R script allowing to reconstruct our tidy dataset from the raw data

## Methodology

All analyses were done in R (version 3.2.0) and consigned in the run_analysis.R script. The script does the following.

### Step 1
- downloads and extract the raw data
- loads all the train data and joins the three table together to make one data frame
- loads all the test data and joins the three table together to make one data frame
- merges the train and test dataframes
- transforms the measurment names used in the raw dataset (features.txt) to make them valid names in R, then uses these as column headers in the merged data frame, transforming it into a data.table object in R

The result is a data.table comprising 563 columns (including one column identifying the subject, one identifying the activity performed, and 561 motion measurements) and 10,299 observations.

### Step 2
- of the 561 measurements, the script extracts the 79 measurements that constitute either a mean or a standard deviation of other measurements and creates a new table out of them

The result is a data.table comprising 81 columns (including one column identifying the subject, one identifying the activity performed, and 79 measurements) of 10,299 observations.

### Step 3
- renames the activity identifiers in the data.table using the activity labels provided by the authors of the raw dataset

### Step 4
As per the instructions, Step 4 was supposed to be the step where meaningful variable names were inserted as column headers in the data set. In effect, this step was done in Step 1.

### Step 5
- creates a an independent tidy data set with the average of each variable for each activity and each subject
- saves this dataset into a text file, *tidy.txt*, using commas as a separator.

The result is a comma-separated table of 81 columns (including one column identifying the subject, one identifying the activity performed, and 79 measurements) of 180 obseravations.









