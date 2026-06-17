# Plots average rating by roast strength as a lollipop chart, 
# ordered from lowest to highest rating. Point size reflects how many 
# coffees were reviewed at that roast level (sample size context).

Roast_Plot <- function(Coffee){
  dfp <- Roast_Summary(Coffee)
  
  order <- dfp %>% arrange(Avg_Rating) %>% pull(roast)
  dfp <- dfp %>% plot_orderset(., Column = "roast", Order = order)
  
  dfp %>% 
    ggplot() +
    geom_segment(aes(x = roast, xend = roast, y = 85, yend = Avg_Rating), 
                 size = 1.2, color = "darkgreen", alpha = 0.7) +
    geom_point(aes(roast, Avg_Rating, size = N_Coffees), 
               color = "steelblue", alpha = 0.8) +
    theme_bw() +
    labs(title = "Average Rating by Roast Strength",
         subtitle = "Lighter roasts rate higher; ratings decline as roast strength increases",
         x = "", y = "Average Rating", size = "N Coffees",
         caption = "Note: Dark roast based on only 5 reviews - treat with caution")
  }