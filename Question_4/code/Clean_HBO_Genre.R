# Cleans HBO's list style genre string into individual genre tags.

Clean_HBO_Genre <- function(HBO_titles){
  HBO_titles %>% 
    mutate(Genre_List = str_extract_all(genres, "[a-z]+")) %>% 
    unnest(Genre_List) %>% 
    rename(Genre_Clean = Genre_List)
}