# Calculates average IMDb and TMDB scores by country, for movies that have 
# a matching score available.

Country_Score_Summary <- function(df_movies_scored){
  df_movies_scored %>% 
    filter(!is.na(imdb_score)) %>% 
    group_by(country) %>% 
    summarise(Avg_IMDB = mean(imdb_score, na.rm = TRUE), 
              Avg_TMDB = mean(tmdb_score, na.rm = TRUE),
              N = n()) %>% 
    ungroup() %>% 
    arrange(desc(Avg_IMDB))
}