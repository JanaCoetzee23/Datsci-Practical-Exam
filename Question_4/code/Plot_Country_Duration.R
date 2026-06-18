# Plots average movie duration by country, ordered from shortest to 
# longest, to visualise differences in typical movie length.

Plot_Country_Duration <- function(df_movies){
  dfp <- Country_Duration_Summary(df_movies)
  
  order <- dfp %>% arrange(Avg_Duration) %>% pull(country)
  dfp <- dfp %>% plot_orderset(., Column = "country", Order = order)
  
  dfp %>% 
    ggplot() +
    geom_bar(aes(country, Avg_Duration, fill = N), stat = "identity") +
    coord_flip() +
    theme_bw() +
    scale_fill_gradient(low = "lightblue", high = "darkblue") +
    labs(title = "Average Movie Duration by Country",
         subtitle = "India's films are notably longer than other countries in this sample",
         x = "", y = "Average Duration (minutes)", fill = "N Movies")
}