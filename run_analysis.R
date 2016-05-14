
#reading training data 
setwd("~/Documents/R working directory/UCI HAR Dataset/test")
testdata <- read.table("X_test.txt")
test_Rnames <- read.table("subject_test.txt")
test_acti <- read.table("y_test.txt")

setwd("~/Documents/R working directory/UCI HAR Dataset")
feature_detail <- read.table("features.txt")
activity_label <- read.table("activity_labels.txt")
names(activity_label) <- c('activity' , 'activity_name')
names(testdata) <- feature_detail[,2]

testdata$subject <- test_Rnames$V1
testdata$activity <- test_acti$V1

#reading train train 
setwd("~/Documents/R working directory/UCI HAR Dataset/train")
traindata <- read.table("X_train.txt")
train_Rnames <- read.table("subject_train.txt")
train_acti <- read.table("y_train.txt")

setwd("~/Documents/R working directory/UCI HAR Dataset")
feature_detail <- read.table("features.txt")
names(traindata) <- feature_detail[,2]

traindata$subject <- train_Rnames$V1
traindata$activity <- train_acti$V1

#creating combined dataset 
comb_data <- rbind(testdata,traindata)

#assigning feature names 
names(comb_data)  <- gsub("_" , "" ,x= names(comb_data))
names(comb_data) <- sub("\\(" , "" , x= names(comb_data))
names(comb_data) <- sub("\\)" , "" , x= names(comb_data))
meanstd <- grepl("mean|std|subject|acti" , names(comb_data))
comb_data_new <- comb_data[,meanstd]

#adding activity label
comp_data_new1 <- data.table(comb_data_new , key = 'activity')
activity_label1 <- data.table(activity_label , key = 'activity')
final_data <- merge(comp_data_new1 , activity_label1)

library("dplyr", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.2")
final_data <-arrange(final_data, subject) 
grp_data  <- group_by(final_data, subject , activity_name)
summarize_data <- grp_data %>% summarise_each(funs(mean))

