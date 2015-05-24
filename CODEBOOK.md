
Code Book
=========

The origin of the tidy dataset is explained in the file README.md that is part of this repository. The tidy.txt dataset comprises the following measurements of the motion sensors (gyroscope and accelerometer) of a Samsung Galaxy S II smartphone:

## activity
Variable describing the six activities performed by the subjects: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

## subject
All 30 subjects who participated in the experiment.

## motion measurements: all 79 other variables

These measurements represent standardized measures (that is, without unit).

First, there are the measurements of the time domain signals (prefix: "t") of the acceleration of the *Body* or *Gravity* for each of the three dimensions. The authors also derived in time the body linear acceleration and the angular velocity to obtain *Jerk* signals.

These are:

- tBodyAcc.mean.X
- tBodyAcc.mean.Y
- tBodyAcc.mean.Z
- tBodyAcc.std.X
- tBodyAcc.std.Y
- tBodyAcc.std.Z
- tGravityAcc.mean.X
- tGravityAcc.mean.Y
- tGravityAcc.mean.Z
- tGravityAcc.std.X
- tGravityAcc.std.Y
- tGravityAcc.std.Z
- tBodyAccJerk.mean.X
- tBodyAccJerk.mean.Y
- tBodyAccJerk.mean.Z
- tBodyAccJerk.std.X
- tBodyAccJerk.std.Y
- tBodyAccJerk.std.Z


The same was done for the gyroscopic information.

- tBodyGyro.mean.X
- tBodyGyro.mean.Y
- tBodyGyro.mean.Z
- tBodyGyro.std.X
- tBodyGyro.std.Y
- tBodyGyro.std.Z
- tBodyGyroJerk.mean.X
- tBodyGyroJerk.mean.Y
- tBodyGyroJerk.mean.Z
- tBodyGyroJerk.std.X
- tBodyGyroJerk.std.Y
- tBodyGyroJerk.std.Z

The magnitude (*mag*) of these three-dimensional signals was then calculated using the Euclidian norm.

- tBodyAccMag.mean
- tBodyAccMag.std
- tGravityAccMag.mean
- tGravityAccMag.std
- tBodyAccJerkMag.mean
- tBodyAccJerkMag.std
- tBodyGyroMag.mean
- tBodyGyroMag.std
- tBodyGyroJerkMag.mean
- tBodyGyroJerkMag.std


The authors then applied a Fast Fourrier Transform (prefix: "f") to some of these signals, providing, for the acceleration:

- fBodyAcc.mean.X
- fBodyAcc.mean.Y
- fBodyAcc.mean.Z
- fBodyAcc.std.X
- fBodyAcc.std.Y
- fBodyAcc.std.Z
- fBodyAcc.meanFreq.X
- fBodyAcc.meanFreq.Y
- fBodyAcc.meanFreq.Z
- fBodyAccJerk.mean.X
- fBodyAccJerk.mean.Y
- fBodyAccJerk.mean.Z
- fBodyAccJerk.std.X
- fBodyAccJerk.std.Y
- fBodyAccJerk.std.Z
- fBodyAccJerk.meanFreq.X
- fBodyAccJerk.meanFreq.Y
- fBodyAccJerk.meanFreq.Z

... and for the gyroscopic information:

- fBodyGyro.mean.X
- fBodyGyro.mean.Y
- fBodyGyro.mean.Z
- fBodyGyro.std.X
- fBodyGyro.std.Y
- fBodyGyro.std.Z
- fBodyGyro.meanFreq.X
- fBodyGyro.meanFreq.Y
- fBodyGyro.meanFreq.Z

Finally, the magnitude (*mag*) of these three-dimensional signals was calculated, again using the Euclidian norm.

- fBodyAccMag.mean
- fBodyAccMag.std
- fBodyAccMag.meanFreq
- fBodyBodyAccJerkMag.mean
- fBodyBodyAccJerkMag.std
- fBodyBodyAccJerkMag.meanFreq
- fBodyBodyGyroMag.mean
- fBodyBodyGyroMag.std
- fBodyBodyGyroMag.meanFreq
- fBodyBodyGyroJerkMag.mean
- fBodyBodyGyroJerkMag.std
- fBodyBodyGyroJerkMag.meanFreq









