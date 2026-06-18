# Fixes irregular plurals left over from the simple gsub de-pluralization 
# in Clean_Netflix_Genre, which only handles regular "s" plurals correctly. 
# "Comedies" became "comedie" and "documentaries" became "documentarie", 
# so these are corrected here to match HBO's genre naming convention.

Fix_Netflix_Genre_Names <- function(Netflix_Genres){
  Netflix_Genres %>% 
    mutate(Genre_Clean = case_when(
      Genre_Clean == "comedie" ~ "comedy",
      Genre_Clean == "documentarie" ~ "documentary",
      TRUE ~ Genre_Clean
    ))
}