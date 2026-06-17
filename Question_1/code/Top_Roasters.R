# Identifies roasters with the strongest track record: requires a minimum 
# number of reviewed coffees (to avoid one-hit-wonders skewing results), 
# then ranks by average rating.

Top_Roasters <- function(Coffee, Min_Coffees = 3, Top_N = 10){
  Coffee %>% 
    group_by(roaster) %>% 
    summarise(
      Avg_Rating = mean(Rating, na.rm = TRUE),
      Avg_Cost = mean(Cost_Per_100g, na.rm = TRUE),
      N_Coffees = n()
    ) %>% 
    ungroup() %>% 
    filter(N_Coffees >= Min_Coffees) %>% 
    arrange(desc(Avg_Rating)) %>% 
    head(Top_N)
}