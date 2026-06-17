# Plots the year-by-year count for a set of selected names, allowing 
# visual comparison of how their popularity has risen and fallen over time.

Name_Trend_Plot <- function(National_Names, NamesSelected, Sex){
  National_Names %>% 
    filter(Name %in% NamesSelected, Gender == Sex) %>% 
    ggplot() +
    geom_line(aes(Year, Count, color = Name), size = 1) +
    theme_bw() +
    labs(title = "Naming Trends Over Time",
         subtitle = "Selected names compared across the full time period",
         x = "", y = "Number of Babies", color = "") +
    theme(legend.position = "bottom")
}