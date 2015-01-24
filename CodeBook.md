# Code Book

## Study Design

The input data set required for this project is Human Activity Recognition Using Smartphones Dataset (Version 1.0).

Please see [study design] (study_design.md) taken from the readme.txt file distributed with this data set for more information.

## Code Book

The tidy data set contains the mean value of variables in the data set produced by the "mean" and "standard deviation" functions, grouped by the experiment subject [identified by unique number] and activity [e.g. Walking, Standing].

This rows in this data set are ordered by subject and activity variables; This was done in order to adhere to the [tidy data paper] (http://vita.had.co.nz/papers/tidy-data.pdf) by Hadley Wickham
 *...a good ordering makes it easier to scan the raw values*
 
### Tidy Data variable definition

subject - An identifier of the subject who carried out the experiment. Its range is from 1 to 30. 

activity - activity performed by the subject. Its range is WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

**This section is taken from features_info.txt which is distributed by the data set**
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals *and available in the tidy-data set is*

mean(): Mean value
std(): Standard deviation