# Combines the three description columns into one text field per coffee,
# then checks for each keyword whether it appears in the combined description.
# Returns the average rating and percentage mentioning each keyword, comparing 
# coffees that mention the word vs those that do not, to see which words 
# are actually associated with higher ratings, rather than just common.

Keyword_Rating_Summary <- function(Coffee){
  
  Keywords <- Coffee_Keywords()
  
  Coffee_Text <- Coffee %>% 
    mutate(Full_Desc = paste(desc_1, desc_2, desc_3, sep = " "))
  
  Keyword_Summary <- function(Coffee_Text, Keyword){
    Coffee_Text %>% 
      mutate(Has_Keyword = grepl(Keyword, Full_Desc, ignore.case = TRUE)) %>% 
      group_by(Has_Keyword) %>% 
      summarise(Avg_Rating = mean(Rating, na.rm = TRUE), N = n()) %>% 
      ungroup() %>% 
      mutate(Keyword = Keyword, Pct_Mentioned = N / nrow(Coffee_Text) * 100) %>% 
      mutate(Has_Keyword = ifelse(Has_Keyword, "Mentions Word", "No Mention"))
  }
  
  Keywords %>% map_df(~Keyword_Summary(Coffee_Text, Keyword = .))
  
}