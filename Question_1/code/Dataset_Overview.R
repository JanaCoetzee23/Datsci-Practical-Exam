Dataset_Overview <- function(Coffee){
  Coffee %>% 
    summarise(
      N_Coffees = n(),
      N_Roasters = n_distinct(roaster),
      N_Countries = n_distinct(loc_country),
      Avg_Rating = mean(Rating, na.rm = TRUE),
      Avg_Cost = mean(Cost_Per_100g, na.rm = TRUE),
      Min_Cost = min(Cost_Per_100g, na.rm = TRUE),
      Max_Cost = max(Cost_Per_100g, na.rm = TRUE)
    )
}