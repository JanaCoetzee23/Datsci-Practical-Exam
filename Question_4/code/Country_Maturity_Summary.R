# Summarises the percentage of movies in each maturity tier, by country.

Country_Maturity_Summary <- function(df_movies){
  Simplify_Rating(df_movies) %>% 
    count(country, Maturity_Tier) %>% 
    group_by(country) %>% 
    mutate(Pct = n / sum(n)) %>% 
    ungroup()
}