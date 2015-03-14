####################################################################################
##Read all information into R
##It is assumed that this script is in the working directory
##It is assumed that the data files are already unzipped in the working directory

#Read test data
Xtestdata=read.table("./test/X_test.txt")
ytestdata=read.table("./test/y_test.txt")
subjecttestdata=read.table("./test/subject_test.txt")

#Read train data
Xtraindata=read.table("./train/X_train.txt")
ytraindata=read.table("./train/y_train.txt")
subjecttraindata=read.table("./train/subject_train.txt")

#Read feature data
featuresdata=read.table("features.txt")

#Read activity labels data
activitylabelsdata=read.table("activity_labels.txt")

#####################################################################################
##Set column names of test and training data


#Set column names of test data from features found in features.txt
colnames(Xtestdata)=featuresdata[,2]

#Set column names of training data from features found in features.txt
colnames(Xtraindata)=featuresdata[,2]

#Set column name for the activity done by the subject in training labels data file
colnames(ytestdata)="Activity"
colnames(ytraindata)="Activity"

#Set column name for data from subject_test.txt and subject_train.txt
#"Each row identifies the subject who performed the activity for each window sample. 
#Its range is from 1 to 30."
colnames(subjecttestdata)="Subject"
colnames(subjecttraindata)="Subject"

#####################################################################################
##1. Merges the training and the test sets to create one data set.


#Combine test subject with the activity with the test data
testdata=cbind(subjecttestdata,ytestdata,Xtestdata)

#Combine train subject with the activity with the train data
traindata=cbind(subjecttraindata,ytraindata,Xtraindata)

#Merge training set with test set
mergeddata=rbind(testdata,traindata)

#####################################################################################
##2. Extracts only the measurements on the mean and standard deviation for each 
##   measurement.

#Select columns of data with mean measurements
meandata=mergeddata[,grep("mean()",names(mergeddata), fixed=TRUE)]

#Select columns of data with std measurements
stddata=mergeddata[,grep("std()",names(mergeddata), fixed=TRUE)]

#Merge data of Subject, Activity, mean and std measurements
extracteddata=cbind(mergeddata[,1:2],meandata,stddata)

#####################################################################################
##3. Uses descriptive activity names to name the activities in the data set


#Replace the numbers found in Activity column of extracteddata with names of the
#activity found in activity_labels.txt
for (i in 1:nrow(activitylabelsdata))
{
  number=activitylabelsdata[i,1]
  label=activitylabelsdata[i,2]
  #Look through "Activity" column to find number and replace with label
  extracteddata[,2]=sub(number,label, extracteddata[,2])
}

#####################################################################################
##4. Appropriately labels the data set with descriptive variable names.


#Describe data as either time domain or frequency domain data
names(extracteddata)=sub("^t","time domain ",names(extracteddata))
names(extracteddata)=sub("^f","frequency domain ",names(extracteddata))

#Corrects BodyBody label to Body
names(extracteddata)=sub("BodyBody","Body",names(extracteddata))

#Describe BodyAcc as body acceleration
names(extracteddata)=sub("BodyAcc","body acceleration ",names(extracteddata))

#Describe GravityAcc as gravity acceleration
names(extracteddata)=sub("GravityAcc","gravity acceleration ",names(extracteddata))

#Describe BodyGyro as body angular velocity
names(extracteddata)=sub("BodyGyro","body angular velocity ",names(extracteddata))

#Describe Jerk as jerk action
names(extracteddata)=sub("Jerk","jerk action ",names(extracteddata))

#Describe Mag as magnitude
names(extracteddata)=sub("Mag","magnitude ",names(extracteddata))

#Describe data as either mean or standard deviation data
names(extracteddata)=sub("-mean()","mean values",names(extracteddata), fixed=TRUE)
names(extracteddata)=sub("-std()","standard deviation values",names(extracteddata), fixed=TRUE)

#Describe the direction
names(extracteddata)=sub("-X"," in the X direction",names(extracteddata))
names(extracteddata)=sub("-Y"," in the Y direction",names(extracteddata))
names(extracteddata)=sub("-Z"," in the Z direction",names(extracteddata))

#####################################################################################
##5. From the data set in step 4, creates a second, independent tidy data set 
##   with the average of each variable for each activity and each subject.

#Initialise the independent tidy data set
tidydata=data.frame(matrix(nrow=30*nrow(activitylabelsdata),ncol=ncol(extracteddata)))
names(tidydata)=names(extracteddata)
names(tidydata)=sub("values","average value",names(tidydata))

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

#Output tidydata data set as a txt file
write.table(tidydata, file="tidydata.txt", row.name=FALSE)