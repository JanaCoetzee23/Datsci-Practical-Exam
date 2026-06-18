# Calculates average and median movie duration by country, to compare 
# typical movie length across the selected countries.

Country_Duration_Summary <- function(df_movies){
  df_movies %>% 
    filter(!is.na(Duration_Mins)) %>% 
    group_by(country) %>% 
    summarise(Avg_Duration = mean(Duration_Mins), 
              Median_Duration = median(Duration_Mins), 
              N = n()) %>% 
    ungroup() %>% 
    arrange(desc(Avg_Duration))
}