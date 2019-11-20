# Preprocessing script 01-A
# Archetype data
rm(cyber.security.1.archetype.survey.responses, cyber.security.2.archetype.survey.responses) #remove empty datasets

#add courseID to datasets
cyber.security.3.archetype.survey.responses$courseID <- 3
cyber.security.4.archetype.survey.responses$courseID <- 4
cyber.security.5.archetype.survey.responses$courseID <- 5
cyber.security.6.archetype.survey.responses$courseID <- 6
cyber.security.7.archetype.survey.responses$courseID <- 7

#merge archetype datasets
archetypeData <- rbind(cyber.security.3.archetype.survey.responses, cyber.security.4.archetype.survey.responses, cyber.security.5.archetype.survey.responses,
                       cyber.security.6.archetype.survey.responses,cyber.security.7.archetype.survey.responses)
#View(archetypeData)

#remove redundant datasets
rm(cyber.security.3.archetype.survey.responses, cyber.security.4.archetype.survey.responses, cyber.security.5.archetype.survey.responses,
      cyber.security.6.archetype.survey.responses,cyber.security.7.archetype.survey.responses)