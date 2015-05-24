# Load libraries
library(data.table)
library(dplyr)

# INSTRUCTION:  You should create one R script called run_analysis.R that does the following. 

# STEP 1: Merges the training and the test sets to create one data set.

## Download the data, extract it

if(!file.exists("./data/raw.zip")) {
  dataURL <- "https:/d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(dataURL, destfile = "./data/raw.zip", method = "curl")
} 

if(!file.exists("./data/UCI HAR Dataset/") && !file.exists("./data/raw/")) {
  unzip("./data/raw.zip", exdir = "./data")
  file.rename(from = "./data/UCI HAR Dataset", to = "./data/raw")
}

## load data
train.sub <- read.table("./data/raw/train/subject_train.txt", header = F)
train.acti <- read.table("./data/raw/train/y_train.txt", header = F)
train.data <- read.table("./data/raw/train/X_train.txt", header = F)
df.train <- cbind(train.sub, train.acti, train.data)
rm(train.sub) ; rm(train.acti); rm(train.data) # clean up memory

# Joining together the subject, activity nb, and data for train & test
test.sub <- read.table("./data/raw/test/subject_test.txt", header = F)
test.acti <- read.table("./data/raw/test/y_test.txt", header = F)
test.data <- read.table("./data/raw/test/X_test.txt", header = F)
df.test <- cbind(test.sub, test.acti, test.data)
rm(test.sub) ; rm(test.acti); rm(test.data) # clean up memory

df.total <- rbind(df.test, df.train)

# Adding the proper column headers (subj, acti, features)
# N.B. normally part of STEP IV, but done here

var1 <- c("subject", "activity.n")
var2 <- read.table("./data/raw/features.txt", header = F)
var <- c(var1, as.character(var2[, 2]))
rm(var1) ; rm(var2)

# But these column names are not entirely legal in R
# We will remove all parentheses and hyphens from the names;
# then, remove all ".." and "..." introduced by make.names
var3 <- make.names(var)
var3 <- gsub(pattern = "...", replacement = ".", x = var3, fixed = T)
var3 <- gsub(pattern = "..", replacement = "", x = var3, fixed = T)

# Passing out these new column names into a new data.table
names(df.total) <- var3
dt.total <- data.table(df.total)
setkey(x = dt.total, activity.n)

rm(df.test); rm(df.total); rm(df.train)


# STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

### Using the subset function on a data.table
cols <- c("subject", "activity.n", grep("mean|std", names(dt.total), value = T))
dt <- subset(dt.total, select = cols)


# STEP 3. Uses descriptive activity names to name the activities in the data set
acti <- data.table(read.table(file = "./data/raw/activity_labels.txt", 
                              header = F))
setnames(acti, c("V1", "V2"), c("activity.n", "activity"))
setkey(acti, activity.n)

# Joins acti and dt using their common key
dt <- dt[acti] 
n.col <- dim(dt)[2]

# To put activity at thebeginning of the table
setcolorder(dt, c("subject", "activity.n", 
                  "activity", 
                  names(dt)[4:n.col-1])) 


# STEP 4. Appropriately labels the data set with descriptive variable names. 
# Already done as part of STEP 1. But let's clean up.

setkey(dt, subject)
dt[, activity.n := NULL] # Deletes this column


# STEP 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

dt2 <- dt[, lapply(.SD, mean), by=list(activity, subject)]
write.table(dt2, file = "tidy.txt", row.name=FALSE, sep=",")

