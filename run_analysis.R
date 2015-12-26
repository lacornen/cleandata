library(plyr)

# Function to ouput tidier variable name
TidyVariableName <- function(var.name) {
        var.tmp <- var.name
        var.tmp <- gsub("-mean\\()","Mean",var.tmp)
        var.tmp <- gsub("-std\\()","StdDev", var.tmp)
        var.tmp <- gsub("^t","time", var.tmp)
        var.tmp <- gsub("^f","freq", var.tmp)
        var.tmp <- gsub("BodyBody","Body", var.tmp)
        var.tmp <- gsub("Mag","Magnitude", var.tmp)
        var.tmp <- gsub("Acc","Acceleration", var.tmp)
        var.tmp <- gsub("-X","-X", var.tmp)
        var.tmp <- gsub("-Y","-Y", var.tmp)
        var.tmp <- gsub("-Z","-Z", var.tmp)
        return(var.tmp)
}

GetTransFormSet  <- function(filename.x, filename.y, filename.subject,
                             df.features, df.activity.labels){
  
        # Read x and y file
        df.x <- read.table(filename.x) 
        
        df.y <- read.table(filename.y) 
        
        #df.activity.labels to defactor to come back other wise wrong merging to redo
        # Read subject file
        df.subject <- read.table(filename.subject)
        
        # Rename variable using features table description
        for(i in 1:nrow(df.features)) {
                names(df.x)[df.features[i,'V1']] <- as.character(df.features[i,'V2'])
        }
        
        # Keep only variable correspondint to mean or standard deviation
        df.sub<- df.x[grep(".*(mean|std)\\(\\).*",names(df.x))]
        
        # Change  variable name to be more tidy
        colname.sub <-  colnames(df.sub) 
        
        for (i in 1:length(colname.sub)) {
                colname.sub[i] <- TidyVariableName(colname.sub[i])
        }
        colnames(df.sub) <- colname.sub
        
        
        # define activity label column  by matching activity id number in df.y and label description 
        df.sub['activity'] <- factor(df.y$V1, levels=df.activity.labels$V1, 
                                     labels=df.activity.labels$V2)
        
        # define subject column
        df.sub['subject'] <- as.factor(df.subject$V1)
        
        return(df.sub)
        
} 

file.zip <- "getdata_projectfiles_UCI HAR Dataset.zip"
data.dir <- "UCI HAR Dataset"

file.url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists(data.dir) & !file.exists(file.zip)) {
        download.file(file.url, file.zip)
} 

if(!file.exists(data.dir)) {
        unzip(file.zip)
}

df.features <- read.table("UCI HAR Dataset/features.txt") 
df.activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")


df.test <- GetTransFormSet(filename.x="UCI HAR Dataset/test/X_test.txt",
                           filename.y="UCI HAR Dataset/test/Y_test.txt",
                           filename.subject="UCI HAR Dataset/test/subject_test.txt",
                           df.features=df.features,
                           df.activity.labels=df.activity.labels)


df.train <- GetTransFormSet(filename.x="UCI HAR Dataset/train/X_train.txt",
                            filename.y="UCI HAR Dataset/train/Y_train.txt",
                            filename.subject="UCI HAR Dataset/train/subject_train.txt",
                            df.features=df.features,
                            df.activity.labels=df.activity.labels)


# Bind the two sets 

df.full <- rbind(df.train, df.test)


# Perform mean on each column grouped by subject and activity using ddply

df.avg <- ddply(df.full, .(subject,activity), colwise(mean))

# Output tidy dataset.
write.table(df.avg, "tidy_data_output.txt", row.name=FALSE)


