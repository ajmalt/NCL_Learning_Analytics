#Initial exploration of enrollment data
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