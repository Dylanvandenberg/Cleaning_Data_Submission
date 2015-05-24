##Getting and Cleaning Data Project.

This script inputs data from the Samsung wearables and outputs a tidy  data table.

The Repo contains:
*'run_analysis.R' which is the script to run in R to tidy the data.
*'Code Book.md'
*This mark-down file

How the Script works:
Download the samsung data and unzip to your working directory. 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You must set
your working directory as "....UCI HAR Dataset" before you run the code.

The code reads in the various datafiles, combines them and creates a single table.
The data is found in 2 groups:
*train
*test

For each group there is an x-table (data) and y-table (containing subject ID).

These are merged using the rbind and cbind commands, with correct column names applied ("Subject" and "Activity" which were missing).

Only the data fields with mean or standard deviation are kept, as well as the subject ID and activity label.

Lastly, the code tidies the field labels by replacing t with time and f with frequency.
It also removes the brackets in the labels.

The code ends by outputing the tidy data table. The dpylr package is used
and the data grouped by subject and activity, with the mean function applied.

A summary table is outputted as a text file ("Tidy data.txt")