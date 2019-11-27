#Initial exploration of time series data
#enrollments - note how people on the first run of the course continue to enroll in the first run on subsequent runs - why? Are these staff?
qplot(data = enrollmentData, x = enrolled_at, fill = courseID)

#unenrollments - Interesting, so people from the first run of the course are unenrolled up to two years after a lot of their coursemates
qplot(data = enrollmentData, x = unenrolled_at, fill = courseID)
#explore with facets and see if there is a pattern when breaking down...

#fully_participated_at - WTF does this mean?
qplot(data = enrollmentData, x = fully_participated_at, fill = courseID)
#does this mean completion?

#purchased_statement_at
qplot(data = enrollmentData, x = purchased_statement_at, fill = courseID)
#calculate conversion rate?




#More detailed analysis of unenrollment
unenrollmentSubset <- enrollmentData[complete.cases(enrollmentData[,4]),]

#broken down by course ID
ggplot(data = unenrollmentSubset, aes(x = unenrolled_at, fill = courseID)) +
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
ggplot(data = genderSubset, aes(x = unenrolled_at, fill = courseID)) +
  geom_histogram() +
  facet_grid(courseID~.~gender) +
  xlab("Date unenrolled") + ylab("Frequency") +
  ggtitle("Unenrollment over time by gender and course run") +
  theme(legend.position = "none")


#3. age #CAN THESE BE REORDERED?
ageSubset <- unenrollmentSubset[complete.cases(unenrollmentSubset[,"age_range"]),]
ggplot(data = ageSubset, aes(x = unenrolled_at, fill = courseID)) +
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


#Course 'duration' analysis
unenrollmentSubset$enrolledInterval <- as.duration(unenrollmentSubset$enrolled_at %--% unenrollmentSubset$unenrolled_at) #calculate course duration
unenrollmentSubset$duration <- as.duration(unenrollmentSubset$enrolledInterval) / dweeks(1) #calculate course duration in weeks

ggplot(data = unenrollmentSubset, aes(x=courseID, y=duration, colour = courseID)) +
  geom_jitter() +
  geom_boxplot(size = 1.2, colour = "brown", alpha = 0.3) +
  xlab("Course run") + ylab("Duration enrolled (weeks)") +
  ggtitle("Durations from enrollment to unenrollment by course run") +
  theme(legend.position = "none")


#CREATE NEW DATA FRAME SHOWING THE 


#RECOMMENDATIONs - WHAT ARE THE REASONS FOR DROPPING OUT - MOSTLY TIME? MOSTLY TIME AT THE RELEVANT POINT? can this bit be split apart?







#Old crap - delete when done

#Obtain unique date values from enrollment data
a <- unique(enrollmentData$enrollment_date)
b <- unique(enrollmentData$unenrollment_date)
c <- unique(enrollmentData$fully_participated_date)
d <- unique(enrollmentData$purchased_statement_date)

significantDates <- c(a,b,c,d)
significantDates <- unique(significantDates)
#class(significantDates) #quick check

rm(a, b, c, d)

#count occurence of significant dates in enrollment data
#count enrollments on each significant date
enrollments <- c()
for (sigDate in significantDates){
  x <- sum(enrollmentData$enrollment_date == sigDate)
  enrollments <- c(enrollments, x)
}

qplot(x= significantDates, y = enrollments, geom = "line")

#count unenrollments on signficant dates
unenrollments <- NULL
x <- NULL
for (sigDate in significantDates){
  x <- sum(enrollmentData$unenrollment_date == sigDate)
  #unenrollments <- c(unenrollments, x)
  print(x)
}
print(unenrollments)

qplot(x= significantDates, y = unenrollments)

rm(x, sigDate)


newDF <- cbind.data.frame(significantDates, enrollments)

str(newDF)

print(newDF[1,1])
