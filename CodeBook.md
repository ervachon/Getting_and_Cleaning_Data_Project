# CodeBook version 1.0

* the library
  * library(data.table)
  * library(dplyr)
* the variables
 * GlobalPath : root path of the data set     
 * TestPath : path of the directory of data test      
 * TestDataFile : filename of the test file
 * TestDataLabels : filename of the test label file  
 * TestDataSubject : filename of the test data subject file 
 * TrainPath : path of the directory of data train       
 * TrainDataFile : filename of the train file   
 * TrainDataLabels : filename of the train label file 
 * TrainDataSubject : filename of the train data subject file
 * ExportResultFile: filename of the export file
 * ActivityLabelsFile : filename of the activity label file 
 * FeaturesLabelFile : filename of the features label file 
 * ThePattern : regular expression to find the column name of the data result 
* the functions
 * importActivityLabelsFile : function to import the activity label in a data table
 * importFeaturesLabelsFile : function to import the activity label in a data table
 * importDataFiles : import both test and train. It is possible because thes test and train have the same structure
* the data (from the getdata-projectfiles-UCI HAR Dataset.zip)
 * X_test.txt 
 * y_test.txt
 * subject_test.txt
 * X_train.txt
 * y_train.txt
 * subject_train.txt
 * activity_labels.txt
 * features.txt
 * independent_tidy_data.txt : name of the result data
* transformations or work that you performed to clean up the data
 *  import labels
 *  import data 
 *  merge test and train
 *  find the column with mean() and std() and extract the columns 
 *  calculate the mean by ActivityName and Subject
 *  export the results
