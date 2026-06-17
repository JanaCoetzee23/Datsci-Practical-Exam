# Identifies large year-on-year jumps in popularity for a given name,
# calculated as Count divided by the previous year's Count. A high ratio
# indicates a sudden surge in popularity, often linked to a cultural event
# (TV show, song, movie) that year.

Name_Spike_Detector <- function(National_Names, NameSel, Sex){
  National_Names %>% 
    filter(Name == NameSel, Gender == Sex) %>% 
    arrange(Year) %>% 
    mutate(Spike_Ratio = Count / lag(Count)) %>% 
    filter(!is.na(Spike_Ratio)) %>% 
    arrange(desc(Spike_Ratio))
}