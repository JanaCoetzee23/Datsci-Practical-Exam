# Summarises the most common content rating (e.g. PG-13, TV-MA) for each 
# selected country, to compare typical content classifications.

Country_Rating_Summary <- function(df_movies){
  df_movies %>% 
    filter(!is.na(rating), !grepl("min", rating)) %>% 
    count(country, rating) %>% 
    group_by(country) %>% 
    mutate(Pct = n / sum(n)) %>% 
    ungroup() %>% 
    arrange(country, desc(Pct))
}