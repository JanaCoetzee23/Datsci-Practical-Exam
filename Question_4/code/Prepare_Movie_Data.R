# Cleans the duration column from text (e.g. "90 min") to a numeric value 
# in minutes, and filters Movie_Info to the selected countries for 
# comparison.

Prepare_Movie_Data <- function(Movie_Info, CountryList){
  Movie_Info %>% 
    mutate(Duration_Mins = parse_number(duration)) %>% 
    filter(country %in% CountryList)
}