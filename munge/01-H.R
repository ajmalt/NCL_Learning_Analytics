# Preprocessing script 01-H
# Video stats data
#str(cyber.security.7.video.stats) # check structure and identify date columns
#summary(cyber.security.7.video.stats) # gain familiarity with general properties of the data
#View(cyber.security.7.video.stats) # view data; gain familiarity


#Assign CourseID
cyber.security.3.video.stats$courseID <- 3
cyber.security.4.video.stats$courseID <- 4
cyber.security.5.video.stats$courseID <- 5
cyber.security.6.video.stats$courseID <- 6
cyber.security.7.video.stats$courseID <- 7


#Merge datasets
rawVideoStats <- rbind(cyber.security.3.video.stats, cyber.security.4.video.stats, cyber.security.5.video.stats, 
                       cyber.security.6.video.stats, cyber.security.7.video.stats)


#Conversion of columns to factors
rawVideoStats$courseID <- factor(rawVideoStats$courseID)
rawVideoStats$step_position <- factor(rawVideoStats$step_position)
#str(rawVideoStats)


#Create geographic video dataset
geographicVidData <- melt(data = rawVideoStats, id.vars = c("courseID", "step_position", "title"), 
                          measure.vars = c("europe_views_percentage", "oceania_views_percentage", "asia_views_percentage", 
                                           "north_america_views_percentage", "south_america_views_percentage", 
                                           "africa_views_percentage", "antarctica_views_percentage"),
                          value.name = "views_percentage", variable.name = "region") #melt data to create new dataset
geographicVidData$region <- gsub("europe_views_percentage", "Europe", geographicVidData$region)
geographicVidData$region <- gsub("oceania_views_percentage", "Oceania", geographicVidData$region)
geographicVidData$region <- gsub("asia_views_percentage", "Asia", geographicVidData$region)
geographicVidData$region <- gsub("north_america_views_percentage", "North America", geographicVidData$region)
geographicVidData$region <- gsub("south_america_views_percentage", "South America", geographicVidData$region)
geographicVidData$region <- gsub("africa_views_percentage", "Africa", geographicVidData$region)
geographicVidData$region <- gsub("antarctica_views_percentage", "Antartica", geographicVidData$region)
geographicVidData$region <- factor(geographicVidData$region)
#levels(geographicVidData$region) #quick check
#str(geographicVidData) #quick check
#View(geographicVidData) #quick check


#Create device video dataset
deviceVidData <- melt(data = rawVideoStats, id.vars = c("courseID", "step_position", "title"), 
                      measure.vars = c("desktop_device_percentage", "mobile_device_percentage", "tv_device_percentage", 
                                       "tablet_device_percentage", "unknown_device_percentage"),
                      value.name = "device_use_percentage", variable.name = "device") #melt data to create new dataset
deviceVidData$device <- gsub("desktop_device_percentage","Desktop", deviceVidData$device)
deviceVidData$device <- gsub("mobile_device_percentage","Mobile", deviceVidData$device)
deviceVidData$device <- gsub("tv_device_percentage","TV", deviceVidData$device)
deviceVidData$device <- gsub("tablet_device_percentage","Tablet", deviceVidData$device)
deviceVidData$device <- gsub("unknown_device_percentage","Unknown", deviceVidData$device)
deviceVidData$device <- factor(deviceVidData$device)
#levels(deviceVidData$device) #quick check
#str(deviceVidData) #quick check
#View(deviceVidData) #quick check


#Create viewing duration dataset
viewDurData <- melt(data = rawVideoStats, id.vars = c("courseID", "step_position", "title"),
                    measure.vars = c("viewed_five_percent", "viewed_ten_percent", "viewed_twentyfive_percent", 
                                     "viewed_fifty_percent", "viewed_seventyfive_percent", "viewed_ninetyfive_percent", 
                                     "viewed_onehundred_percent"),
                    value.name = "viewed_duration_percentage", variable.name = "duration_percentage") #melt data to create new dataset
viewDurData$duration_percentage <- gsub("viewed_five_percent", "5", viewDurData$duration_percentage)
viewDurData$duration_percentage <- gsub("viewed_ten_percent", "10", viewDurData$duration_percentage)
viewDurData$duration_percentage <- gsub("viewed_twentyfive_percent", "25", viewDurData$duration_percentage)
viewDurData$duration_percentage <- gsub("viewed_fifty_percent", "50", viewDurData$duration_percentage)
viewDurData$duration_percentage <- gsub("viewed_seventyfive_percent", "75", viewDurData$duration_percentage)
viewDurData$duration_percentage <- gsub("viewed_ninetyfive_percent", "95", viewDurData$duration_percentage)
viewDurData$duration_percentage <- gsub("viewed_onehundred_percent", "100", viewDurData$duration_percentage)
viewDurData$duration_percentage <- as.integer(viewDurData$duration_percentage)
#summary(viewDurData$duration_percentage) #quick check
#str(viewDurData) #quick check
#summary(viewDurData) #quick check
#View(viewDurData) #quick check


#remove redundant datasets
rm(cyber.security.3.video.stats, cyber.security.4.video.stats, cyber.security.5.video.stats, 
   cyber.security.6.video.stats, cyber.security.7.video.stats)