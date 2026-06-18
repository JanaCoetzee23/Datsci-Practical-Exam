# Plots the top theme words by mention percentage, faceted by country, 
# to compare which storytelling themes are most prominent in each 
# country's movie descriptions.

Plot_Theme_Comparison <- function(Theme_Results, CountryList){
  Theme_Results %>% 
    filter(country %in% CountryList) %>% 
    plot_orderset(., Column = "country", Order = CountryList) %>% 
    ggplot() +
    geom_bar(aes(Theme, Pct_Mentioned, fill = country), stat = "identity", position = "dodge") +
    facet_wrap(~country) +
    coord_flip() +
    theme_bw() +
    scale_y_continuous(labels = scales::percent_format()) +
    scale_fill_brewer(palette = "Dark2") +
    guides(fill = "none") +
    labs(title = "Movie Description Themes by Country",
         x = "", y = "Percentage of Movies Mentioning Theme")
}