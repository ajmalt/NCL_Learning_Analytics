#Archeype analysis and exploration
str(archetypeData)

#do I need to exclude potential staff members from the dataset?

#Plot 1: frequency of archetypes
ggplot(data = archetypeData, aes(x = archetype, fill = archetype)) +
  geom_bar() +


#Plot 2: facets to display frequency by courseID




#1. Archetype analysis - are certain archetypes more or less likely to drop out?

#what other datasets can the archetypes be joined with?
#question_response
#leaving survey
#enrollment
#activity

#Issue here - think about what you want to acheieve and how to manipulate ggplot into doing it...
ggplot(data = viewDurData, aes(x=count(duration_percentage), y=viewed_duration, 
                               colour = courseID)) +
  geom_line()
str(viewDurData)
