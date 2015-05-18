# Load libraries
library(data.table)
library(dplyr)

# INSTRUCTION:  You should create one R script called run_analysis.R that does the following. 

# STEP 1: Merges the training and the test sets to create one data set.

## Download the data, extract it

if(!file.exists("./data/raw.zip")) {
  dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(dataURL, destfile = "./data/raw.zip", method = "curl")
} 

if(!file.exists("./data/UCI HAR Dataset/") && !file.exists("./data/raw/")) {
  unzip("./data/raw.zip", exdir = "./data")
  file.rename(from = "./data//UCI HAR Dataset", to = "./data/raw")
}

## load data
train.sub <- read.table("./data//raw/train//subject_train.txt", header = F)
train.acti <- read.table("./data/raw/train/y_train.txt", header = F)
train.data <- read.table("./data/raw/train/X_train.txt", header = F)
df.train <- cbind(train.sub, train.acti, train.data)
rm(train.sub) ; rm(train.acti); rm(train.data) # clean up memory

test.sub <- read.table("./data//raw/test//subject_test.txt", header = F)
test.acti <- read.table("./data/raw/test/y_test.txt", header = F)
test.data <- read.table("./data/raw/test/X_test.txt", header = F)
df.test <- cbind(test.sub, test.acti, test.data)

df.total <- rbind(df.test, df.train)

var1 <- c("subject", "activity.n")
var2 <- read.table("./data/raw/features.txt", header = F)
var <- c(var1, as.character(var2[, 2]))
rm(var1)

names(df.total) <- var
dt.total <- data.table(df.total, key = activity.n))

rm(test.sub) ; rm(test.acti); rm(test.data) # clean up memory
rm(df.test); rm(df.total); rm(df.train)


# STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

  ### This works. It is just very complicated.
  # q <- quote(c(grep("subject", names(dt.total)), grep("activity.n", names(dt.total)), grep("std", names(dt.total)), grep("mean", names(dt.total))))
  # dt <-dt.total[, eval(q), with = F]

### This is easier: using the subset function on a data.table
cols <- c("subject", "activity.n", grep("mean|std", names(dt.total), value = T))
dt <- subset(dt.total, select = cols)


# STEP 3. Uses descriptive activity names to name the activities in the data set
acti <- data.table(read.table(file = "./data/raw/activity_labels.txt", 
                              header = F))
setnames(acti, c("V1", "V2"), c("activity.n", "activity"))
setkey(acti, activity.n)

dt <- dt[acti]
n.col <- dim(dt)[2]
setcolorder(dt, c("subject", "activity.n", 
                  "activity", 
                  names(dt)[4:n.col-1])) # To put activity at the
                                         # beginning of the table


# STEP 4. Appropriately labels the data set with descriptive variable names. 
# Already done as part of STEP 1.

# STEP 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subjec



##### Carré de sable

View(test.sub[1:10, ])
View(test.acti[1:10, ])
View(test.data[1:10, ])

temp <- read.table("./data/raw/train//Inertial Signals//body_acc_x_train.txt", header = F)
tempdf <- temp[1:5, ]
View(tempdf)
dim(temp)

temp2 <- read.table("./data/raw/train//X_train.txt", header = F)
df2 <- temp2[1:5, ]
View(df2)
dim(temp2)