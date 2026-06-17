# Maps Persistence_Correlation across all available years and both genders,
# returning one row per year/gender combination showing how stable the 
# top 25 names were 3 years later.

All_Years_Persistence <- function(National_Names, N_Ahead = 3){
  
  Years <- National_Names %>% pull(Year) %>% unique() %>% sort()
  Genders <- c("F", "M")
  
  Combos <- expand_grid(Yr = Years, Sex = Genders)
  
  Result <- map2_df(Combos$Yr, Combos$Sex, 
                    ~Persistence_Correlation(National_Names, Yr = .x, Sex = .y, N_Ahead = N_Ahead))
  
  Result
}