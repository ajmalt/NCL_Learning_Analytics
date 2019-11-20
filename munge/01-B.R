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


#remove redundant datasets
#rm(cyber.security.1.enrolments, cyber.security.2.enrolments, cyber.security.3.enrolments, cyber.security.4.enrolments, cyber.security.5.enrolments,
#   cyber.security.6.enrolments, cyber.security.7.enrolments)


#Create date columns from factors: enrolled_at; unenrolled_at; fully_participated_at; purchased_statement_at.
#typeof(enrollmentData$enrolled_at)
#typeof(as.character(enrollmentData$enrolled_at))
enrollmentData$enrollment_date <- as.Date(as.character(enrollmentData$enrolled_at))
View(enrollmentData)




#replace missing values with NA
library(dplyr)

enrollmentData$unenrolled_at <- na_if(enrollmentData$unenrolled_at, "")
enrollmentData$unenrolled_at


#Is the error here due to the empty cells?
enrollmentData$unenrolled_at
enrollmentData$unenrollment_date <- as.Date(as.character(enrollmentData$unenrolled_at))
enrollmentData$unenrolled_at[1]
#head(enrollmentData)
#str(enrollmentData)















#Huge amount of 'unknowns'. Create frame to filter unknowns.
