#Presentation script

#unenrollments - Interesting, so people from the first run of the course are unenrolled up to two years after a lot of their coursemates
initialQuickPlot <- qplot(data = enrollmentData, x = unenrolled_at, fill = courseID)

#Unenrollment analysis # creation of subset moved to munging script 01-B

#Splitting unenrollment dates by course run
unenrollCoursePlot <- ggplot(data = unenrollmentSubset, aes(x = unenrolled_at, fill = courseID)) + 
  geom_histogram() + 
  facet_grid(courseID~.) + 
  xlab("Date unenrolled") + 
  ylab("Frequency") + 
  ggtitle("Unenrollment over time by course run") + 
  theme(legend.position = "none")


#Age explanation
ageSubset <- unenrollmentSubset[complete.cases(unenrollmentSubset[,"age_range"]),]
agePlot <- ggplot(data = ageSubset, aes(x = unenrolled_at, fill = courseID)) +
  geom_histogram() +
  facet_grid(courseID~.~age_range) +
  xlab("Date unenrolled") + ylab("Frequency") +
  ggtitle("Unenrollment over time by age bracket and course run") +
  theme(legend.position = "none")

#Gender explanation
genderSubset <- unenrollmentSubset[complete.cases(unenrollmentSubset[,"gender"]),]
genderPlot <- ggplot(data = genderSubset, aes(x = unenrolled_at, fill = courseID)) +
  geom_histogram() +
  facet_grid(courseID~.~gender) +
  xlab("Date unenrolled") + ylab("Frequency") +
  ggtitle("Unenrollment over time by gender and course run") +
  theme(legend.position = "none")


#Educational level
#educationSubset <- unenrollmentSubset[complete.cases(unenrollmentSubset[,"highest_education_level"]),]
#educationalPlot <- ggplot(data = educationSubset, aes(x = unenrolled_at, fill = courseID)) +
  #geom_histogram() +
  #facet_grid(courseID~.~highest_education_level) +
  #xlab("Date unenrolled") + ylab("Frequency") +
  #ggtitle("Unenrollment over time by education level and course run") +
  #theme(legend.position = "none")


#Archetypes
#archetypeSubset <- unenrollmentSubset[complete.cases(unenrollmentSubset[,"archetype"]),]
#archetypePlot <- ggplot(data = archetypeSubset, aes(x = unenrolled_at, fill = courseID)) +
  #geom_histogram() +
  #facet_grid(courseID~.~archetype) +
  #xlab("Date unenrolled") + ylab("Frequency") +
  #ggtitle("Unenrollment over time by archetype and course run") +
  #theme(legend.position = "none")


#Duration analysis
durationPlot <- ggplot(data = unenrollmentSubset, aes(x=courseID, y=duration, colour = courseID)) +
  geom_jitter() +
  geom_boxplot(size = 1.2, colour = "brown", alpha = 0.3) +
  xlab("Course run") + ylab("Duration enrolled (weeks)") +
  ggtitle("Durations from enrollment to unenrollment by course run") +
  theme(legend.position = "none")


#Creating new dataset with feedback - moved to munging script 01-C

#Jitter/Box: Duration enrolled, reason for leaving, and last completed week
reasonUnenrolled <- ggplot(data = unenrolledFeedback, aes(x = leaving_reason, y = duration, colour = last_completed_week_number)) +
  geom_jitter(size=2) +
  geom_boxplot(size = 1.2, colour = "brown", alpha = 0.3) +
  xlab("Reason for leaving") + ylab("Duration enrolled (weeks)") +
  ggtitle("Duration enrolled by reason given for leaving")


#Bar: Reason for leaving
reasonLeavingBar <- ggplot(data = unenrolledFeedback, aes(x = leaving_reason, fill = last_completed_week_number)) +
  geom_bar() +
  xlab("Reason for leaving") + ylab("Frequency") +
  labs (fill = "Last completed week") +
  ggtitle("Frequencies of reasons for leaving by last completed week number")


#Bar with facets: Reason for leaving
reasonLeavingFacet <- ggplot(data = unenrolledFeedback, aes(x = leaving_reason, fill = last_completed_week_number)) +
  geom_bar() +
  facet_grid(courseID~.) +
  xlab("Reason for leaving") + ylab("Frequency") +
  labs (fill = "Last completed week") +
  ggtitle("Frequencies of reasons for leaving by last completed week number")


#Bar last completed step: Reason for leaving
lastStepPlot <- ggplot(data = unenrolledFeedback, aes(x = last_completed_step, fill= leaving_reason)) +
  geom_bar() +
  xlab("Last completed course step") + ylab("Frequency of unenrollments") +
  labs(fill = "Reason for unenrollment") +
  ggtitle("Frequency of leaving following completion of course steps")

#str(unenrolledFeedback)


