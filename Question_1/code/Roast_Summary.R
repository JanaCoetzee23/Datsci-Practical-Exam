# Summarises average rating and average cost by roast strength,
# to help identify which roast level offers the best experience.
# Excludes the small number of NA roast entries.

Roast_Summary <- function(Coffee){
  Coffee %>% 
    filter(!is.na(roast)) %>% 
    group_by(roast) %>% 
    summarise(
      Avg_Rating = mean(Rating, na.rm = TRUE),
      Avg_Cost = mean(Cost_Per_100g, na.rm = TRUE),
      N_Coffees = n()
    ) %>% 
    ungroup() %>% 
    arrange(desc(Avg_Rating))
}