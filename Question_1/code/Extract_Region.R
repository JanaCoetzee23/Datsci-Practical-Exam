# Searches origin_1 and origin_2 for any known coffee-growing country 
# (see Coffee_Origin_List). If a match is found in either column, that 
# becomes the coffee's "Region". origin_1 is checked first, with origin_2 
# used as a backup. Known misspellings are standardised to their correct 
# country name. Rows with no match (e.g. only a district/zone, or a 
# continent like "Africa") are labelled "Other/Unclear".

Extract_Region <- function(Coffee){
  
  Origin_Countries <- Coffee_Origin_List()
  
  Coffee <- Coffee %>% 
    rowwise() %>% 
    mutate(
      Region_From_O1 = Origin_Countries[
        sapply(Origin_Countries, function(c) grepl(c, origin_1))
      ][1],
      Region_From_O2 = Origin_Countries[
        sapply(Origin_Countries, function(c) grepl(c, origin_2))
      ][1]
    ) %>% 
    ungroup() %>% 
    mutate(Region = coalesce(Region_From_O1, Region_From_O2, "Other/Unclear")) %>% 
    # Standardise misspellings to one consistent country name:
    mutate(Region = case_when(
      Region == "Ethopia" ~ "Ethiopia",
      Region == "Columbia" ~ "Colombia",
      TRUE ~ Region
    )) %>% 
    select(-Region_From_O1, -Region_From_O2)
  
  Coffee
}