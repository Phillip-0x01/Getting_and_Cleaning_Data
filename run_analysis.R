list.of.packages <- c("dplyr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

library(dplyr)

#import all of the data files into R workspace
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"")
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt", quote="\"")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"")
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt", quote="\"")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"")

#combine test and training data into its each data frame
train_df <- data.frame(c(subject_train, y_train, x_train))
test_df <- data.frame(c(subject_test, y_test, x_test))

#combine data frames 
df1 <- rbind(train_df, test_df)

#remove extra data columns
df1 <- df1[, c(1:8)]
tbl_df(df1)

#add activity names to name the activities in the data set
df1$V1.1 <- as.character(df1$V1.1)
df1$V1.1[df1$V1.1 == "1"] <- "walking"
df1$V1.1[df1$V1.1 == "2"] <- "walking_upstairs"
df1$V1.1[df1$V1.1 == "3"] <- "walking_downstairs"
df1$V1.1[df1$V1.1 == "4"] <- "sitting"
df1$V1.1[df1$V1.1 == "5"] <- "standing"
df1$V1.1[df1$V1.1 == "6"] <- "laying"

#set column names to help identify data, know that V2:V561 is the X variables
colnames(df1) <- c("subject", "activity", "tBodyAcc_X_mean", "tBodyAcc_Y_mean", "tBodyAcc_Z_mean", 
                   "tBodyAcc_X_std", "tBodyAcc_Y_std", "tBodyAcc_Z_std")


#start creating a dataset with the average of each variable for each activity and each subject
#group the data by subject then activity
grouped <- group_by(df1, subject, activity)

#get the average for each meansurement variable and return it to df2
df_2 <- summarise(grouped, avg_tBodyAcc_X_mean=mean(tBodyAcc_X_mean), avg_tBodyAcc_Y_mean=mean(tBodyAcc_Y_mean), 
        avg_tBodyAcc_Z_mean=mean(tBodyAcc_Z_mean), avg_tBodyAcc_X_std=mean(tBodyAcc_X_std), 
        avg_tBodyAcc_Y_std=mean(tBodyAcc_Y_std), avg_tBodyAcc_Z_std=mean(tBodyAcc_Z_std))

#create txt output file
write.table(df_2, file="./run_anaylsis.txt", row.name=FALSE)


