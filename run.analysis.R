training <- read.table("~/Dropbox/Statistics/R/Coursera/UCI HAR Dataset/train/X_train.txt")
training_y <- read.table("~/Dropbox/Statistics/R/Coursera/UCI HAR Dataset/train/y_train.txt")
training_subj <- read.table("~/Dropbox/Statistics/R/Coursera/UCI HAR Dataset/train/subject_train.txt")
test <- read.table("~/Dropbox/Statistics/R/Coursera/UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("~/Dropbox/Statistics/R/Coursera/UCI HAR Dataset/test/y_test.txt")
test_subj <- read.table("~/Dropbox/Statistics/R/Coursera/UCI HAR Dataset/test/subject_test.txt")
features <- read.table("~/Dropbox/Statistics/R/Coursera/UCI HAR Dataset/features.txt", row.names = 1)
activity <- read.table("~/Dropbox/Statistics/R/Coursera/UCI HAR Dataset/activity_labels.txt", row.names = 1)

###

training_df <- data.frame(training_subj, training_y, training)
test_df <- data.frame(test_subj, test_y, test)

full_data <- rbind(training_df, test_df)
names(full_data) <- c("subjectID", "activity", as.character(features[,1]))

full_data$subjectID <- factor(full_data$subjectID)
full_data$activity <- factor(full_data$activity)
levels(full_data$activity) <- as.character(activity[,1])

mean_cols <- grep("mean()", names(full_data), fixed=TRUE)
std_cols <- grep("std()", names(full_data), fixed=TRUE)

cols_of_interest <- sort(c(1,2,mean_cols, std_cols))
data_of_interest <- full_data[,cols_of_interest]

###

names(data_of_interest) = tolower(names(data_of_interest))
names(data_of_interest) = gsub('-mean\\()-', 'mean', names(data_of_interest))
names(data_of_interest) = gsub('-mean\\()', 'mean', names(data_of_interest))
names(data_of_interest) = gsub('-std\\()-', 'sd', names(data_of_interest))
names(data_of_interest) = gsub('-std\\()', 'sd', names(data_of_interest))

###

library(reshape2)
mdata <- melt(data_of_interest, id=c("subjectid","activity"))
means <- dcast(mdata, subjectid + activity ~ variable, mean)

write.table(means, "means.txt", row.names=FALSE)
