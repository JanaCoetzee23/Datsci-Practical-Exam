# Splits Netflix's comma-separated genre string into individual genre tags,
# standardised to lowercase singular form for comparison with HBO.

Clean_Netflix_Genre <- function(Movie_Info){
  Movie_Info %>% 
    mutate(Genre_List = str_split(listed_in, ", ")) %>% 
    unnest(Genre_List) %>% 
    mutate(Genre_Clean = str_to_lower(Genre_List)) %>% 
    mutate(Genre_Clean = gsub("s$", "", Genre_Clean))
}