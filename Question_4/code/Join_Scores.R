# Joins IMDb and TMDB scores from Titles onto the country-filtered movie 
# data. Joining on title alone caused duplicate rows, since 52 titles in 
# Titles are not unique. Joining on title and release_year together resolves this, since 
# the combination reliably identifies the correct matching title. Only 
# titles found in both datasets will have scores; others will show as NA.

Join_Scores <- function(df_movies, Titles){
  left_join(df_movies, 
            Titles %>% select(title, release_year, imdb_score, imdb_votes, tmdb_score, tmdb_popularity), 
            by = c("title", "release_year"))
}