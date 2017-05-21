#creates the appropriate directory,downloads and unzips the data
dir.create("UCI HAR Dataset")
data<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(data,"UCI HAR Dataset.zip")
unzip("./UCI HAR Dataset.zip")

#combines the test & training datasets row wise
test_x<-read.table("./UCI HAR Dataset/test/X_test.txt")
train_x<-read.table("./UCI HAR Dataset/train/X_train.txt")
sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
sub_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
test_y<-read.table("./UCI HAR Dataset/test/y_test.txt")
train_y<-read.table("./UCI HAR Dataset/train/y_train.txt")
test_train_x<-rbind(test_x,train_x)
sub_train_test<-rbind(sub_test,sub_train)
test_train_y<-rbind(test_y,train_y)

#extracts the mean & standard deviation values 
measures<-read.table("./UCI HAR Dataset/features.txt")
mean_std<-grep("-mean()|-std()",measures$V2)
mean_std_x<-test_train_x[,measures$V2]
names(mean_std_x)<-tolower(measures[mean_std,2])
names(mean_std_x)<-gsub("\\(|\\)","",names(mean_std_x))

#names the activity variables in the dataset
act<-read.table("./UCI HAR Dataset/activity_labels.txt")
act[,2]<-tolower(as.character(act[,2]))
act[,2]<-gsub("_","",act[,2])
test_train_y[,1]= act[test_train_y[,1],2]
colnames(test_train_y)<-"activity"
colnames(sub_train_test)<-"subject"

#merges and labels the final dataset with appropriate names
clean_dataset<-cbind(sub_train_test,mean_std_x,test_train_y)
write.table(clean_dataset,"./UCI HAR Dataset/clean_dataset.txt",row.names = FALSE)

#creates a second, tidy dataset with average values
average_values<-aggregate(x = clean_dataset, by = list(act = clean_dataset$activity, sub_train_test = clean_dataset$subject), FUN = mean)
average_values<-average_values[,!colnames(average_values) %in% c("subject", "activity")]
write.table(average_values,"./UCI HAR Dataset/average_values.txt", row.names = FALSE)
