# Preprocessing script 01-B
# Enrollment data
#str(cyber.security.1.enrolments) # check structure and identify date columns

#add courseID columns
cyber.security.1.enrolments$courseID <- 1
cyber.security.2.enrolments$courseID <- 2
cyber.security.3.enrolments$courseID <- 3
cyber.security.4.enrolments$courseID <- 4
cyber.security.5.enrolments$courseID <- 5
cyber.security.6.enrolments$courseID <- 6
cyber.security.7.enrolments$courseID <- 7


#merge datasets
enrollmentData <- rbind(cyber.security.1.enrolments, cyber.security.2.enrolments, cyber.security.3.enrolments, cyber.security.4.enrolments, cyber.security.5.enrolments,
      cyber.security.6.enrolments, cyber.security.7.enrolments)
#summary(enrollmentData)
#str(enrollmentData)


#convert CourseID from integer to factor
enrollmentData$courseID <- factor(enrollmentData$courseID)
#levels(enrollmentData$courseID)


#replace missing values with NA
library(dplyr)
enrollmentData$unenrolled_at <- na_if(enrollmentData$unenrolled_at, "")
enrollmentData$fully_participated_at <- na_if(enrollmentData$fully_participated_at, "")
enrollmentData$purchased_statement_at <- na_if(enrollmentData$purchased_statement_at, "")
enrollmentData$gender <- na_if(enrollmentData$gender, "Unknown")
enrollmentData$country <- na_if(enrollmentData$country, "Unknown")
enrollmentData$age_range <- na_if(enrollmentData$age_range, "Unknown")
enrollmentData$highest_education_level <- na_if(enrollmentData$highest_education_level, "Unknown")
enrollmentData$employment_status <- na_if(enrollmentData$employment_status, "Unknown")
enrollmentData$employment_area <- na_if(enrollmentData$employment_area, "Unknown")
enrollmentData$detected_country <- na_if(enrollmentData$detected_country, "--")


#Create date columns from factor columns
#typeof(enrollmentData$enrolled_at)
#typeof(as.character(enrollmentData$enrolled_at))
enrollmentData$enrollment_date <- as.Date(as.character(enrollmentData$enrolled_at))
enrollmentData$unenrollment_date <- as.Date(as.character(enrollmentData$unenrolled_at))
enrollmentData$fully_participated_date <- as.Date(as.character(enrollmentData$fully_participated_at))
enrollmentData$purchased_statement_date <- as.Date(as.character(enrollmentData$purchased_statement_at))


#Huge amount of NA values - deal with by creating frames for each type of information for each particular analysis?


#remove redundant datasets
rm(cyber.security.1.enrolments, cyber.security.2.enrolments, cyber.security.3.enrolments, cyber.security.4.enrolments, cyber.security.5.enrolments,
   cyber.security.6.enrolments, cyber.security.7.enrolments)
