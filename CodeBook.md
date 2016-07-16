#CodeBook

#This is my code book that describes the variables, the data, 
#and any transformations or work that I performed to clean up the data.

#test_subjects data
2947 obs. of  1 variable
$ subject: int

#test_data 
2947 obs. of  561 variables:
 V1 to V561 : num
 
#test_labels
2947 obs. of  1 variable:
 $ label: int
 
#train_labels
7352 obs. of  1 variable:
 $ label: int
 
#train_subjects
7352 obs. of  1 variable:
 $ subject: int
 
#train_data
7352 obs. of  561 variables:
 V1 to V561 : num
 
#features
561 obs. of  2 variables:
 $ V1: int  
 $ V2: chr  

#labels
6 obs. of  2 variables:
 $ V1: int  
 $ V2: chr
 
 #data
 column combine test_subjects, test_labels, test_data and
 column combine train_subjects, train_labels, train_data
 Then row combine those two.
 We get a data frame of 10299 obs. of  563 variables with the 
 same variables and type of variables as listed above in their initial data sets
 
 #featuresMeanStd
 keep features of mean and std dev
 66 obs. of  2 variables:
 $ V1: int 
 $ V2: chr
 
 #mean_SD_data
 Extracts only the measurements on the mean and standard deviation for each measurement.
 Increment by 2 because of subjects and labels at the start
 10299 obs. of  68 variables:
 Some more transformation:
 - Use descriptive activity names to name the activities in the data set
 - replace labels in data with label names data frame
   mean_SD_data$label <- labels[mean_SD_data$label, 2]
 - Appropriately labels the data set with descriptive variable names.

	create list called 'currentColNames' that has current column names and feature names
	currentColNames <- c("subject", "label", featuresMeanStd$V2)

	clean list by putting everything to lower case and deleting all non-alphabetical character
	currentColNames <- tolower(gsub("[^[:alpha:]]", "", currentColNames))

	apply currentColNames as column names for my data
	colnames(mean_SD_data) <- currentColNames

#tidyDataI
 creates a second, independent tidy data set with the average of each variable for each activity
 and each subject using mean_SD_data data frame.

 Find average of each variable for each activity and each subject
 180 obs. of  68 variables
 
 save everything into a txt file called "tidyDataII.txt"
 which has 180 obs. of  68 variables
 