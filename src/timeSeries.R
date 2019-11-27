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
