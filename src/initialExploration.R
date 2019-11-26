#-----Initial data exploration
library(ProjectTemplate)
load.project() #Load project and data


#archetype survey responses
#summary(cyber.security.1.archetype.survey.responses)
#str(cyber.security.1.archetype.survey.responses)

#summary(cyber.security.2.archetype.survey.responses)
#str(cyber.security.2.archetype.survey.responses)

#summary(cyber.security.3.archetype.survey.responses)
#str(cyber.security.3.archetype.survey.responses)
#head(cyber.security.3.archetype.survey.responses)
#levels(cyber.security.3.archetype.survey.responses$archetype)
#cyber.security.3.archetype.survey.responses$id
#qplot(data = cyber.security.3.archetype.survey.responses, x = archetype)

#summary(cyber.security.4.archetype.survey.responses)
#str(cyber.security.4.archetype.survey.responses)
#levels(cyber.security.4.archetype.survey.responses$archetype)
#cyber.security.4.archetype.survey.responses$id
#qplot(data = cyber.security.4.archetype.survey.responses, x = archetype)

#summary(cyber.security.5.archetype.survey.responses)
#str(cyber.security.5.archetype.survey.responses)
#(cyber.security.5.archetype.survey.responses$archetype)
#qplot(data = cyber.security.5.archetype.survey.responses, x = archetype)

#summary(cyber.security.6.archetype.survey.responses)
#str(cyber.security.6.archetype.survey.responses)
#levels(cyber.security.6.archetype.survey.responses$archetype)
#qplot(data = cyber.security.6.archetype.survey.responses, x = archetype)

#summary(cyber.security.7.archetype.survey.responses)
#str(cyber.security.7.archetype.survey.responses)
#levels(cyber.security.7.archetype.survey.responses$archetype)
#qplot(data = cyber.security.7.archetype.survey.responses, x = archetype)

    #post munging
    qplot(data = archetypeData, x = archetype, fill = archetype)

#Enrollment data
#summary(cyber.security.1.enrolments)
#str(cyber.security.1.enrolments)
#head(cyber.security.1.enrolments)
#qplot(data = cyber.security.1.enrolments, x = gender)

#summary(cyber.security.2.enrolments)
#str(cyber.security.2.enrolments)

#summary(cyber.security.3.enrolments)
#str(cyber.security.3.enrolments)

#summary(cyber.security.4.enrolments)
#str(cyber.security.4.enrolments)

#summary(cyber.security.5.enrolments)
#str(cyber.security.5.enrolments)

#summary(cyber.security.6.enrolments)
#str(cyber.security.6.enrolments)

#summary(cyber.security.7.enrolments)
#str(cyber.security.7.enrolments)
    
    levels(enrollmentData$role)
    levels(enrollmentData$gender)
    levels(enrollmentData$country)
    #post munging
    str(enrollmentData)
    #COMMON THEME - there is a huge proportion of missing data. Charts for each category showing the amount of knowns to unknowns? Possible to use qplots for pie charts for this purpose?
    qplot(data = enrollmentData, x = gender, fill = gender) #by gender
    #Can I exclude unknowns from the above? Can I calculate the rato of unknowns to complete? (Data quality report)
    qplot(data = enrollmentData, x = country, fill = country) #by country
    #Histogram is effectively useless due to amount of countries - limit to top 5-10? Pie chart? extract vector of contries that does not include NA?
    qplot(data = enrollmentData, x = age_range, fill = age_range) #by age range
    #Can I exclude unknowns from the above? Can I calculate the rato of unknowns to complete? (Data quality report)
    qplot(data = enrollmentData, x = highest_education_level, fill = highest_education_level) #by highest education level
    #Can I exclude unknowns from the above? Can I calculate the rato of unknowns to complete? (Data quality report)
    qplot(data = enrollmentData, x = employment_status, fill = employment_status)
    #Can I exclude unknowns from the above? Can I calculate the rato of unknowns to complete? (Data quality report)
    qplot(data = enrollmentData, x = employment_area, fill = employment_area)
    #Can I exclude unknowns from the above? Can I calculate the rato of unknowns to complete? (Data quality report)
    qplot(data = enrollmentData, x = detected_country, fill = detected_country)
    #Histogram is effectively useless due to amount of countries - limit to top 5-10? Pie chart? N.B. there is very little unknown data here, which is awesome.
    #Anything of significance in time series data?
    
#Leaving survey responses
#summary(cyber.security.1.leaving.survey.responses)
#str(cyber.security.1.leaving.survey.responses)

#summary(cyber.security.2.leaving.survey.responses)
#str(cyber.security.2.leaving.survey.responses)

#summary(cyber.security.3.leaving.survey.responses)
#str(cyber.security.3.leaving.survey.responses)

#summary(cyber.security.4.leaving.survey.responses)
#str(cyber.security.4.leaving.survey.responses)

#summary(cyber.security.5.leaving.survey.responses)
#str(cyber.security.5.leaving.survey.responses)
#qplot(data = cyber.security.5.leaving.survey.responses, x = leaving_reason)

#(cyber.security.6.leaving.survey.responses)
#str(cyber.security.6.leaving.survey.responses)
#qplot(data = cyber.security.6.leaving.survey.responses, x = leaving_reason)

#summary(cyber.security.7.leaving.survey.responses)
#str(cyber.security.7.leaving.survey.responses)
#qplot(data = cyber.security.7.leaving.survey.responses, x = leaving_reason)

    #post munging
    qplot(data = leavingSurveyData, x = leaving_reason, fill = leaving_reason)
    #how has this changed year to year? Do ggplot for this?
    #time series analysis on left dat and last completed step date?
    
#question-response data
#summary(cyber.security.1.question.response)
#str(cyber.security.1.question.response)
#head(cyber.security.1.question.response)
#qplot(data = cyber.security.1.question.response, x = correct)

#summary(cyber.security.2.question.response)
#str(cyber.security.2.question.response)
#head(cyber.security.2.question.response)

#summary(cyber.security.3.question.response)
#str(cyber.security.3.question.response)

#summary(cyber.security.4.question.response)
#str(cyber.security.4.question.response)

#summary(cyber.security.5.question.response)
#str(cyber.security.5.question.response)

#summary(cyber.security.6.question.response)
#str(cyber.security.6.question.response)

#summary(cyber.security.7.question.response)
#str(cyber.security.7.question.response)

    #post munging
    qplot(data = qaData, x = correct)
    #how do you break this out into a multi-series column chart?
    #how do you break this down by question?


#step activity data
#str(cyber.security.1.step.activity)
#summary(cyber.security.1.step.activity)
#head(cyber.security.1.step.activity)

#str(cyber.security.2.step.activity)
#summary(cyber.security.2.step.activity)

#str(cyber.security.3.step.activity)
#summary(cyber.security.3.step.activity)

#(cyber.security.4.step.activity)
#summary(cyber.security.4.step.activity)

#str(cyber.security.5.step.activity)
#summary(cyber.security.5.step.activity)

#str(cyber.security.6.step.activity)
#summary(cyber.security.6.step.activity)

#str(cyber.security.7.step.activity)
#summary(cyber.security.7.step.activity)
    
    #post munging
    str(activityData)
    #can we total which students completed which step and when to get an indication of if/when participation tails off?
    #can this be cross references against the sentiment data (below)?
    

#weekly sentiment data
#str(cyber.security.1.weekly.sentiment.survey.responses)
#summary(cyber.security.1.weekly.sentiment.survey.responses)

#str(cyber.security.2.weekly.sentiment.survey.responses)
#summary(cyber.security.2.weekly.sentiment.survey.responses)

#str(cyber.security.3.weekly.sentiment.survey.responses)
#summary(cyber.security.3.weekly.sentiment.survey.responses)

#str(cyber.security.4.weekly.sentiment.survey.responses)
#summary(cyber.security.4.weekly.sentiment.survey.responses)

#str(cyber.security.5.weekly.sentiment.survey.responses)
#summary(cyber.security.5.weekly.sentiment.survey.responses)

#str(cyber.security.6.weekly.sentiment.survey.responses)
#summary(cyber.security.6.weekly.sentiment.survey.responses)
#qplot(data = cyber.security.6.weekly.sentiment.survey.responses, x = experience_rating)

#str(cyber.security.7.weekly.sentiment.survey.responses)
#summary(cyber.security.7.weekly.sentiment.survey.responses)
#qplot(data = cyber.security.7.weekly.sentiment.survey.responses, x = experience_rating)

    #post munging
    #time series - perhaps just integrate?


#team members
#str(cyber.security.2.team.members)
#levels(cyber.security.2.team.members$team_role)

#str(cyber.security.3.team.members)
#levels(cyber.security.3.team.members$team_role)

#str(cyber.security.4.team.members)
#levels(cyber.security.4.team.members$team_role)

#str(cyber.security.5.team.members)
#levels(cyber.security.5.team.members$team_role)

#str(cyber.security.6.team.members)
#levels(cyber.security.6.team.members$team_role)

#str(cyber.security.7.team.members)
#levels(cyber.security.7.team.members$team_role)

    #unclear that there is much benefit to this data - exclude?
    

#video stats
#str(cyber.security.3.video.stats)
#summary(cyber.security.3.video.stats)

#str(cyber.security.4.video.stats)
#summary(cyber.security.4.video.stats)

#str(cyber.security.5.video.stats)
#summary(cyber.security.5.video.stats)

#str(cyber.security.6.video.stats)
#summary(cyber.security.6.video.stats)

#str(cyber.security.7.video.stats)
#summary(cyber.security.7.video.stats)

    #interesting data, but no way to link to students













