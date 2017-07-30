#load library and change workign directory
library(dplyr)
setwd("UCI HAR Dataset")
features <- read.table("features.txt", stringsAsFactors= F)
#features$V2 <- as.character(features$V2)
keep <- grep("mean|std",features$V2)
features <- features[keep,]
keep <- grep("meanFreq",features$V2)
features <- features[-keep,]
activityLabels <- read.table("activity_labels.txt", stringsAsFactors=F )
colnames(activityLabels) <- c("activity_ID","activity_name")
#read training data, appropriately label everything, and combine
setwd("train")
x_train <- read.table("X_train.txt")
x_train <- x_train[,features$V1]
colnames(x_train) <- features$V2
y_train <- read.table("y_train.txt")
colnames(y_train) <- "activity"
subject_train <- read.table("subject_train.txt")
colnames(subject_train) <- "volunteer"
training_data <- cbind(subject_train,y_train, x_train)
#read test data and appropriately label everything
setwd("../test")
x_test <- read.table("X_test.txt")
x_test <- x_test[,features$V1]
colnames(x_test) <- features$V2
y_test <- read.table("y_test.txt")
colnames(y_test) <- "activity"
subject_test <- read.table("subject_test.txt")
colnames(subject_test) <- "volunteer"
test_data <- cbind(subject_test,y_test,x_test)
#merge sets and clean names
mergedData <- rbind(training_data,test_data)
rawNames <- colnames(mergedData)
cleanedNames <- gsub("-mean\\()","_Mean",rawNames)
cleanedNames <- gsub("-std\\()","_StDv", cleanedNames)
cleanedNames <- gsub("-X","_X",cleanedNames)
cleanedNames <- gsub("-Y","_Y",cleanedNames)
cleanedNames <- gsub("-Z","_Z",cleanedNames)
cleanedNames <- gsub("BodyBody","_Body",cleanedNames)
cleanedNames <- gsub("Body","_Body",cleanedNames)
cleanedNames <- gsub("Acc","_Acceleration",cleanedNames)
cleanedNames <- gsub("Gyro","_Gyro",cleanedNames)
cleanedNames <- gsub("Gravity","_Gravity",cleanedNames)
cleanedNames <- gsub("Jerk","_Jerk",cleanedNames)
cleanedNames <- gsub("-X"," X",cleanedNames)
cleanedNames <- gsub("-X"," X",cleanedNames)
cleanedNames <- gsub("[Mm]ag","_Magnitude",cleanedNames)
colnames(mergedData) <- cleanedNames
#create a new tidy set by subject "UCI HAR Dataset"
finalData <- aggregate(mergedData[,3:68],by=list(activity_ID=mergedData$activity, subject_ID=mergedData$volunteer),mean)
finalData <- merge(finalData,activityLabels,by="activity_ID",all.x=T)%>%
    arrange(activity_ID,subject_ID)
finalData <- finalData[,c(69,2:68)]
write.table(finalData,"tidy_data.txt")
