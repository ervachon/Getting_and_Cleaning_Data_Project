## Project : Getting and Cleaning Data
#
# 2015/02/08 : Version 1.0
# 
# how to use it : 
# source("run_analysis.R")
#

#libraries 
library(data.table)
library(dplyr)

# Global path of the files 
GlobalPath      <- "./UCI HAR Dataset/"

# test files
TestPath        <- paste(GlobalPath,"test/"           , sep ="")
TestDataFile    <- paste(TestPath,  "X_test.txt"      , sep ="")
TestDataLabels  <- paste(TestPath,  "y_test.txt"      , sep ="")
TestDataSubject <- paste(TestPath,  "subject_test.txt", sep ="")

# train files
TrainPath        <- paste(GlobalPath,"train/"          , sep ="")
TrainDataFile    <- paste(TrainPath,"X_train.txt"      , sep ="")
TrainDataLabels  <- paste(TrainPath,"y_train.txt"      , sep ="")
TrainDataSubject <- paste(TrainPath,"subject_train.txt", sep ="")

#Export file
ExportResultFile <- paste(GlobalPath," independent_tidy_data.txt"      , sep ="")

# labels
ActivityLabelsFile <- paste(GlobalPath,"activity_labels.txt", sep ="")
FeaturesLabelFiles <- paste(GlobalPath,"features.txt", sep ="")

#pattern for regular expression to filtre the column name
ThePattern <- '-mean\\(\\)|-std\\(\\)|ActivityName|idSubject'

importActivityLabelsFile <- function()
{
    #import file
    TheFile <- read.table(ActivityLabelsFile)
    
    #rename the columns
    colnames(TheFile) <- c("class","ActivityName")
    
    #return the result
    return(TheFile)
}

importFeaturesLabelsFiles <- function()
{
    #import file
    TheFile <- read.table(FeaturesLabelFiles)

    #rename the columns
    colnames(TheFile) <- c("idFeature","Feature")
    
    #return the result
    return(TheFile)
}

importDataFiles <- function(DataFile,ColumnFile,SubjectFile)
{
    #import files
    TheDataFile    <- read.table( file=DataFile )
    TheColumnFile  <- read.table( file=ColumnFile)
    TheSubjectFile <- read.table( file=SubjectFile)
    
    #rename the columns
    colnames(TheSubjectFile) <- "idSubject"
    colnames(TheColumnFile)  <- "class"
    colnames(TheDataFile)    <- MyFeaturesLabels$Feature
    
    #merge the files
    TheFileTmp = cbind(TheSubjectFile,TheDataFile,TheColumnFile)
    
    #join with the class
    TheFile <- inner_join(TheFileTmp, MyActivityLabels, by ="class")
    
    #return the result with the last var in firt (ActivityName)
    return(TheFile[,c(ncol(TheFile),c(1:(ncol(TheFile)-1)))])
}


#First import the necessary files

#Labels files
MyActivityLabels <- importActivityLabelsFile()
MyFeaturesLabels <- importFeaturesLabelsFiles()

#Data files
MyTest  <- importDataFiles(TestDataFile,TestDataLabels,TestDataSubject)
MyTrain <- importDataFiles(TrainDataFile,TrainDataLabels,TrainDataSubject)

#Merge the two files and 
TmpDataResult <- rbind(MyTrain,MyTest)

#find the column with mean() and std() and extract the columns 
TheResultOfRegularExpression <- c(grep(ThePattern, 
                                       names(TmpDataResult), 
                                       perl=T))
MyDataResult <- TmpDataResult[,TheResultOfRegularExpression]

#calculate the mean by ActivityName, idSubject
MyMeanResult <- MyDataResult %>% 
                    group_by(ActivityName, idSubject) %>% 
                        summarise_each(funs(mean))
#export the results
write.table(MyMeanResult,ExportResultFile, row.name=FALSE)

print("End of run_analysis.R")
