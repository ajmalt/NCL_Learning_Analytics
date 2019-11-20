# Preprocessing script 01-E
# Step activity data
#str(cyber.security.7.step.activity) # check structure and identify date columns
#summary(cyber.security.7.step.activity) # gain familiarity with general properties of the data


#assign course ID
cyber.security.1.step.activity$courseID <- 1
cyber.security.2.step.activity$courseID <- 2
cyber.security.3.step.activity$courseID <- 3
cyber.security.4.step.activity$courseID <- 4
cyber.security.5.step.activity$courseID <- 5
cyber.security.6.step.activity$courseID <- 6
cyber.security.7.step.activity$courseID <- 7


#merge datasets
activityData <- rbind(cyber.security.1.step.activity, cyber.security.2.step.activity, cyber.security.3.step.activity, 
                      cyber.security.4.step.activity, cyber.security.5.step.activity, cyber.security.6.step.activity, 
                      cyber.security.7.step.activity)


#convert courseID to factor
activityData$courseID <- factor(activityData$courseID)


#convert week_number and step_number to characters
activityData$week_number <- as.character(activityData$week_number)
activityData$step_number <- as.character(activityData$step_number)


#concatenate week_number and step_number to overwrite step column
activityData$step <- paste(activityData$week_number, activityData$step_number, sep = ".")


#convert week_number, step_number and step to factors
activityData$week_number <- factor(activityData$week_number)
activityData$step_number <- factor(activityData$step_number)
activityData$step <- factor(activityData$step)


#Create date columns from factor columns
activityData$first_visited_date <- as.Date(as.character(activityData$first_visited_at))
activityData$last_completed_at <- na_if(activityData$last_completed_at, "")
#activityData$last_completed_at
activityData$last_completed_date <- as.Date(as.character(activityData$last_completed_at))


#testing
#View(activityData)
#str(activityData)


#remove redundant datasets
rm(cyber.security.1.step.activity, cyber.security.2.step.activity, cyber.security.3.step.activity, 
   cyber.security.4.step.activity, cyber.security.5.step.activity, cyber.security.6.step.activity, 
   cyber.security.7.step.activity)
