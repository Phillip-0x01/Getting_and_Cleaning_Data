list.of.packages <- c("dplyr", "downloader")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

library(downloader)
library(dplyr)

#download files
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(url, dest="dataset.zip", mode="wb", quiet = TRUE) 
unzip ("dataset.zip", exdir = "./")

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
colnames(df1) <- c("subject", "activity", "X_mean", "Y_mean", "Z_mean", "X_sd", "Y_sd", "Z_sd")


#start creating a dataset with the average of each variable for each activity and each subject
#group the data by subject then activity
grouped <- group_by(df1, subject, activity)

#get the average for each meansurement variable and return it to df2
df_2 <- summarise(grouped, avg_X_mean=mean(X_mean), avg_Y_mean=mean(Y_mean), 
        avg_Z_mean=mean(Z_mean), avg_X_sd=mean(X_sd), avg_Y_sd=mean(Y_sd), avg_Z_sd=mean(Z_sd))
