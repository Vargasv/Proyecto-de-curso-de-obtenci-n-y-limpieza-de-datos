## Merges the training and the test sets to create one data set.

x <- rbind(xtrain, xtest)
y <- rbind(ytrain, ytest)
subject <- rbind(subjecttrain, subjecttest)
dataxy <- cbind(subject, y, x)

## Extracts only the measurements on the mean and standard deviation for each measurement.

tidydataxy <- dataxy %>% select(subject, code, contains("mean"), contains("std"))

## Uses descriptive activity names to name the activities in the data set

tidydataxy$code <- activities[tidydataxy$code, 2]

## Appropriately labels the data set with descriptive variable names.

names(tidydataxy)[2] = "activity"
names(tidydataxy)<-gsub("Acc", "Accelerometer", names(tidydataxy))
names(tidydataxy)<-gsub("Gyro", "Gyroscope", names(tidydataxy))
names(tidydataxy)<-gsub("BodyBody", "Body", names(tidydataxy))
names(tidydataxy)<-gsub("Mag", "Magnitude", names(tidydataxy))
names(tidydataxy)<-gsub("^t", "Time", names(tidydataxy))
names(tidydataxy)<-gsub("^f", "Frequency", names(tidydataxy))
names(tidydataxy)<-gsub("tBody", "TimeBody", names(tidydataxy))
names(tidydataxy)<-gsub("-mean()", "Mean", names(tidydataxy), ignore.case = TRUE)
names(tidydataxy)<-gsub("-std()", "STD", names(tidydataxy), ignore.case = TRUE)
names(tidydataxy)<-gsub("-freq()", "Frequency", names(tidydataxy), ignore.case = TRUE)
names(tidydataxy)<-gsub("angle", "Angle", names(tidydataxy))
names(tidydataxy)<-gsub("gravity", "Gravity", names(tidydataxy))

## From the data set in step 4, creates a second, independent tidy 
## data set with the average of each variable for each activity and each subject.

data5 <- tidydataxy %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))

## txt file

write.table(data5, "data5.txt", row.name=FALSE)
