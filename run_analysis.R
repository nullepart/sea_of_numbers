# Load libraries
library(data.table)
library(dplyr)

# Download the data, extract it

if(!file.exists("./data/raw.zip")) {
  dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(dataURL, destfile = "./data/raw.zip", method = "curl")
} 

if(!file.exists("./data/UCI HAR Dataset/") && !file.exists("./data/raw/")) {
  unzip("./data/raw.zip", exdir = "./data")
  file.rename(from = "./data//UCI HAR Dataset", to = "./data/raw")
}

# load data
train_sub <- read.table("./data//raw/train//subject_train.txt", header = F)
train_acti <- read.table("./data/raw/train/y_train.txt", header = F)
train_data <- read.table("./data/raw/train/X_train.txt", header = F)
df_train <- cbind(train_sub, train_acti, train_data)
rm(train_sub) ; rm(train_acti); rm(train_data) # clean up memory

test_sub <- read.table("./data//raw/test//subject_test.txt", header = F)
test_acti <- read.table("./data/raw/test/y_test.txt", header = F)
test_data <- read.table("./data/raw/test/X_test.txt", header = F)
df_test <- cbind(test_sub, test_acti, test_data)
rm(test_sub) ; rm(test_acti); rm(test_data) # clean up memory

df_total <- rbind(df_test, df_train)

var1 <- c("subject", "activity_n")
var2 <- read.table("./data/raw/features.txt", header = F)
var <- c(var1, as.character(var2[, 2]))
rm(var1)

names(df_total) <- var



View(test_sub[1:10, ])
View(test_acti[1:10, ])
View(test_data[1:10, ])

temp <- read.table("./data/raw/train//Inertial Signals//body_acc_x_train.txt", header = F)
tempdf <- temp[1:5, ]
View(tempdf)
dim(temp)

temp2 <- read.table("./data/raw/train//X_train.txt", header = F)
df2 <- temp2[1:5, ]
View(df2)
dim(temp2)
