# Preprocessing script 01-F
# Weekly sentiment data
#str(cyber.security.7.weekly.sentiment.survey.responses) # check structure and identify date columns
#summary(cyber.security.7.weekly.sentiment.survey.responses) # gain familiarity with general properties of the data


#Remove empty datasets
rm(cyber.security.1.weekly.sentiment.survey.responses, cyber.security.2.weekly.sentiment.survey.responses, 
   cyber.security.3.weekly.sentiment.survey.responses, cyber.security.4.weekly.sentiment.survey.responses)


#merge datasets
sentimentData <- rbind(cyber.security.5.weekly.sentiment.survey.responses, 
                       cyber.security.6.weekly.sentiment.survey.responses, 
                       cyber.security.7.weekly.sentiment.survey.responses)


#convert experience_rating and week_number to factors
sentimentData$experience_rating <- factor(sentimentData$experience_rating)
sentimentData$week_number <- factor(sentimentData$week_number)
#levels(sentimentData$week_number) #checking factor levels


#create responded_date column
sentimentData$responded_at <- as.POSIXct(sentimentData$responded_at, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")
#str(sentimentData) # checking column types

#remove redundant datasets
rm(cyber.security.5.weekly.sentiment.survey.responses, 
   cyber.security.6.weekly.sentiment.survey.responses, 
   cyber.security.7.weekly.sentiment.survey.responses)