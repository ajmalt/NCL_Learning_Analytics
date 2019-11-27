# Preprocessing script 01-B
# Enrollment data
#str(cyber.security.1.enrolments) # check structure and identify date columns

#add courseID columns - ideally should be a loop with the merge to account for arbitrary numbers of rows/files
cyber.security.1.enrolments$courseID <- 1
cyber.security.2.enrolments$courseID <- 2
cyber.security.3.enrolments$courseID <- 3
cyber.security.4.enrolments$courseID <- 4
cyber.security.5.enrolments$courseID <- 5
cyber.security.6.enrolments$courseID <- 6
cyber.security.7.enrolments$courseID <- 7


#merge datasets
enrollmentData <- rbind(cyber.security.1.enrolments, cyber.security.2.enrolments, cyber.security.3.enrolments, cyber.security.4.enrolments, 
                        cyber.security.5.enrolments, cyber.security.6.enrolments, cyber.security.7.enrolments)
#summary(enrollmentData)
#str(enrollmentData)


#convert CourseID from integer to factor
enrollmentData$courseID <- factor(enrollmentData$courseID)
#levels(enrollmentData$courseID)


#replace missing values to NA and re-convert to factor to ensure correct level values in the factors
enrollmentData$gender <- as.factor(as.character(na_if(enrollmentData$gender, "Unknown")))
enrollmentData$country <- as.factor(as.character(na_if(enrollmentData$country, "Unknown")))
enrollmentData$age_range <- as.factor(as.character(na_if(enrollmentData$age_range, "Unknown")))
enrollmentData$highest_education_level <- as.factor(as.character(na_if(enrollmentData$highest_education_level, "Unknown")))
enrollmentData$employment_status <- as.factor(as.character(na_if(enrollmentData$employment_status, "Unknown")))
enrollmentData$employment_area <- as.factor(as.character(na_if(enrollmentData$employment_area, "Unknown")))
enrollmentData$detected_country <- as.factor(as.character(na_if(enrollmentData$detected_country, "--")))
#levels(enrollmentData$detected_country) #quick check
#str(enrollmentData) #quick check


#Conversion of Factor Columns to Date Columns
#?POSIXct #guidance for POSIXct
enrollmentData$enrolled_at <- as.POSIXct(enrollmentData$enrolled_at, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")
enrollmentData$unenrolled_at <- as.POSIXct(enrollmentData$unenrolled_at, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")
enrollmentData$fully_participated_at <- as.POSIXct(enrollmentData$fully_participated_at, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")
enrollmentData$purchased_statement_at <- as.POSIXct(enrollmentData$purchased_statement_at, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")
#str(enrollmentData) #quick check


#remove redundant datasets
rm(cyber.security.1.enrolments, cyber.security.2.enrolments, cyber.security.3.enrolments, cyber.security.4.enrolments, cyber.security.5.enrolments,cyber.security.6.enrolments, cyber.security.7.enrolments)