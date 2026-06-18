# Plots the breakdown of content maturity tiers by country as a stacked 
# bar chart, ordered by the percentage of Mature content, to compare 
# content maturity skew across countries.

Plot_Country_Maturity <- function(df_movies){
  dfp <- Country_Maturity_Summary(df_movies) %>% filter(Maturity_Tier != "Other/Unrated")
  
  order <- dfp %>% filter(Maturity_Tier == "Mature") %>% arrange(Pct) %>% pull(country)
  dfp <- dfp %>% plot_orderset(., Column = "country", Order = order)
  
  dfp %>% 
    ggplot() +
    geom_bar(aes(country, Pct, fill = Maturity_Tier), stat = "identity", position = "stack") +
    coord_flip() +
    theme_bw() +
    scale_y_continuous(labels = scales::percent_format()) +
    scale_fill_brewer(palette = "Dark2") +
    labs(title = "Content Maturity Breakdown by Country",
         subtitle = "Ordered by share of Mature-rated content",
         x = "", y = "Percentage of Movies", fill = "") +
    theme(legend.position = "bottom")
}