# Compare each Year's top 25 names to (Year + N_Ahead)'s top 25 names, for a 
# given gender. Calculates the Spearman rank correlation between the two 
# years' rankings, using only names that appear in both years' top 25 
# (since correlation requires paired observations).

Persistence_Correlation <- function(National_Names, Yr, Sex, N_Ahead = 3){
  
  Year1 <- Top_25_Names(National_Names, Yr = Yr, Sex = Sex)
  Year2 <- Top_25_Names(National_Names, Yr = Yr + N_Ahead, Sex = Sex)
  
  Joined <- inner_join(Year1, Year2, by = "Name", suffix = c("_Y1", "_Y2"))
  
  # Need at least a few overlapping names to calculate a meaningful correlation:
  if(nrow(Joined) < 3) return(NULL)
  
  Corr <- cor(Joined$Rank_Y1, Joined$Rank_Y2, method = "spearman")
  
  tibble(Year = Yr, Gender = Sex, N_Ahead = N_Ahead, 
         N_Overlap = nrow(Joined), Correlation = Corr)
}