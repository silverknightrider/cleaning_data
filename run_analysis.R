
#Instructions

## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement.
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# reading the txt files 
## train
test_subjects <- read.table("test/subject_test.txt", col.names="subject")
test_data <- read.table("test/X_test.txt")
test_labels <- read.table("test/y_test.txt", col.names="label")
##test
train_labels <- read.table("train/y_train.txt", col.names="label")
train_subjects <- read.table("train/subject_train.txt", col.names="subject")
train_data <- read.table("train/X_train.txt")
## read the features txt file
features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
# read the labels for the activities
labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)

#STEP 1
# bind by row (merging step)
data <- rbind(cbind(test_subjects, test_labels, test_data),
              cbind(train_subjects, train_labels, train_data))


#STEP 2
# keep features of mean and std dev
featuresMeanStd <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]
# Extracts only the measurements on the mean and standard deviation for each measurement.
# increment by 2 because of subjects and labels at the start
mean_SD_data <- data[, c(1, 2, featuresMeanStd$V1+2)]


#STEP3
#Use descriptive activity names to name the activities in the data set

# replace labels in data with label names
mean_SD_data$label <- labels[mean_SD_data$label, 2]

#STEP4 
#Appropriately labels the data set with descriptive variable names.

# create list called 'currentColNames' that has current column names and feature names
currentColNames <- c("subject", "label", featuresMeanStd$V2)

# clean list by putting everything to lower case and deleting all non-alphabetical character
currentColNames <- tolower(gsub("[^[:alpha:]]", "", currentColNames))

# apply currentColNames as column names for my data
colnames(mean_SD_data) <- currentColNames

#STEP5
#creates a second, independent tidy data set with the average of each variable for each activity
#and each subject.

# average of each variable for each activity and each subject
tidyDataI <- aggregate(mean_SD_data[, 3:ncol(mean_SD_data)],
                       by=list(subject = mean_SD_data$subject, 
                               label = mean_SD_data$label),
                       mean)

#last step : create file using row.name=FALSE for submission
write.table(format(tidyDataI, scientific=T), "tidyDataII.txt",
            row.names=F, col.names=F, quote=2)