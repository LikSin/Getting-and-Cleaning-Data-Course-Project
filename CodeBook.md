# CodeBook for run_analysis.R

## Introduction
This code book contains information on the variables, data and work that was performed by the R script to generate the tidydata data set that was output as tidydata.txt.

## Raw data preprocessing

### Collection of raw data
Download the raw data from weblink https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Unzip to reveal _UCI HAR Dataset_ folder containing the following files:
1. 'README.txt' containing summary of the data set collected, files and description of each file included in the data set,  additional notes and license information.
2. 'features_info.txt' which provides an explanation of what each feature represents.
3. 'features.txt' is a list of all features which will be used as column names.
4. 'activity_labels.txt' links the class labels found in y_train.txt and y_test.txt with their activity name.
5. Subfolder _train_
	1. 'train/X_train.txt' contains data on the training set.
	2. 'train/y_train.txt' contains data on activities performed by the subject.
	3. 'train/subject_train.txt' identifies the subject on the training set who performed the activity for each window sample in each row. Its range is from 1 to 30. 
	4. Subfolder _Inertia Signals_ whose contents are not used by the R script.
6. Subfolder _test
	1. 'test/X_test.txt' contains data on the test set.
	2. 'train/y_test.txt' contains data on activities performed by the subject.
	3. 'train/subject_test.txt' identifies the subject on the test set who performed the activity for each window sample in each row. Its range is from 1 to 30.
	4. Subfolder _Inertia Signals_ whose contents are not used by the R script.

### Notes on the original (raw) data
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

## Creating the tidy datafile

### Guide to create the tidy data file

1. Follow the section above to downloaded the raw data and unzip to reveal _UCI HAR Dataset_ folder.
2. Open your preferred IDE for R programming.
3. Set the working directory as the _UCI HAR Dataset_ folder using setwd(). For e.g., setwd("C:\\Users\\Admin\\Desktop\\UCI HAR Dataset")
4. Source the R script run_analysis.R
5. The tidy data set _tidydata.txt_ can then be found in the working directory.

### Cleaning of the data

The R script run_analysis.R takes in testing and training data collected from the accelerometers from the Samsung Galaxy S smartphone, merges the data, and outputs the average for mean and standard deviation measurements of each subject and each activity.
Details of the code can be found in the README.md file.

## Description of the variables in the tidydata.txt file

Dimensions of the dataset:
* The dataset consists of 180 rows of data from 30 subjects and 6 activities per subject.
* There are a total of 68 columns of data.

Summary of the data:
* The first column with column name "Subject" contains the subject number while the second column with column name "Activity" contains description of the activity.
* Column 3 to 68 contains the average of each mean and standard deviation variable for each activity and each subject.
* The Average of time domain signalss coming from the accelerometer and gyroscope 3-axial raw signals were captured at a constant  . Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
* Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.
* Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals.

Variables present in the dataset for each column:
1. Column name: Subject, Class: Integer, Description: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

2. Column name: Activity, Class: Character, Description: Each row identifies the activity that was performed. There are 6 activities in total - "WALKING
", "WALKING_UPSTAIRS
", "WALKING_DOWNSTAIRS", "SITTING", "STANDING
", "LAYING"


3. Column name: time domain body acceleration mean average value in the X direction, Class: Number, Description: Average of time domain signals measuring mean of body acceleration signal in the X direction.

4. Column name: time domain body acceleration mean average value in the Y direction, Class: Number, Description: Average of time domain signals measuring mean of body acceleration signal in the Y direction.

5. Column name: time domain body acceleration mean average value in the Z direction, Class: Number, Description: Average of time domain signals measuring mean of body acceleration signal in the Z direction.

6. Column name: time domain gravity acceleration mean average value in the X direction, Class: Number, Description: Average of time domain signals measuring mean of gravity acceleration signal in the X direction.

7. Column name: time domain gravity acceleration mean average value in the Y direction, Class: Number, Description: Average of time domain signals measuring mean of gravity acceleration signal in the Y direction.

8. Column name: time domain gravity acceleration mean average value in the Z direction, Class: Number, Description: Average of time domain signals measuring mean of gravity acceleration signal in the Z direction.

9. Column name: time domain body acceleration jerk action mean average value in the X direction, Class: Number, Description: Average of time domain signals  measuring mean of body linear acceleration derived in time in the X direction

10. Column name: time domain body acceleration jerk action mean average value in the Y direction, Class: Number, Description: Average of time domain signals  measuring mean of body linear acceleration derived in time in the Y direction

11. Column name: time domain body acceleration jerk action mean average value in the Z direction, Class: Number, Description: Average of time domain signals  measuring mean of body linear acceleration derived in time in the Z direction

12. Column name: time domain body angular velocity mean average value in the X direction, Class: Number, Description: Average of time domain signals  measuring mean of body angular velocity in the X direction

13. Column name: time domain body angular velocity mean average value in the Y direction, Class: Number, Description: Average of time domain signals  measuring mean of body angular velocity in the Y direction

14. Column name: time domain body angular velocity mean average value in the Z direction, Class: Number, Description: Average of time domain signals  measuring mean of body angular velocity in the Z direction

15. Column name: time domain body angular velocity jerk action mean average value in the X direction, Class: Number, Description: Average of time domain signals measuring mean of body angular velocity derived in time in the X direction

16. Column name: time domain body angular velocity jerk action mean average value in the Y direction, Class: Number, Description: Average of time domain signals measuring mean of body angular velocity derived in time in the Y direction

17. Column name: time domain body angular velocity jerk action mean average value in the Z direction, Class: Number, Description: Average of time domain signals  measuring mean of body angular velocity derived in time in the Z direction

18. Column name: time domain body acceleration magnitude mean average value, Class: Number, Description: Average of time domain signals measuring mean of magnitude of body acceleration according to Euclidean norm.

19. Column name: time domain gravity acceleration magnitude mean average value, Class: Number, Description: Average of time domain signals measuring mean of magnitude of gravity acceleration according to Euclidean norm.

20. Column name: time domain body acceleration jerk action magnitude mean average value, Class: Number, Description: Average of time domain signals measuring mean of magnitude of body linear acceleration derived in time according to Euclidean norm.

21. Column name: time domain body angular velocity magnitude mean average value, Class: Number, Description: Average of time domain signals measuring mean of magnitude of body angular velocity according to Euclidean norm.

22. Column name: time domain body angular velocity jerk action magnitude mean average value, Class: Number, Description: Average of time domain signals measuring mean of magnitude of body angular velocity derived in time according to Euclidean norm.

23. Column name: frequency domain body acceleration mean average value in the X direction, Class: Number, Description: Average of frequency domain signals measuring mean of body acceleration signal in the X direction.

24. Column name: frequency domain body acceleration mean average value in the Y direction, Class: Number, Description: Average of frequency domain signals measuring mean of body acceleration signal in the Y direction.

25. Column name: frequency domain body acceleration mean average value in the Z direction, Class: Number, Description: Average of frequency domain signals measuring mean of body acceleration signal in the Z direction.

26. Column name: frequency domain body acceleration jerk action mean average value in the X direction, Class: Number, Description: Average of frequency domain signals measuring mean of body linear acceleration derived in time in the X direction

27. Column name: frequency domain body acceleration jerk action mean average value in the Y direction, Class: Number, Description: Average of frequency domain signals measuring mean of body linear acceleration derived in time in the Y direction

28. Column name: frequency domain body acceleration jerk action mean average value in the Z direction, Class: Number, Description: Average of frequency domain signals measuring mean of body linear acceleration derived in time in the Z direction

29. Column name: frequency domain body angular velocity mean average value in the X direction, Class: Number, Description: Average of frequency domain signals measuring mean of body angular velocity in the X direction

30. Column name: frequency domain body angular velocity mean average value in the Y direction, Class: Number, Description: Average of frequency domain signals measuring mean of body angular velocity in the Y direction

31. Column name: frequency domain body angular velocity mean average value in the Z direction, Class: Number, Description: Average of frequency domain signals measuring mean of body angular velocity in the Z direction

32. Column name: frequency domain body acceleration magnitude mean average value, Class: Number, Description:  Average of frequency domain signals measuring mean of magnitude of body acceleration according to Euclidean norm.

33. Column name: frequency domain body acceleration jerk action magnitude mean average value, Class: Number, Description: Average of frequency domain signals measuring mean of magnitude of body linear acceleration derived in time according to Euclidean norm.

34. Column name: frequency domain body angular velocity magnitude mean average value, Class: Number, Description: Average of frequency domain signals measuring mean of magnitude of body angular velocity according to Euclidean norm.

35. Column name: frequency domain body angular velocity jerk action magnitude mean average value, Class: Number, Description: Average of frequency domain signals measuring mean of magnitude of body angular velocity derived in time according to Euclidean norm.

36. Column name: time domain body acceleration standard deviation average value in the X direction, Class: Number, Description: Average of time domain signals measuring standard deviation of body acceleration signal in the X direction.

37. Column name: time domain body acceleration standard deviation average value in the Y direction, Class: Number, Description: Average of time domain signals measuring standard deviation of body acceleration signal in the Y direction.

38. Column name: time domain body acceleration standard deviation average value in the Z direction, Class: Number, Description: Average of time domain signals measuring standard deviation of body acceleration signal in the Z direction.

39. Column name: time domain gravity acceleration standard deviation average value in the X direction, Class: Number, Description: Average of time domain signals measuring standard deviation of gravity acceleration signal in the X direction.

40. Column name: time domain gravity acceleration standard deviation average value in the Y direction, Class: Number, Description: Average of time domain signals measuring standard deviation of gravity acceleration signal in the Y direction.

41. Column name: time domain gravity acceleration standard deviation average value in the Z direction, Class: Number, Description: Average of time domain signals measuring standard deviation of gravity acceleration signal in the Z direction.

42. Column name: time domain body acceleration jerk action standard deviation average value in the X direction, Class: Number, Description: Average of time domain signals measuring standard deviation of body linear acceleration derived in time in the X direction

43. Column name: time domain body acceleration jerk action standard deviation average value in the Y direction, Class: Number, Description: Average of time domain signals measuring standard deviation of body linear acceleration derived in time in the Y direction

44. Column name: time domain body acceleration jerk action standard deviation average value in the Z direction, Class: Number, Description: Average of time domain signals measuring standard deviation of body linear acceleration derived in time in the Z direction

45. Column name: time domain body angular velocity standard deviation average value in the X direction, Class: Number, Description: Average of time domain signals measuring standard deviation of body angular velocity in the X direction

46. Column name: time domain body angular velocity standard deviation average value in the Y direction, Class: Number, Description: Average of time domain signals measuring standard deviation of body angular velocity in the Y direction

47. Column name: time domain body angular velocity standard deviation average value in the Z direction, Class: Number, Description: Average of time domain signals measuring standard deviation of body angular velocity in the Z direction

48. Column name: time domain body angular velocity jerk action standard deviation average value in the X direction , Class: Number, Description: Average of time domain signals measuring standard deviation of body angular velocity derived in time in the X direction

49. Column name: time domain body angular velocity jerk action standard deviation average value in the Y direction , Class: Number, Description: Average of time domain signals measuring standard deviation of body angular velocity derived in time in the Y direction

50. Column name: time domain body angular velocity jerk action standard deviation average value in the Z direction , Class: Number, Description: Average of time domain signals measuring standard deviation of body angular velocity derived in time in the Z direction

51. Column name: time domain body acceleration magnitude standard deviation average value, Class: Number, Description: Average of time domain signals measuring standard deviation of magnitude of body acceleration according to Euclidean norm.

52. Column name: time domain gravity acceleration magnitude standard deviation average value, Class: Number, Description: Average of time domain signals measuring standard deviation of magnitude of gravity acceleration according to Euclidean norm.

53. Column name: time domain body acceleration jerk action magnitude standard deviation average value, Class: Number, Description: AAverage of time domain signals measuring standard deviation of magnitude of body linear acceleration derived in time according to Euclidean norm.

54. Column name: time domain body angular velocity magnitude standard deviation average value, Class: Number, Description: Average of time domain signals measuring standard deviation of magnitude of body angular velocity according to Euclidean norm.

55. Column name: time domain body angular velocity jerk action magnitude standard deviation average value, Class: Number, Description: Average of time domain signals measuring standard deviation of magnitude of body angular velocity derived in time according to Euclidean norm.

56. Column name: frequency domain body acceleration standard deviation average value in the X direction, Class: Number, Description: Average of frequency domain signals measuring standard deviation of body acceleration signal in the X direction.

57. Column name: frequency domain body acceleration standard deviation average value in the Y direction, Class: Number, Description: Average of frequency domain signals measuring standard deviation of body acceleration signal in the Y direction.

58. Column name: frequency domain body acceleration standard deviation average value in the Z direction, Class: Number, Description: Average of frequency domain signals measuring standard deviation of body acceleration signal in the Z direction.

59. Column name: frequency domain body acceleration jerk action standard deviation average value in the X direction , Class: Number, Description: Average of frequency domain signals measuring standard deviation of body linear acceleration derived in time in the X direction

60. Column name: frequency domain body acceleration jerk action standard deviation average value in the Y direction , Class: Number, Description: Average of frequency domain signals measuring standard deviation of body linear acceleration derived in time in the Y direction

61. Column name: frequency domain body acceleration jerk action standard deviation average value in the Z direction , Class: Number, Description: Average of frequency domain signals measuring standard deviation of body linear acceleration derived in time in the Z direction

62. Column name: frequency domain body angular velocity standard deviation average value in the X direction, Class: Number, Description: Average of frequency domain signals measuring standard deviation of body angular velocity in the X direction

63. Column name: frequency domain body angular velocity standard deviation average value in the Y direction, Class: Number, Description: Average of frequency domain signals measuring standard deviation of body angular velocity in the Y direction

64. Column name: frequency domain body angular velocity standard deviation average value in the Z direction, Class: Number, Description: Average of frequency domain signals measuring standard deviation of body angular velocity in the Z direction

65. Column name: frequency domain body acceleration magnitude standard deviation average value, Class: Number, Description: Average of frequency domain signals measuring standard deviation of magnitude of body acceleration according to Euclidean norm.

66. Column name: frequency domain body acceleration jerk action magnitude standard deviation average value, Class: Number, Description: Average of frequency domain signals measuring standard deviation of magnitude of body linear acceleration derived in time according to Euclidean norm.

67. Column name: frequency domain body angular velocity magnitude standard deviation average value, Class: Number, Description: Average of frequency domain signals measuring standard deviation of magnitude of body angular velocity according to Euclidean norm.

68. Column name: frequency domain body angular velocity jerk action magnitude standard deviation average value, Class: Number, Description: Average of frequency domain signals measuring standard deviation of magnitude of body angular velocity derived in time according to Euclidean norm.


## Sources
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012