# For each year and gender, return the top 25 most popular names 
# (by total Count), ranked from most to least popular.

Top_25_Names <- function(National_Names, Yr, Sex){
  National_Names %>% 
    filter(Year == Yr, Gender == Sex) %>% 
    arrange(desc(Count)) %>% 
    head(25) %>% 
    mutate(Rank = row_number()) %>% 
    select(Name, Rank)
}