#Archeype analysis and exploration
#str(archetypeData) #check data structure

#IS THIS AN AWESOME TEST THAT CAN BE RUN? CONVERT TO TEST TO SEE IF ANY NON-STUDENTS ARE ACCIDENTALLY IN WITH THE STUDENTS? THINK ABOUT HOW THIS WOULD WORK...
#mergedFrame <- merge(x=archetypeData, y=teamData, 
#                     by.x="learner_id", by.y="id", all.x = TRUE)
#mergedFrame[complete.cases(mergedFrame)]


#Plot 1: frequency of archetypes (aggregated over all course runs)
ggplot(data = archetypeData, aes(x = archetype, fill = archetype)) +
  geom_bar() +
  xlab("Archetype") + ylab("Frequency") +
  ggtitle("Aggregate archetypes (all course runs)") +
  theme(legend.position = "none")

#Plot 2: facets to display frequency of archetypes by courseID
ggplot(data = archetypeData, aes(x = archetype, fill = archetype)) +
  geom_bar() +
  ylim(0,70) +
  facet_grid(courseID~.) +
  xlab("Archetype") + ylab("Frequency") +
  ggtitle("Archetype frequency by course run") +
  theme(legend.position = "none")

#Plot 3: facets to display frequency of archetypes across courseID by archetype
ggplot(data = archetypeData, aes(x = courseID, fill = archetype)) +
  geom_bar() +
  facet_grid(archetype~.) +
  xlab("Course Run") + ylab("Frequency of each Archetype") +
  ggtitle("Archetype frequency across course runs") +
  theme(legend.position = "none")
#Is this raising he question of how you can get more people to actually take the personality test?


#Join archetypeData, enrollmentData, and leavingSurveyData
archetypeEnrollments <- merge(x = archetypeData, y = enrollmentData, 
                              by.x = c("learner_id", "courseID"), by.y = c("learner_id", "courseID"), 
                              all.x = TRUE)
archetypeEnrollments <- merge(x = archetypeEnrollments, y = leavingSurveyData,
                              by="learner_id",
                              all.x = TRUE)
#Clean this data frame? remove redundant rows?
#view(archetypeEnrollments) #check data structure


#Need to obtain metrics on drop out rates, broken down by courseID and archetype
#for (courseRun in levels(archetypeEnrollments$courseID.x)) {
  #
#}

#rm(courseRun)

#notUnenrolled <- sum(is.na(archetypeEnrollments$unenrolled_at))
#notUnenrolled
#rm(notUnenrolled)


#to plot x and y axes we need to have two variants - what data can open this possibility? Time series data?


#BOXPLOTS: what data would work with boxplots? the question/answer data - break down by archetype once the data has been joined appropriately? Further breakdowns by question and by run of course?
#Or break down by course run?



#1. Archetype analysis - are certain archetypes more or less likely to drop out?

#what other datasets can the archetypes be joined with?
#question_response
#leaving survey
#enrollment
#activity