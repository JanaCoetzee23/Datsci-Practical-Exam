# Plots average IMDb score by country, with point size showing sample 
# size, to compare ratings while making clear which countries have more 
# or less reliable averages.

Plot_Country_Scores <- function(df_movies_scored){
  dfp <- Country_Score_Summary(df_movies_scored)
  
  order <- dfp %>% arrange(Avg_IMDB) %>% pull(country)
  dfp <- dfp %>% plot_orderset(., Column = "country", Order = order)
  
  dfp %>% 
    ggplot() +
    geom_segment(aes(x = country, xend = country, y = 5, yend = Avg_IMDB), 
                 linewidth = 1.2, color = "darkgreen", alpha = 0.7) +
    geom_point(aes(country, Avg_IMDB, size = N), color = "steelblue", alpha = 0.8) +
    coord_flip() +
    theme_bw() +
    labs(title = "Average IMDb Score by Country",
         subtitle = "Point size reflects number of rated movies in the sample",
         x = "", y = "Average IMDb Score", size = "N Movies")
}