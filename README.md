##Getting and Cleaning Data Project.

This script inputs data from the Samsung wearables and outputs a tidy  data table.

The Repo contains:
*'run_analysis.R' which is the script to run in R to tidy the data.
*'run_analysis code book
*This mark-down file

How the Script works:
Download the samsung data and unzip to your working directory. You must set
your working directory as "....UCI HAR Dataset" before you run the code.

The code reads in the various datafiles, combines them and creates a single table.

Only the data fields with mean or standard deviation are kept, as well as the subject ID and activity label.

Lastly, the code tidies the field labels by replacing t with time and f with frequency.

The code ends by outputing the tidy data table.