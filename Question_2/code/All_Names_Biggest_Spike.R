# Scans all names (for a given gender) for their single biggest 
# year-on-year spike in popularity, requiring a minimum count threshold 
# to avoid noise from tiny, statistically meaningless name counts.

All_Names_Biggest_Spike <- function(National_Names, Sex, Min_Count = 100){
  
  National_Names %>% 
    filter(Gender == Sex) %>% 
    arrange(Name, Year) %>% 
    group_by(Name) %>% 
    mutate(Spike_Ratio = Count / lag(Count)) %>% 
    ungroup() %>% 
    filter(!is.na(Spike_Ratio), Count >= Min_Count) %>% 
    group_by(Name) %>% 
    filter(Spike_Ratio == max(Spike_Ratio)) %>% 
    ungroup() %>% 
    arrange(desc(Spike_Ratio))
  
}