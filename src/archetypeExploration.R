#Archeype analysis and exploration
#str(archetypeData) #check data structure

#do I need to exclude potential staff members from the dataset?

#Plot 1: frequency of archetypes (aggregated over all course runs)
ggplot(data = archetypeData, aes(x = archetype, fill = archetype)) +
  geom_bar() +
  xlab("Archetype") + ylab("Frequency") +
  ggtitle("Aggregated archetype frequency (all course runs)") +
  theme(legend.position = "none")

#Plot 2: facets to display frequency of archetypes by courseID
ggplot(data = archetypeData, aes(x = archetype, fill = archetype)) +
  geom_bar() +
  ylim(0,70) +
  facet_grid(courseID~.) +
  xlab("Archetype") + ylab("Frequency") +
  ggtitle("Archetype frequency by course run") +
  theme(legend.position = "none")

#Plot 3: facets to display frequency of archetypes across courseID by archetype
ggplot(data = archetypeData, aes(x = courseID, fill = archetype)) +
  geom_bar() +
  facet_grid(archetype~.) +
  xlab("Course Run") + ylab("Frequency of each Archetype") +
  ggtitle("Archetype frequency across course runs") +
  theme(legend.position = "none")
#Is this raising he question of how you can get more people to actually take the personality test?


#to plot x and y axes we need to have two variants - what data can open this possibility? Time series data?


#BOXPLOTS: what data would work with boxplots? the question/answer data - break down by archetype once the data has been joined appropriately? Further breakdowns by question and by run of course?
#Or break down by course run?



#1. Archetype analysis - are certain archetypes more or less likely to drop out?

#what other datasets can the archetypes be joined with?
#question_response
#leaving survey
#enrollment
#activity