#CodeBook

This is my code book that describes the variables, the data, 
and any transformations or work that I performed to clean up the data.

#About the Data
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Data frames with variable names and transformations
-test_subjects data
2947 obs. of  1 variable
$ subject: int

-test_data 
2947 obs. of  561 variables:
 V1 to V561 : num
 
-test_labels
2947 obs. of  1 variable:
 $ label: int
 
-train_labels
7352 obs. of  1 variable:
 $ label: int
 
-train_subjects
7352 obs. of  1 variable:
 $ subject: int
 
-train_data
7352 obs. of  561 variables:
 V1 to V561 : num
 
-features
561 obs. of  2 variables:
 $ V1: int  
 $ V2: chr  

-labels
6 obs. of  2 variables:
 $ V1: int  
 $ V2: chr
 
 -data
 column combine test_subjects, test_labels, test_data and
 column combine train_subjects, train_labels, train_data
 Then row combine those two.
 We get a data frame of 10299 obs. of  563 variables with the 
 same variables and type of variables as listed above in their initial data sets
 
 -featuresMeanStd
 keep features of mean and std dev
 66 obs. of  2 variables:
 $ V1: int 
 $ V2: chr
 
 -mean_SD_data
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

- tidyDataI
 creates a second, independent tidy data set with the average of each variable for each activity
 and each subject using mean_SD_data data frame.

 Find average of each variable for each activity and each subject
 180 obs. of  68 variables
 
 save everything into a txt file called "tidyDataII.txt"
 which has 180 obs. of  68 variables
 
 Variable names of final data:
 [1] "subject"                 
 [2] "label"                   
 [3] "tbodyaccmeanx"           
 [4] "tbodyaccmeany"           
 [5] "tbodyaccmeanz"           
 [6] "tbodyaccstdx"            
 [7] "tbodyaccstdy"            
 [8] "tbodyaccstdz"            
 [9] "tgravityaccmeanx"        
[10] "tgravityaccmeany"        
[11] "tgravityaccmeanz"        
[12] "tgravityaccstdx"         
[13] "tgravityaccstdy"         
[14] "tgravityaccstdz"         
[15] "tbodyaccjerkmeanx"       
[16] "tbodyaccjerkmeany"       
[17] "tbodyaccjerkmeanz"       
[18] "tbodyaccjerkstdx"        
[19] "tbodyaccjerkstdy"        
[20] "tbodyaccjerkstdz"        
[21] "tbodygyromeanx"          
[22] "tbodygyromeany"          
[23] "tbodygyromeanz"          
[24] "tbodygyrostdx"           
[25] "tbodygyrostdy"           
[26] "tbodygyrostdz"           
[27] "tbodygyrojerkmeanx"      
[28] "tbodygyrojerkmeany"      
[29] "tbodygyrojerkmeanz"      
[30] "tbodygyrojerkstdx"       
[31] "tbodygyrojerkstdy"       
[32] "tbodygyrojerkstdz"       
[33] "tbodyaccmagmean"         
[34] "tbodyaccmagstd"          
[35] "tgravityaccmagmean"      
[36] "tgravityaccmagstd"       
[37] "tbodyaccjerkmagmean"     
[38] "tbodyaccjerkmagstd"      
[39] "tbodygyromagmean"        
[40] "tbodygyromagstd"         
[41] "tbodygyrojerkmagmean"    
[42] "tbodygyrojerkmagstd"     
[43] "fbodyaccmeanx"           
[44] "fbodyaccmeany"           
[45] "fbodyaccmeanz"           
[46] "fbodyaccstdx"            
[47] "fbodyaccstdy"            
[48] "fbodyaccstdz"            
[49] "fbodyaccjerkmeanx"       
[50] "fbodyaccjerkmeany"       
[51] "fbodyaccjerkmeanz"       
[52] "fbodyaccjerkstdx"        
[53] "fbodyaccjerkstdy"        
[54] "fbodyaccjerkstdz"        
[55] "fbodygyromeanx"          
[56] "fbodygyromeany"          
[57] "fbodygyromeanz"          
[58] "fbodygyrostdx"           
[59] "fbodygyrostdy"           
[60] "fbodygyrostdz"           
[61] "fbodyaccmagmean"         
[62] "fbodyaccmagstd"          
[63] "fbodybodyaccjerkmagmean" 
[64] "fbodybodyaccjerkmagstd"  
[65] "fbodybodygyromagmean"    
[66] "fbodybodygyromagstd"     
[67] "fbodybodygyrojerkmagmean"
[68] "fbodybodygyrojerkmagstd" 

Variable type in order:
[1] "integer"
[1] "character"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
[1] "double"
