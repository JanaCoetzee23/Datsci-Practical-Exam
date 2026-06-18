# Groups detailed content ratings into three broad maturity tiers, 
# to allow a cleaner cross-country comparison than the full set of 
# specific rating categories would allow.

Simplify_Rating <- function(df_movies){
  df_movies %>% 
    filter(!is.na(rating), !grepl("min", rating)) %>% 
    mutate(Maturity_Tier = case_when(
      rating %in% c("G", "TV-G", "TV-Y", "TV-Y7", "TV-Y7-FV") ~ "General/Family",
      rating %in% c("PG", "TV-PG", "TV-14", "PG-13") ~ "Parental Guidance/Teen",
      rating %in% c("R", "TV-MA", "NC-17") ~ "Mature",
      TRUE ~ "Other/Unrated"
    ))
}