# Preprocessing script 01-D
# Question-Reponse data
#str(cyber.security.5.question.response) # check structure and identify date columns
#summary(cyber.security.5.question.response) # gain familiarity with general properties of the data


#add courseID columns
cyber.security.1.question.response$courseID <- 1
cyber.security.2.question.response$courseID <- 2
cyber.security.3.question.response$courseID <- 3
cyber.security.4.question.response$courseID <- 4
cyber.security.5.question.response$courseID <- 5
cyber.security.6.question.response$courseID <- 6
cyber.security.7.question.response$courseID <- 7


#merge datasets
qaData <- rbind(cyber.security.1.question.response, cyber.security.2.question.response, cyber.security.3.question.response, 
                cyber.security.4.question.response, cyber.security.5.question.response, cyber.security.6.question.response,
                cyber.security.7.question.response)


#Convert courseID to factor
qaData$courseID <- factor(qaData$courseID)


#Delete the cloze response column
#qaData$cloze_response <- factor(qaData$cloze_response) # turn column into factor
#levels(qaData$cloze_response) # confirm column empty
qaData$cloze_response <- NULL


#Create submitted_date column
qaData$submitted_date <- as.Date(as.character(qaData$submitted_at))


#Convert integer columns to factors
qaData$week_number <- factor(qaData$week_number)
qaData$step_number <- factor(qaData$step_number)
qaData$question_number <- factor(qaData$question_number)
#class(qaData$question_number) #testing
#levels(qaData$question_number) #testing


#Testing
#View(qaData)
#str(qaData)


#Remove redundant datasets
rm(cyber.security.1.question.response, cyber.security.2.question.response, cyber.security.3.question.response, 
   cyber.security.4.question.response, cyber.security.5.question.response, cyber.security.6.question.response,
   cyber.security.7.question.response)