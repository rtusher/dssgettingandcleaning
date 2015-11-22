
library(dplyr)


#FUNCTION  ReadOneDataset( BaseDirectory, WhichSet, AcceptableFeatures, Activities) RETURNS "a cleaned dataset" that could be "train","test"
#   BaseDirectory       : The directory root of the data
#   WichSet             : Could be "train" or "test"
#   AcceptableFeatures  : Dataframe with the filtered names of features that should be processed
#   Activities          : Dataframe with the equivalences between activity ID   and its labels/names
#



ReadOneDataset <- function (BaseDirectory =".", WhichSet="train",  AcceptableFeatures = data.frame, Activities = data.frame  ) {
  
  
  # For autodocumentation this section 
  # defines the names of the files and folders to be used
  # when loading the data
  
  Folder <- paste( BaseDirectory,WhichSet,"",sep="/")
  OneSetOfValues.filename  <- paste(Folder,"x_",WhichSet,".txt",sep="")
  SubjectsOfTheSet.filename  <- paste(Folder,"subject_",WhichSet,".txt",sep="")
  ActivitiesOfTheSet.filename  <- paste(Folder,"y_",WhichSet,".txt",sep="")
  
  
  # The data is in 3 different files
  #   The first contains a number of rows with only the ID of the subject of the test
  #   The second contains THE SAME number of rows with only the ID of the activity made in the test
  #   The third contains THE SAME number of rows with ALL the values of measurements 
  #     correspondent to the SUBJECT ID  and ACTIVITY ID of the same row number from files 1 and 2
  #    
  
  # Read the Subject and assign the name to the column.  All capitalized to make easy to find
  SubjectColumn <-  read.table(SubjectsOfTheSet.filename , col.names=c("SUBJECT.ID") )
  
  # Read the activities and assign the name to the column.  All capitalized to make easy to find
  ActivitiesColumn  <- read.table(ActivitiesOfTheSet.filename , col.names=c("ACTIVITY.ID") )
  
  # Read the values and filter only SOLICITED  columns
  OneSetOfValues <-         read.table(OneSetOfValues.filename )%>% select(AcceptableFeatures$MEASURE.ID)
  
  # Clean de column names, deleting '()' and '-' to make easy to understand and manipulate
  colnames(OneSetOfValues)  <- AcceptableFeatures$MEASURE.NAME
  colnames(OneSetOfValues)  <- gsub("\\-",".",  gsub("\\(\\)","",colnames(OneSetOfValues)))
  
  
  # Concatenate all the columns to create a new dataframe with two extra columns 
  #   1) the subject that made the test
  #   2) The activity performed
  
  bind_cols( SubjectColumn, ActivitiesColumn, OneSetOfValues)
  
}







# FUNCTION  ObtainAndClean() RETURNS "a cleaned dataset" of both datasets provided "train" and "test
# Corresponds to the solution to numerals 1 to 4 of the project of DSS Course of November 2, 2015
# #


ObtainAndClean <- function (){
  
  BaseDirectory  <- "."
  ActivityNames  <- read.table("activity_labels.txt", col.names=c("ACTIVITY.ID","ACTIVITY.NAME"), sep=" ")
  AcceptableFeatures  <- read.table("features.txt", col.names=c("MEASURE.ID","MEASURE.NAME"), sep=" ")  %>% filter(grepl("mean", MEASURE.NAME) | grepl("std", MEASURE.NAME))
  
  
  Values  <-  rbind( ReadOneDataset(BaseDirectory,"train", AcceptableFeatures , ActivityNames) , ReadOneDataset(BaseDirectory,"test",  AcceptableFeatures  , ActivityNames))
  
  # Create a new column that assigns to each row the label of the ID that is in ACTIVITY.ID
  Values  <-  merge(ActivityNames, Values, by="ACTIVITY.ID")
  
  # Delete the column ACTIVITY.ID used only for the merge in the previous statement
  Values  <- Values  %>% select(-ACTIVITY.ID)
  Values
}  


#
# *******     ONLY FUNCTION TO BE CALLED TO PERFORM THE ANALYSIS        *****
# run_analysis()
# 
#


run_analysis  <- function() {
  
  DataSet  <- ObtainAndClean() 
  
  Summary  <-  DataSet %>% group_by(ACTIVITY.NAME, SUBJECT.ID) %>% summarise_each(funs(mean))
  
  write.table(Summary,file="TidyDataSetToUpload.txt",row.name=FALSE)
  Summary
}



