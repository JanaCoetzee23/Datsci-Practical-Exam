# Plots the percentage share of Drama, Comedy and Documentary genres for 
# Netflix and HBO side by side, to compare how concentrated each 
# platform's catalogue is in these three major genres.

Plot_Platform_Genre <- function(Netflix_Genres, HBO_Genres, Movie_Info, HBO_titles){
  Platform_Genre_Comparison(Netflix_Genres, HBO_Genres, Movie_Info, HBO_titles) %>% 
    ggplot() +
    geom_bar(aes(Genre_Clean, Pct, fill = Platform), stat = "identity", position = "dodge") +
    theme_bw() +
    scale_y_continuous(labels = scales::percent_format()) +
    scale_fill_manual(values = c("Netflix" = "#E50914", "HBO" = "#5822B4")) +
    labs(title = "Drama, Comedy and Documentary Share: Netflix vs HBO",
         subtitle = "Comparing catalogue concentration across the two platforms",
         x = "", y = "Percentage of Catalogue", fill = "")
}