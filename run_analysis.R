#
# run_analysis.R
#
# Description:  Script to analyze UCI Data Set
#               main function runs the analysis
#


#
# getSubData
# Decription: helper function
#
getSubData <- function(filename, subjectFile, type) {
  # read test data
  rawdata <- read.table(filename, header=FALSE, sep="",
                        colClasses=c(rep("numeric", 561)))
  
  # columns which are mean and std
  meanstd_col=c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,
                121,122,123,124,125,126,161,162,163,164,165,166,
                201,202,214,215,227,228,240,241,253,254,266,267,
                268,269,270,271,294,295,296,345,346,347,348,349,
                350,373,374,375,424,425,426,427,428,429,452,453,
                454,503,504,513,516,517,526,529,530,539,542,543,
                552)
  meanstd_colNames=c("tBodyAcc-mean-X", "tBodyAcc-mean-Y",
    "tBodyAcc-mean-Z", "tBodyAcc-std-X", "tBodyAcc-std-Y",
    "tBodyAcc-std-Z", "tGravityAcc-mean-X", "tGravityAcc-mean-Y",
    "tGravityAcc-mean-Z", "tGravityAcc-std-X", "tGravityAcc-std-Y",
    "tGravityAcc-std-Z", "tBodyAccJerk-mean-X", "tBodyAccJerk-mean-Y",
    "tBodyAccJerk-mean-Z", "tBodyAccJerk-std-X", "tBodyAccJerk-std-Y",
    "tBodyAccJerk-std-Z", "tBodyGyro-mean-X", "tBodyGyro-mean-Y",
    "tBodyGyro-mean-Z", "tBodyGyro-std-X", "tBodyGyro-std-Y",
    "tBodyGyro-std-Z", "tBodyGyroJerk-mean-X", "tBodyGyroJerk-mean-Y",
    "tBodyGyroJerk-mean-Z", "tBodyGyroJerk-std-X", "tBodyGyroJerk-std-Y",
    "tBodyGyroJerk-std-Z", "tBodyAccMag-mean", "tBodyAccMag-std",
    "tGravityAccMag-mean", "tGravityAccMag-std", "tBodyAccJerkMag-mean",
    "tBodyAccJerkMag-std", "tBodyGyroMag-mean", "tBodyGyroMag-std",
    "tBodyGyroJerkMag-mean", "tBodyGyroJerkMag-std", "fBodyAcc-mean-X",
    "fBodyAcc-mean-Y", "fBodyAcc-mean-Z", "fBodyAcc-std-X",
    "fBodyAcc-std-Y", "fBodyAcc-std-Z", "fBodyAcc-meanFreq-X",
    "fBodyAcc-meanFreq-Y", "fBodyAcc-meanFreq-Z", "fBodyAccJerk-mean-X",
    "fBodyAccJerk-mean-Y", "fBodyAccJerk-mean-Z", "fBodyAccJerk-std-X",
    "fBodyAccJerk-std-Y", "fBodyAccJerk-std-Z", "fBodyAccJerk-meanFreq-X",
    "fBodyAccJerk-meanFreq-Y", "fBodyAccJerk-meanFreq-Z",
    "fBodyGyro-mean-X", "fBodyGyro-mean-Y", "fBodyGyro-mean-Z",
    "fBodyGyro-std-X", "fBodyGyro-std-Y", "fBodyGyro-std-Z",
    "fBodyGyro-meanFreq-X", "fBodyGyro-meanFreq-Y",
    "fBodyGyro-meanFreq-Z", "fBodyAccMag-mean", "fBodyAccMag-std",
    "fBodyAccMag-meanFreq", "fBodyBodyAccJerkMag-mean",
    "fBodyBodyAccJerkMag-std", "fBodyBodyAccJerkMag-meanFreq",
    "fBodyBodyGyroMag-mean", "fBodyBodyGyroMag-std",
    "fBodyBodyGyroMag-meanFreq", "fBodyBodyGyroJerkMag-mean",
    "fBodyBodyGyroJerkMag-std", "fBodyBodyGyroJerkMag-meanFreq"
  )
  
  subData <- rawdata[,meanstd_col]
  colnames(subData) <- meanstd_colNames
  subData$dataset=type
  
  # TODO: Add file row sequence number to merge by
  
  # get subject data
  subjectData <- read.table(subjectFile, header=FALSE, sep="")
  # TODO: Add file row sequence number to merge by
  
  # get actvity data
  activityData <- read.table(activityFile, header=FALSE, sep="")
  # TODO: Add file row sequence number to merge by
  
  # merge data
  mergedData0 <- merge(subData, subjectData, by="seqNo")
  mergedData <- merge(mergeData0, activityData, by="seqNo")
}


#
# main
# Decription: run the analysis
#
main <- function() {
  testData <- getSubData("X_test.txt", "subject_test.txt",
                         "y_test.txt", "test")
  trainData <- getSubData("X_train.txt", "subject_train.txt",
                          "y_train.txt", "train")
  
  workingData <- merge(testData, trainData)
  
  avgData <- apply(workingData, 2, mean)
}
