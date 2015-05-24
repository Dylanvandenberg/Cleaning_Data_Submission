##Coursera Project - Getting and Cleaning Data
##This scipt requires the working diretory to be set to the unzipped data folder.

##Save original directory:
original_directory<- getwd()

##Read in features and activity labels:
features<-read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")

##Read in train data:
setwd("train")
X_train<-read.table("X_train.txt")
y_train<-read.table("y_train.txt")
subject_train<-read.table("subject_train.txt")

##Read in test data:
setwd(original_directory)
setwd("test")
X_test<-read.table("X_test.txt")
y_test<-read.table("y_test.txt")
subject_test<-read.table("subject_test.txt")

##Adding subjects to data
X_train<- cbind(subject_train,y_train, X_train)
X_test<- cbind(subject_test, y_test, X_test)

##Applying data labels:
subject_v1<- c(0, "Subject")
subject_v2<- c(0, "Activity")
features<-rbind(subject_v1, subject_v2, features)
names(X_train)<-features[,2]
names(X_test)<-features[,2]
names(X_test)[1]<- "Subject"
names(X_test)[2]<- "Activity"
names(X_train)[1]<- "Subject"
names(X_train)[2]<- "Activity"

##Merge test and training data:
X_data<- rbind(X_test, X_train)

##Filter only by columns with mean or std in them:
X_data<- X_data[ c(1,2,grep("mean|std", features[,2], value = FALSE))]

##Replace Activity labels with Activity Descriptions:
A_labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS","SITTING", "STANDING", "LAYING") 
for(i in 1:length(X_data[,1])){
        X_data[i,2]<- A_labels[as.numeric(X_data[i,2])]
}

##Tidy up the Column Names:
##Replace t with time and f with frequency ~
names(X_data) <- gsub("^t", "Time", names(X_data)) 
names(X_data) <- gsub("^f", "Freq", names(X_data)) 
## Remove brackets 
names(X_data) <- gsub("\\(\\)", "", names(X_data)) 

##Reverting to original directory
setwd(original_directory)

##Summarise the data:
summary <- group_by(X_data, Subject, Activity) 
summary_table <- summary %>% summarise_each(funs(mean)) 
write.table(summary_table, file="Tidy_data.txt", row.name=FALSE) 



