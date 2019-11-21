# Preprocessing script 01-G
# Team member data
#str(cyber.security.7.team.members) # check structure and identify date columns
#summary(cyber.security.7.team.members) # gain familiarity with general properties of the data

#Assign courseID
cyber.security.2.team.members$courseID <- 2
cyber.security.3.team.members$courseID <- 3
cyber.security.4.team.members$courseID <- 4
cyber.security.5.team.members$courseID <- 5
cyber.security.6.team.members$courseID <- 6
cyber.security.7.team.members$courseID <- 7


#Merge datasets
teamData <- rbind(cyber.security.2.team.members, cyber.security.3.team.members, cyber.security.4.team.members, 
                  cyber.security.5.team.members, cyber.security.6.team.members, cyber.security.7.team.members)
#View(teamData) #checking data


#Convert courseID to factor
teamData$courseID <- factor(teamData$courseID)


#Remove first name and last name columns (no need to retain due to anonymisation)
teamData$first_name <- NULL
teamData$last_name <- NULL
#str(teamData) #checking data structure

#Remove redundant datasets
rm(cyber.security.2.team.members, cyber.security.3.team.members, cyber.security.4.team.members, 
   cyber.security.5.team.members, cyber.security.6.team.members, cyber.security.7.team.members)