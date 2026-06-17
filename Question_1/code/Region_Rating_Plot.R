# Plots average rating by region, ordered from lowest to highest, 
# with bar colour reflecting how many coffees were reviewed from that region 
# (giving a sense of how much data backs up each region's average).

Region_Rating_Plot <- function(Coffee){
  dfp <- Region_Rating_Summary(Coffee)
  
  order <- dfp %>% arrange(Avg_Rating) %>% pull(Region)
  dfp <- dfp %>% plot_orderset(., Column = "Region", Order = order)
  
  dfp %>% 
    ggplot() +
    geom_bar(aes(Region, Avg_Rating, fill = N_Coffees), stat = "identity") +
    coord_flip(ylim = c(85, max(dfp$Avg_Rating) + 1)) +
    theme_bw() +
    scale_fill_gradient(low = "lightblue", high = "darkblue") +
    labs(title = "Average Coffee Rating by Country of Origin", 
         subtitle = "Ethiopia is the strongest, best-supported choice (high rating, 313 reviews)",
         x = "", y = "Average Rating", fill = "N Coffees",
         caption = "Note: countries with very few reviews may be less reliable. Axis starts at 85 to highlight differences.")
}