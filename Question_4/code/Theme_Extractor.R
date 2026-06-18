# Checks how often a given theme word appears in movie descriptions, 
# per country. Returns the percentage of movies mentioning that word.

Theme_Extractor <- function(df_movies, ThemeWord){
  df_movies %>% 
    group_by(country) %>% 
    summarise(Pct_Mentioned = sum(grepl(ThemeWord, description, ignore.case = TRUE)) / n()) %>% 
    ungroup() %>% 
    mutate(Theme = ThemeWord)
}