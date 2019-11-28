# Preprocessing script 01-C
# leaving survey data
#str(cyber.security.4.leaving.survey.responses) #check structure

#remove empty datasets
rm(cyber.security.1.leaving.survey.responses, cyber.security.2.leaving.survey.responses, cyber.security.3.leaving.survey.responses)


#add courseID columns
cyber.security.4.leaving.survey.responses$courseID <- 4
cyber.security.5.leaving.survey.responses$courseID <- 5
cyber.security.6.leaving.survey.responses$courseID <- 6
cyber.security.7.leaving.survey.responses$courseID <- 7


#merge datasets
leavingSurveyData <- rbind(cyber.security.4.leaving.survey.responses, cyber.security.5.leaving.survey.responses, 
                           cyber.security.6.leaving.survey.responses, cyber.security.7.leaving.survey.responses)
#View(leavingSurveyData)
#str(leavingSurveyData)


#Convert courseID to factor
leavingSurveyData$courseID <- factor(leavingSurveyData$courseID)
#class(leavingSurveyData$courseID)
#levels(leavingSurveyData$courseID)


#replace missing values with NA
leavingSurveyData$last_completed_step_at <- na_if(leavingSurveyData$last_completed_step_at, "")
#str(leavingSurveyData)


#Create date columns from factor columns
leavingSurveyData$left_at <- as.POSIXct(leavingSurveyData$left_at, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")
leavingSurveyData$last_completed_step_at <- as.POSIXct(leavingSurveyData$last_completed_step_at, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")
#str(leavingSurveyData)


#conversion of integer columns to character columns
leavingSurveyData$last_completed_step_number <- as.character(leavingSurveyData$last_completed_step_number)
leavingSurveyData$last_completed_week_number <- as.character(leavingSurveyData$last_completed_week_number)
#class(leavingSurveyData$last_completed_week_number)
#head(leavingSurveyData)


#concatenate character columns (replace values in last_completed_step with characters)
leavingSurveyData$last_completed_step <- paste(leavingSurveyData$last_completed_week_number, leavingSurveyData$last_completed_step_number, sep = ".")
leavingSurveyData$last_completed_step <- na_if(leavingSurveyData$last_completed_step, "NA.NA") #replace "NA.NA" with NA (NULL)
#leavingSurveyData$last_completed_step
#class(leavingSurveyData$last_completed_step)
#head(leavingSurveyData)


#Compressing length of responses
leavingSurveyData$leaving_reason <- gsub("I donâ€™t have enough time","Insufficient time",leavingSurveyData$leaving_reason)
leavingSurveyData$leaving_reason <- gsub("I prefer not to say","Undisclosed",leavingSurveyData$leaving_reason)
leavingSurveyData$leaving_reason <- gsub("The course required more time than I realised","Insufficient time",leavingSurveyData$leaving_reason)
leavingSurveyData$leaving_reason <- gsub("The course was too easy","Too easy",leavingSurveyData$leaving_reason)
leavingSurveyData$leaving_reason <- gsub("The course was too hard","Too hard",leavingSurveyData$leaving_reason)
leavingSurveyData$leaving_reason <- gsub("The course wasnâ€™t what I expected","Unexpected content",leavingSurveyData$leaving_reason)
leavingSurveyData$leaving_reason <- gsub("The course wonâ€™t help me reach my goals","Content irrelevant",leavingSurveyData$leaving_reason)

#typeof(leavingSurveyData$leaving_reason)
leavingSurveyData$leaving_reason <- as.factor(leavingSurveyData$leaving_reason)
#levels(leavingSurveyData$leaving_reason)


#Creating new dataset joining unenrollments with feedback - moved to munging script 01-C
unenrolledFeedback <- merge(x = unenrollmentSubset, y = leavingSurveyData, 
                            by.x = c("learner_id", "courseID"), by.y = c("learner_id", "courseID"), 
                            all.x = FALSE)

#remove redundant datasets
rm(cyber.security.4.leaving.survey.responses, cyber.security.5.leaving.survey.responses, 
   cyber.security.6.leaving.survey.responses, cyber.security.7.leaving.survey.responses)