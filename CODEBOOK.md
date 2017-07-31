# Codebook
## Overview
This data was generated through testing of the accelerometer found in the Samsung S smartphone, and is stored in the UCI Machine learning Repository. The raw data was downloaded, cleaned and tidyed using R.

Source file: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities:
1. WALKING
2. WALKING_UPSTAIRS 
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING 
6.LAYING 

while wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Features
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* t_Body_Acceleration_XYZ
* t_Gravity_Acceleration_XYZ
* t_Body_Acceleration_Jerk_XYZ
* t_Body_Gyro_XYZ
* t_Body_Gyro_Jerk-XYZ
* t_Body_Acceleration_Magnitude
* t_Gravity_Acceleration_Magnitude
* t_Body_Acceleration_Jerk_Magnitude
* t_Body_Gyro_Magnitude
* t_Body_Gyro_Jerk_Magnitude
* f_Body__Acceleration_XYZ
* f_Body_AccJerk-XYZ
* f_Body_Gyro_XYZ
* f_Body_Acceleration_Magnitude
* f_Body_Acceleration_Jerk_Magnitude
* f_Body_Gyro_Magnitude
* f_Body_Gyro_Jerk_Magnitude

For each Feature, in the raw data it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

* Triaxial Angular velocity from the gyroscope. 

* A 561-feature vector with time and frequency domain variables. 

* Its activity label. 

* An identifier of the subject who carried out the experiment.

For each variable, the mean(Mean) and standard deviation(StDv) was calculated for each run of an activity

These activities were run multiple times; these were then averaged for the tidy data set to give one mean and one standard devation per variable per activity
