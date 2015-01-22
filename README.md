# Coursera, Getting and Cleaning Data Course Project

See CodeBook.md for data source, variable descriptions and transformations.
run_analysis.R  performs the following actions to process the data:

1. imports all UCI HAR datasets for the project (must be modified for your directory)
2. joins subjects and activities to 561 data variables
3. merges test and training datasets
4. selects only for variables that are means or standard deviations of measurements
5. renames variables using tidy standard
6. melts and recasts data to yield means for each subject/activity combination
7. outputs this dataframe as a table
