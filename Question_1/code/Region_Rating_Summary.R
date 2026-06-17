# Summarises average rating, average cost, and number of coffees per region,
# excluding "Other/Unclear" entries where origin could not be confidently 
# identified from the raw data.

Region_Rating_Summary <- function(Coffee){
  Coffee %>% 
    filter(Region != "Other/Unclear") %>% 
    group_by(Region) %>% 
    summarise(
      Avg_Rating = mean(Rating, na.rm = TRUE),
      Avg_Cost = mean(Cost_Per_100g, na.rm = TRUE),
      N_Coffees = n()
    ) %>% 
    ungroup() %>% 
    arrange(desc(Avg_Rating))
}