README
========================================================

The run_analysis.R file executes the data analysis to generate tidy data
from the Human Activity Recognition Using Smartphones Dataset (Version 1.0)

The tidy data includes the mean and standard deviation columns from
the source data set.

In addition, the mean of the tidy data is included.

To execute the test execute function main.


Analysis approach
Due to time, the analysis script was not completed but the following is the high level steps for the analysis:
1. Read data files with measures ("X_test.txt" and "X_train.txt")
2. Extract only mean and standard deviation columns and add column name
3. Merge subject and activity data with measure data.  Note that since order is not perserved in merge, add file sequence number to join the merge.
4. Generate mean of columns