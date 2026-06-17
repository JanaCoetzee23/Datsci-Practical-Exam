# Highlights the two flavour-descriptor words from the wordcloud that showed 
# a meaningful rating difference between coffees that mention them and those 
# that don't ("balanced" and "velvety"). Most other surveyed words appeared 
# in 80-99% of all coffees and showed negligible differences, so are 
# excluded from this comparison as they carry no useful signal.

Keyword_Highlight_Plot <- function(Coffee){
  
  dfp <- Keyword_Rating_Summary(Coffee) %>% 
    filter(Keyword %in% c("balanced", "velvety"))
  
  dfp %>% 
    ggplot() +
    geom_bar(aes(Has_Keyword, Avg_Rating, fill = Has_Keyword), 
             stat = "identity", position = "dodge") +
    facet_wrap(~Keyword) +
    coord_cartesian(ylim = c(90, 94)) +
    theme_bw() +
    scale_fill_manual(values = c("Mentions Word" = "darkgreen", "No Mention" = "grey70")) +
    labs(title = "Rating Impact of Key Flavour Descriptors",
         subtitle = "'Balanced' links to higher ratings; 'velvety' links to lower ratings",
         x = "", y = "Average Rating", fill = "",
         caption = "Note: most other surveyed words appeared in 80-99% of coffees with negligible rating differences") +
    theme(legend.position = "bottom")
}