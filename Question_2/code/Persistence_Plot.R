# Plots the Spearman rank correlation of top 25 names (vs 3 years later) 
# over time, split by gender, to visually assess whether naming persistence 
# has weakened in recent decades.

Persistence_Plot <- function(Persistence_Results){
  Persistence_Results %>% 
    ggplot() +
    geom_line(aes(Year, Correlation, color = Gender), size = 1) +
    geom_vline(xintercept = 1990, linetype = "dashed", color = "grey40") +
    theme_bw() +
    labs(title = "Naming Persistence Over Time",
         subtitle = "Spearman correlation: top 25 names vs. top 25 three years later",
         x = "", y = "Rank Correlation",
         caption = "Dashed line marks 1990") +
    theme(legend.position = "bottom")
}