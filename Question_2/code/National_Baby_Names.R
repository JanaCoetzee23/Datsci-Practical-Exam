# Aggregates state-level baby name counts up to national totals,
# by Name, Year and Gender.

National_Baby_Names <- function(Baby_Names){
  Baby_Names %>% 
    group_by(Name, Year, Gender) %>% 
    summarise(Count = sum(Count, na.rm = TRUE)) %>% 
    ungroup()
}