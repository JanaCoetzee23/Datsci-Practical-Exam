# Builds a bubble plot showing selected names' popularity (Count) across 
# years, with bubble size reflecting Count. Names linked to verified 
# cultural/celebrity events are highlighted in a different colour to 
# distinguish them from typical steady top performers.

Bubble_Plot_Names <- function(National_Names, NamesSelected, HighlightNames, Sex){
  
  dfp <- National_Names %>% 
    filter(Name %in% NamesSelected, Gender == Sex) %>% 
    group_by(Name) %>% 
    filter(Count == max(Count)) %>%  # Only the peak year per name
    ungroup() %>% 
    mutate(Highlight = ifelse(Name %in% HighlightNames, "Cultural Spike", "Steady Popular Name"))
  
  dfp %>% 
    ggplot() +
    geom_point(aes(x = Name, y = Year, size = Count, color = Highlight), alpha = 0.7) +
    scale_size_area(max_size = 30) +
    scale_color_manual(values = c("Cultural Spike" = "darkred", "Steady Popular Name" = "steelblue")) +
    theme_bw() +
    labs(title = "Peak Year of Popularity for Selected Names",
         subtitle = "Bubble size reflects number of babies given that name in its peak year",
         x = "", y = "", size = "Peak Count", color = "") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1),
          legend.position = "bottom")
}