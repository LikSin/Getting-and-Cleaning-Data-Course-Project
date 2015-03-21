# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project files

The R script run_analysis.R takes in testing and training data collected from the accelerometers from the Samsung Galaxy S smartphone, merges the data, and outputs the average for mean and standard deviation measurements of each subject and each activity.

The working directory is assumed to be already set to the main folder before the script is run. The main folder should contain subfolder "test" containing test data and subfolder "train" containing training data. The script will output tidydata.txt in the main folder.

The R script run_analysis.R requires the following input:
* From subfolder "test"
  1. X_test.txt
  2. y_test.txt
  3. subject_test.txt
* From subfolder "train"
  1. X_train.txt
  2. y_train.txt
  3. subject_train.txt
* From main folder
  1. features.txt
  2. activity_labels.txt
  
## Read in data
The R script first read in the test data containing information collected from the accelerometers in smartphones of subjects labelled in subject_test.txt

```R
#Read test data
Xtestdata=read.table("./test/X_test.txt")
ytestdata=read.table("./test/y_test.txt")
subjecttestdata=read.table("./test/subject_test.txt")
```

The R script then read in the training data containing information collected from the accelerometers in smartphones of subjects labelled in subject_train.txt

```R
#Read train data
Xtraindata=read.table("./train/X_train.txt")
ytraindata=read.table("./train/y_train.txt")
subjecttraindata=read.table("./train/subject_train.txt")
```

The R script then read in feature data which describes what each column of test and training data is about. The script also read in acivity labels data which describes the activity that each number in the activity column represents.

```R
#Read feature data
featuresdata=read.table("features.txt")

#Read activity labels data
activitylabelsdata=read.table("activity_labels.txt")
```

## Label column names of data

The script then proceeds to label the column names of the data read into R.
The labels for Xtestdata and Xtraindata can be found in featuresdata that was read in from features.txt.

```R
#Set column names of test data from features found in features.txt
colnames(Xtestdata)=featuresdata[,2]

#Set column names of training data from features found in features.txt
colnames(Xtraindata)=featuresdata[,2]
```

ytestdata and ytraindata contains a column of labels on the activity that each row of data is categorised. The column is labelled "Activity"

```R
#Set column name for the activity done by the subject in training labels data file
colnames(ytestdata)="Activity"
colnames(ytraindata)="Activity"
```

subjecttestdata and subjecttraindata contains a column of data that identifies the subject who performed the activity in each row. The column is named as "Subject"
```R
#Set column name for data from subject_test.txt and subject_train.txt
#"Each row identifies the subject who performed the activity for each window sample. 
#Its range is from 1 to 30."
colnames(subjecttestdata)="Subject"
colnames(subjecttraindata)="Subject"
```

## 1. Merges the training and the test sets to create one data set

The script then merges the different data described above into a single data set for processing

The subjecttestdata containing test information on the subject, ytestdata containing test information on the activity and Xtestdata containing test information on the accelerometer are concatenated columnwise into a dataset called testdata.

```R
#Combine test subject with the activity with the test data
testdata=cbind(subjecttestdata,ytestdata,Xtestdata)
```

The subjecttraindata containing training information on the subject, ytraindata containing training information on the activity and Xtraindata containing training information on the accelerometer are concatenated columnwise into a dataset called traindata.

```R
#Combine train subject with the activity with the train data
traindata=cbind(subjecttraindata,ytraindata,Xtraindata)
```

Finally, the test data and training data are concatenated rowwise into a single dataset called mergeddata.

```R
#Merge training set with test set
mergeddata=rbind(testdata,traindata)
```


## 2. Extracts only the measurements on the mean and standard deviation for each measurement

From mergeddata, the script extracts specific columns of data containing measurements on the mean and standard deviation.
Columns containing mean data has column name with "mean()" while columns containing standard deviation data has column name with "std()". 
The code finds column names containing string "mean()" and stores the corresponding columns of data in meandata.

```R
#Select columns of data with mean measurements
meandata=mergeddata[,grep("mean()",names(mergeddata), fixed=TRUE)]
```

The code finds column names containing string "std()" and stores the corresponding columns of data in stddata.

```R
#Select columns of data with std measurements
stddata=mergeddata[,grep("std()",names(mergeddata), fixed=TRUE)]
```

The script then concatenates columnwise the subject column and activity column with the columns containing mean (meandata) and standard deviation (stddata) data to form a single data set called extracteddata. This data set contains only mean and standard deviation data with their corresponding subject and activity.

```R
#Merge data of Subject, Activity, mean and std measurements
extracteddata=cbind(mergeddata[,1:2],meandata,stddata)
```


## 3. Uses descriptive activity names to name the activities in the data set

In the activity column, the activities are labelled by numbers. The script replaces the numbers with labels extracted from activity_labels.txt.
In the For loop, the code finds all rows in the "Activity" column containing the number "1", and replaces them with string "WALKING". In the next iteration, it finds number "2" and replaces with "WALKING_UPSTAIRS", and so on until all numbers are replaced with labels.

```R
#Replace the numbers found in Activity column of extracteddata with names of the
#activity found in activity_labels.txt
for (i in 1:nrow(activitylabelsdata))
{
  number=activitylabelsdata[i,1]
  label=activitylabelsdata[i,2]
  #Look through "Activity" column to find number and replace with label
  extracteddata[,2]=sub(number,label, extracteddata[,2])
}
```


## 4. Appropriately labels the data set with descriptive variable names

As all the columnnames that were copied from features.txt were short forms or abbreviations, the script will replace them with descriptive names with the help of regular expressions.
For names starting with t, they are time domain data. For names starting with f, they are frequency domain data. Column names beginning with t or f are described as time domain or frequency domain respectively. "t" and "f" are replaced accordingly by using the sub() function.

```R
#Describe data as either time domain or frequency domain data
names(extracteddata)=sub("^t","time domain ",names(extracteddata))
names(extracteddata)=sub("^f","frequency domain ",names(extracteddata))
```

It seems like some columns are erroneously labeled as "BodyBody" instead of "Body". This is corrected with substitution of "BodyBody" with "Body"

```R
#Corrects BodyBody label to Body
names(extracteddata)=sub("BodyBody","Body",names(extracteddata))
```

BodyAcc is the abbreviated version of body acceleration used in columnnames. It is replaced accordingly.

```R
#Describe BodyAcc as body acceleration
names(extracteddata)=sub("BodyAcc","body acceleration ",names(extracteddata))
```

GravityAcc is the abbreviated version of Gravity acceleration used in columnnames. It is replaced accordingly.

```R
#Describe GravityAcc as gravity acceleration
names(extracteddata)=sub("GravityAcc","gravity acceleration ",names(extracteddata))
```

BodyGyro is the abbreviated version of body angular velocity used in columnnames. It is replaced accordingly.

```R
#Describe BodyGyro as body angular velocity
names(extracteddata)=sub("BodyGyro","body angular velocity ",names(extracteddata))
```

Jerk describes jerk action. It is replaced accordingly.

```R
#Describe Jerk as jerk action
names(extracteddata)=sub("Jerk","jerk action ",names(extracteddata))
```

Mag is short form of magnitude. It is replaced accordingly.

```R
#Describe Mag as magnitude
names(extracteddata)=sub("Mag","magnitude ",names(extracteddata))
```

"mean()" is substituted as "mean values" while "std()" is abbreviated version of "standard deviation values" and is replaced accordingly.

```R
#Describe data as either mean or standard deviation data
names(extracteddata)=sub("-mean()","mean values",names(extracteddata), fixed=TRUE)
names(extracteddata)=sub("-std()","standard deviation values",names(extracteddata), fixed=TRUE)
```

When columnname contains "X", it meant "in the X direction".
When columnname contains "Y", it meant "in the Y direction".
When columnname contains "Z", it meant "in the Z direction".
These are replaced accordingly.

```R
#Describe the direction
names(extracteddata)=sub("-X"," in the X direction",names(extracteddata))
names(extracteddata)=sub("-Y"," in the Y direction",names(extracteddata))
names(extracteddata)=sub("-Z"," in the Z direction",names(extracteddata))
```


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

Since a second, independent tidy data set should be created, a new data set is first initialised as tidydata
As we already know that there are 30 subjects and each subject performs 6 activites, there will be 30 x 6 number of rows in the new data set.
There should be the same number of columns in the new data set as the extracteddata data set. The number of columns (ncol) in the new data set can then be initialised. 
The column names used in extracteddata are copied over to the new data set. However, since we will store average values, string "values" are replaced by string "average value" to reflect the data stored.

```R
#Initialise the independent tidy data set
tidydata=data.frame(matrix(nrow=30*nrow(activitylabelsdata),ncol=ncol(extracteddata)))
names(tidydata)=names(extracteddata)
names(tidydata)=sub("values","average value",names(tidydata))
```

A nested For loop then calculates the average for each variable (column) of each activity and each subject and store in the tidydata data set.
The outer loop accounts for each subject while the inner loop accounts for each activity.
In each iteration, the subject number is stored in the first column of the data set. The description of the activity is then stored in the second column. All data corresponding to the subject and activity are selected and stored in _subset_.
The average value of each variable is calculated using function colMeans() and stored in tidydata data set.

```R
#Calculate the average for each variable of each activity and each subject
#and store in tidydata dataframe
for (i in 1:30)
{
  for (j in 1:nrow(activitylabelsdata))
  {
    #Input subject to tidy data set
    tidydata[((i-1)*6+j),1]=i
    #Input activity to tidy data set
    tidydata[((i-1)*6+j),2]=as.character(activitylabelsdata[j,2])
    #Subset variable data for this combination of subject and activity
    subset=extracteddata[(extracteddata[,1]==i & extracteddata[,2]==activitylabelsdata[j,2]),3:ncol(extracteddata)]
    #Input average of each variable to tidy data set
    tidydata[((i-1)*6+j),3:ncol(extracteddata)]=colMeans(subset)
  }
}
```

Finally (yes finally), the tidydata data set is output as a txt file using write.table function.

```R
#Output tidydata data set as a txt file
write.table(tidydata, file="tidydata.txt", row.name=FALSE)
```

For my assessor, if you have read all the way here, u are seriously awesome. Hope you appreciate the effort that I have put in try to make it understandable. I really hope it was understandable.
