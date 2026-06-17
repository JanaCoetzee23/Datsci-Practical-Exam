# Checks whether a given artist name appears in the Billboard charts, 
# and if so, in which years and how many weeks. Used to cross-reference 
# baby name spikes against celebrity/artist chart presence in the same year.

Check_Billboard_Presence <- function(Top_100_Billboard, ArtistName){
  Top_100_Billboard %>% 
    filter(grepl(ArtistName, artist, ignore.case = TRUE)) %>% 
    mutate(Year = year(date)) %>% 
    group_by(Year) %>% 
    summarise(N_Weeks = n()) %>% 
    ungroup() %>% 
    arrange(Year) %>% 
    mutate(Artist_Searched = ArtistName)
}