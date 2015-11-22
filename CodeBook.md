## CodeBook
# Human Activity Recognition Using Smartphones Data Set



#Description



#The Experiment Source of Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions



#Obtaining the Raw Data

The data was obtained from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


#Preparing to Analyse Data

The file **'Dataset.zip'** should be unzipped to a directory/folder that will be the working directory for the analysis.


#What is the data?
The data consists of

-activity_labels.txt that contains a list of the **Activity Names**
-features.txt that contains a list of the **Measures** analysed.

For the **test** part of the experiment 

-test/X_test.txt that contains the Measures of the test part of the experiment. Each row comes from a specific subject performing specific activity.
-test/subject_test.txt that contains in row *n* of the X_test.txt file
-test/y_text.txt that contains the Activities performed by the subject in the *n* row of the X_test.txt  file

For the **train** part of the experiment

-train/X_test.txt that contains the Measures of the test part of the experiment. Each row comes from a specific subject performing specific activity.
-train/subject_test.txt that contains in row *n* of the X_test.txt file
-train/y_text.txt that contains the Activities performed by the subject in the *n* row of the X_test.txt  file




#What the Function *run_analysis* will do?


- Merge the two datasets 

- Create a tidy dataset inserting columns of the labels obtained from the Features and Activities files

- Extract the columns that contains Mean and 

- Change the names of the variables/columns for readability


#The Measurements of the Experiment 


- tBodyAcc-XYZ

- tGravityAcc-XYZ

- tBodyAccJerk-XYZ

- tBodyGyro-XYZ

- tBodyGyroJerk-XYZ

- tBodyAccMag

- tGravityAccMag

- tBodyAccJerkMag

- tBodyGyroMag

- tBodyGyroJerkMag

- fBodyAcc-XYZ

- fBodyAccJerk-XYZ

- fBodyGyro-XYZ

- fBodyAccMag

- fBodyAccJerkMag

- fBodyGyroMag

- fBodyGyroJerkMag



The set of variables that were estimated from these signals are: 

- mean(): Mean value

- std(): Standard deviation

- mad(): Median absolute deviation 

- max(): Largest value in array

- min(): Smallest value in array

- sma(): Signal magnitude area

- energy(): Energy measure. Sum of the squares divided by the number of values. 

- iqr(): Interquartile range 

- entropy(): Signal entropy

- arCoeff(): Autorregresion coefficients with Burg order equal to 4

- correlation(): correlation coefficient between two signals

- maxInds(): index of the frequency component with largest magnitude

- meanFreq(): Weighted average of the frequency components to obtain a mean frequency

- skewness(): skewness of the frequency domain signal 

- kurtosis(): kurtosis of the frequency domain signal 

- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:


- gravityMean

- tBodyAccMean

- tBodyAccJerkMean

- tBodyGyroMean

- tBodyGyroJerkMean




#Source
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

