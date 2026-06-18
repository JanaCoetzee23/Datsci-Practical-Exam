# HBO uses "documentation" where Netflix uses "documentary" for the same 
# genre concept. This standardises HBO's term to match, so the two 
# platforms can be compared on this genre too.

Align_HBO_Documentary <- function(HBO_Genres){
  HBO_Genres %>% 
    mutate(Genre_Clean = ifelse(Genre_Clean == "documentation", "documentary", Genre_Clean))
}