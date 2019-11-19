#-----Initial data exploration
library(ProjectTemplate)
load.project() #Load project and data


#archetype survey responses
summary(cyber.security.1.archetype.survey.responses)
str(cyber.security.1.archetype.survey.responses)

summary(cyber.security.2.archetype.survey.responses)
str(cyber.security.2.archetype.survey.responses)

summary(cyber.security.3.archetype.survey.responses)
str(cyber.security.3.archetype.survey.responses)
head(cyber.security.3.archetype.survey.responses)
levels(cyber.security.3.archetype.survey.responses$archetype)
cyber.security.3.archetype.survey.responses$id
qplot(data = cyber.security.3.archetype.survey.responses, x = archetype)

summary(cyber.security.4.archetype.survey.responses)
str(cyber.security.4.archetype.survey.responses)
levels(cyber.security.4.archetype.survey.responses$archetype)
cyber.security.4.archetype.survey.responses$id
qplot(data = cyber.security.4.archetype.survey.responses, x = archetype)

summary(cyber.security.5.archetype.survey.responses)
str(cyber.security.5.archetype.survey.responses)
levels(cyber.security.5.archetype.survey.responses$archetype)
qplot(data = cyber.security.5.archetype.survey.responses, x = archetype)

summary(cyber.security.6.archetype.survey.responses)
str(cyber.security.6.archetype.survey.responses)
levels(cyber.security.6.archetype.survey.responses$archetype)
qplot(data = cyber.security.6.archetype.survey.responses, x = archetype)

summary(cyber.security.7.archetype.survey.responses)
str(cyber.security.7.archetype.survey.responses)
levels(cyber.security.7.archetype.survey.responses$archetype)
qplot(data = cyber.security.7.archetype.survey.responses, x = archetype)


#Enrollment data
summary(cyber.security.1.enrolments)
str(cyber.security.1.enrolments)
head(cyber.security.1.enrolments)
qplot(data = cyber.security.1.enrolments, x = gender)

summary(cyber.security.2.enrolments)
str(cyber.security.2.enrolments)

summary(cyber.security.3.enrolments)
str(cyber.security.3.enrolments)

summary(cyber.security.4.enrolments)
str(cyber.security.4.enrolments)

summary(cyber.security.5.enrolments)
str(cyber.security.5.enrolments)

summary(cyber.security.6.enrolments)
str(cyber.security.6.enrolments)

summary(cyber.security.7.enrolments)
str(cyber.security.7.enrolments)


#Leaving survey responses
summary(cyber.security.1.leaving.survey.responses)
str(cyber.security.1.leaving.survey.responses)

summary(cyber.security.2.leaving.survey.responses)
str(cyber.security.2.leaving.survey.responses)

summary(cyber.security.3.leaving.survey.responses)
str(cyber.security.3.leaving.survey.responses)

summary(cyber.security.4.leaving.survey.responses)
str(cyber.security.4.leaving.survey.responses)

summary(cyber.security.5.leaving.survey.responses)
str(cyber.security.5.leaving.survey.responses)
qplot(data = cyber.security.5.leaving.survey.responses, x = leaving_reason)

summary(cyber.security.6.leaving.survey.responses)
str(cyber.security.6.leaving.survey.responses)
qplot(data = cyber.security.6.leaving.survey.responses, x = leaving_reason)

summary(cyber.security.7.leaving.survey.responses)
str(cyber.security.7.leaving.survey.responses)
qplot(data = cyber.security.7.leaving.survey.responses, x = leaving_reason)


#question-response data
summary(cyber.security.1.question.response)
str(cyber.security.1.question.response)
head(cyber.security.1.question.response)
qplot(data = cyber.security.1.question.response, x = correct)

summary(cyber.security.2.question.response)
str(cyber.security.2.question.response)
head(cyber.security.2.question.response)

summary(cyber.security.3.question.response)
str(cyber.security.3.question.response)

summary(cyber.security.4.question.response)
str(cyber.security.4.question.response)

summary(cyber.security.5.question.response)
str(cyber.security.5.question.response)

summary(cyber.security.6.question.response)
str(cyber.security.6.question.response)

summary(cyber.security.7.question.response)
str(cyber.security.7.question.response)


#step activity data
str(cyber.security.1.step.activity)
summary(cyber.security.1.step.activity)
head(cyber.security.1.step.activity)

str(cyber.security.2.step.activity)
summary(cyber.security.2.step.activity)

str(cyber.security.3.step.activity)
summary(cyber.security.3.step.activity)

str(cyber.security.4.step.activity)
summary(cyber.security.4.step.activity)

str(cyber.security.5.step.activity)
summary(cyber.security.5.step.activity)

str(cyber.security.6.step.activity)
summary(cyber.security.6.step.activity)

str(cyber.security.7.step.activity)
summary(cyber.security.7.step.activity)


#weekly sentiment data
str(cyber.security.1.weekly.sentiment.survey.responses)
summary(cyber.security.1.weekly.sentiment.survey.responses)

str(cyber.security.2.weekly.sentiment.survey.responses)
summary(cyber.security.2.weekly.sentiment.survey.responses)

str(cyber.security.3.weekly.sentiment.survey.responses)
summary(cyber.security.3.weekly.sentiment.survey.responses)

str(cyber.security.4.weekly.sentiment.survey.responses)
summary(cyber.security.4.weekly.sentiment.survey.responses)

str(cyber.security.5.weekly.sentiment.survey.responses)
summary(cyber.security.5.weekly.sentiment.survey.responses)

str(cyber.security.6.weekly.sentiment.survey.responses)
summary(cyber.security.6.weekly.sentiment.survey.responses)
qplot(data = cyber.security.6.weekly.sentiment.survey.responses, x = experience_rating)

str(cyber.security.7.weekly.sentiment.survey.responses)
summary(cyber.security.7.weekly.sentiment.survey.responses)
qplot(data = cyber.security.7.weekly.sentiment.survey.responses, x = experience_rating)


#team members
str(cyber.security.2.team.members)
levels(cyber.security.2.team.members$team_role)

str(cyber.security.3.team.members)
levels(cyber.security.3.team.members$team_role)

str(cyber.security.4.team.members)
levels(cyber.security.4.team.members$team_role)

str(cyber.security.5.team.members)
levels(cyber.security.5.team.members$team_role)

str(cyber.security.6.team.members)
levels(cyber.security.6.team.members$team_role)

str(cyber.security.7.team.members)
levels(cyber.security.7.team.members$team_role)


#video stats
str(cyber.security.3.video.stats)
summary(cyber.security.3.video.stats)

str(cyber.security.4.video.stats)
summary(cyber.security.4.video.stats)

str(cyber.security.5.video.stats)
summary(cyber.security.5.video.stats)

str(cyber.security.6.video.stats)
summary(cyber.security.6.video.stats)

str(cyber.security.7.video.stats)
summary(cyber.security.7.video.stats)















