
GetTransFormSet  <- function(filename.x, filename.y, filename.subject,
                             df.features, df.activity.labels){
  
        df.x <- read.table(filename.x) 
        
        df.y <- read.table(filename.y) 
        
        df.subject <- read.table(filename.subject)
        
        for(i in 1:561) {
                names(df.x)[df.features[i,'V1']] <- as.character(df.features[i,'V2'])
        }
        df.sub<- df.x[grep(".*(mean|std)\\(\\).*",names(df.x))]
        
        df.sub['subject'] <- df.subject$V1
        df.sub['activity_int'] <- df.y$V1
        
        df.sub <- merge(df.sub, df.activity.labels, by.x='activity_int', by.y='V1', all.x=TRUE)
        
        colnames(df.sub)[colnames(df.sub) == 'V2'] <- 'activity'
        
        return(df.sub)
        
} 

df.features <- read.table("UCI HAR Dataset/features.txt") 
df.activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")


df.test <- GetTransFormSet(filename.x="UCI HAR Dataset/test/X_test.txt",
                           filename.y="UCI HAR Dataset/test/Y_test.txt",
                           filename.subject="UCI HAR Dataset/test/subject_test.txt",
                           df.features=df.features,
                           df.activity.labels=df.activity.labels)


df.x <- read.table("UCI HAR Dataset/test/X_test.txt") 

df.y <- read.table("UCI HAR Dataset/test/Y_test.txt") 





summary(df.x.sub)