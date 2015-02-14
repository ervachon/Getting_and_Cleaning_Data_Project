# Getting and Cleaning Data Project V 1.0
## 2015/02/10

This repository containt the script run_analysis.R 

you can run this scirpt using in a R session this command : source("run_analysis.R") 

but before you must download the data on the directory SamsungData
if the data are on another directory you must modify the path thanks to the variables in the R code :
- GlobalPath 
- TestPath   
- TestDataFile    
- TestDataLabels  
- TestDataSubject 
- TrainPath        
- TrainDataFile    
- TrainDataLabels  
- TrainDataSubject 
- ExportResultFile 

The data result can be found in the  <strong>SamsungData</strong> directory : <strong>independent_tidy_data.txt</strong>

The original data used can be found there :
* <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">getdata-projectfiles-UCI HAR Dataset.zip</a> 
and came from :
* <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">Human Activity Recognition Using Smartphones Data Set </a>

