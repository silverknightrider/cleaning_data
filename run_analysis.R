#a
tbl1 <- read.table("train/X_train.txt")
tbl2 <- read.table("test/X_test.txt")
a <- rbind(tbl1, tbl2)

tbl1 <- read.table("train/subject_train.txt")
tbl2 <- read.table("test/subject_test.txt")
b <- rbind(tbl1, tbl2)

tbl1 <- read.table("train/y_train.txt")
tbl2 <- read.table("test/y_test.txt")
c <- rbind(tbl1, tbl2)

#b
features <- read.table("features.txt")
required_avg <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
a <- a[, required_avg]
names(a) <- features[required_avg, 2]
names(a) <- gsub("\\(|\\)", "", names(a))
names(a) <- tolower(names(a))

#c
activities <- read.table("activity_labels.txt")
activities[, 2] <- gsub("_", "", tolower(as.character(activities[, 2])))
c[,1] <- activities[c[,1], 2]
names(c) <- "activity"

names(b) <- "subject"
final <- cbind(b, c, a)
write.table(final, "merged_data.txt")

#d
subjects <- unique(b)[,1]
num_subjects = length(unique(b)[,1])
num_activities = length(activities[,1])
numCols = dim(final)[2]
result = final[1:(num_subjects*num_activities), ]

row = 1
for (p in 1:num_subjects) {
  for (q in 1:num_activities) {
    result[row, 1] = subjects[p]
    result[row, 2] = activities[q, 2]
    tbl <- final[final$subject==p & final$activity==activities[q, 2], ]
    result[row, 3:numCols] <- colMeans(tbl[, 3:numCols])
    row = row+1
  }
}
write.table(result, "data_averages.txt")

