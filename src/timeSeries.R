#unenrollments - Interesting, so people from the first run of the course are unenrolled up to two years after a lot of their coursemates
initialPlot <- qplot(data = enrollmentData, x = unenrolled_at, fill = courseID)

#broken down by course ID
courseBreakdown <- ggplot(data = unenrollmentSubset, aes(x = unenrolled_at, fill = courseID)) +
  geom_histogram() +
  facet_grid(courseID~.) +
  xlab("Date unenrolled") + ylab("Frequency") +
  ggtitle("Unenrollment over time by course run") +
  theme(legend.position = "none")


#1. Archetypes
archetypeSubset <- unenrollmentSubset[complete.cases(unenrollmentSubset[,"archetype"]),]
ggplot(data = archetypeSubset, aes(x = unenrolled_at, fill = courseID)) +
  geom_histogram() +
  facet_grid(courseID~.~archetype) +
  xlab("Date unenrolled") + ylab("Frequency") +
  ggtitle("Unenrollment over time by archetype and course run") +
  theme(legend.position = "none")


#2. Gender
genderSubset <- unenrollmentSubset[complete.cases(unenrollmentSubset[,"gender"]),]
genderPlot <- ggplot(data = genderSubset, aes(x = unenrolled_at, fill = courseID)) +
  geom_histogram() +
  facet_grid(courseID~.~gender) +
  xlab("Date unenrolled") + ylab("Frequency") +
  ggtitle("Unenrollment over time by gender and course run") +
  theme(legend.position = "none")


#3. age #CAN THESE BE REORDERED?
ageSubset <- unenrollmentSubset[complete.cases(unenrollmentSubset[,"age_range"]),]
agePlot <- ggplot(data = ageSubset, aes(x = unenrolled_at, fill = courseID)) +
  geom_histogram() +
  facet_grid(courseID~.~age_range) +
  xlab("Date unenrolled") + ylab("Frequency") +
  ggtitle("Unenrollment over time by age bracket and course run") +
  theme(legend.position = "none")


#4. sector employed - THIS IS A CLUSTERFUCK - PICK TOP FIVE AREAS OR SOMETHING
#ggplot(data = unenrollmentSubset, aes(x = unenrolled_at, fill = courseID)) +
  #geom_histogram() +
  #facet_grid(courseID~.~employment_area) +
  #xlab("Date unenrolled") + ylab("Frequency") +
  #ggtitle("Unenrollment over time by sector of employment and course run") +
  #theme(legend.position = "none")


#5. employment status
#ggplot(data = unenrollmentSubset, aes(x = unenrolled_at, fill = courseID)) +
  #geom_histogram() +
  #facet_grid(courseID~.~employment_status) +
  #xlab("Date unenrolled") + ylab("Frequency") +
  #ggtitle("Unenrollment over time by employment status and course run") +
  #theme(legend.position = "none")


#6. detected_country # COMPLETELY USELESS - PICK TOP 5 COUNTRIES
#ggplot(data = unenrollmentSubset, aes(x = unenrolled_at, fill = courseID)) +
  #geom_histogram() +
  #facet_grid(courseID~.~detected_country) +
  #xlab("Date unenrolled") + ylab("Frequency") +
  #ggtitle("Unenrollment over time by country and course run") +
  #theme(legend.position = "none")


#7. highest_education_level #ALTER LEVELS TO MAKE THEM MORE PLEASING? CAN THIS BE DONE WITH THEMES
educationSubset <- unenrollmentSubset[complete.cases(unenrollmentSubset[,"highest_education_level"]),]
ggplot(data = educationSubset, aes(x = unenrolled_at, fill = courseID)) +
  geom_histogram() +
  facet_grid(courseID~.~highest_education_level) +
  xlab("Date unenrolled") + ylab("Frequency") +
  ggtitle("Unenrollment over time by education level and course run") +
  theme(legend.position = "none")


#Course duration analysis
durationPlot <- ggplot(data = unenrollmentSubset, aes(x=courseID, y=duration, colour = courseID)) +
  geom_jitter() +
  geom_boxplot(size = 1.2, colour = "brown", alpha = 0.3) +
  xlab("Course run") + ylab("Duration enrolled (weeks)") +
  ggtitle("Durations from enrollment to unenrollment by course run") +
  theme(legend.position = "none")


#Jitter/Box: Duration enrolled, reason for leaving, and last completed week
reasonLeaving <- ggplot(data = unenrolledFeedback, aes(x = leaving_reason, y = duration, colour = last_completed_week_number)) +
  geom_jitter(size=2) +
  geom_boxplot(size = 1.2, colour = "brown", alpha = 0.3) +
  xlab("Reason for leaving") + ylab("Duration enrolled (weeks)") +
  ggtitle("Duration enrolled by reason given for leaving") +
  theme(legend.position = "top")


#Bar chart: Freqencies of reasons for leaving by last completed week, by course run
ggplot(data = unenrolledFeedback, aes(x = leaving_reason, fill = last_completed_week_number)) +
  geom_bar() +
  facet_grid(courseID~.) +
  xlab("Reason for leaving") + ylab("Frequency") +
  labs (fill = "Last completed week") +
  ggtitle("Frequencies of reasons for leaving by last completed week number")


#Bar chart: Freqencies of reasons for leaving by last completed week, by course run
ggplot(data = unenrolledFeedback, aes(x = leaving_reason, fill = last_completed_week_number)) +
  geom_bar() +
  facet_grid(courseID~.) +
  xlab("Reason for leaving") + ylab("Frequency") +
  labs (fill = "Last completed week") +
  ggtitle("Frequencies of reasons for leaving by last completed week number")


#weeks completed, by leaving reason
ggplot(data = unenrolledFeedback, aes(x = last_completed_week_number, fill=leaving_reason)) +
  geom_bar()


#steps completed, by leaving reason
stepsCompleted <- ggplot(data = unenrolledFeedback, aes(x = last_completed_step, fill=leaving_reason)) +
  geom_bar() +
  theme(legend.position = "top")
