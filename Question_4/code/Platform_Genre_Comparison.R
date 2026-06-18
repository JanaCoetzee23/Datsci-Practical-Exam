# Compares the percentage share of Drama, Comedy and Documentary genres 
# between Netflix and HBO, since raw counts aren't directly comparable given 
# the platforms have different total catalogue sizes.

Platform_Genre_Comparison <- function(Netflix_Genres, HBO_Genres, Movie_Info, HBO_titles){
  netflix_total <- nrow(Movie_Info)
  hbo_total <- nrow(HBO_titles)
  
  GenreList <- c("drama", "comedy", "documentary")
  
  bind_rows(
    Netflix_Genres %>% filter(Genre_Clean %in% GenreList) %>% 
      count(Genre_Clean) %>% mutate(Pct = n / netflix_total, Platform = "Netflix"),
    HBO_Genres %>% filter(Genre_Clean %in% GenreList) %>% 
      count(Genre_Clean) %>% mutate(Pct = n / hbo_total, Platform = "HBO")
  )
}
