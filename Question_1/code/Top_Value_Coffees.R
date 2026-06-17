# Calculates a simple value score (Rating per dollar spent per 100g).
# Higher values mean better quality relative to cost.
# Returns the top N coffees by this score, along with their region and roaster,
# so the entrepreneur can see specific actionable options.

Top_Value_Coffees <- function(Coffee, Top_N = 10){
  Coffee %>% 
    filter(Region != "Other/Unclear") %>% 
    mutate(Value_Score = Rating / Cost_Per_100g) %>% 
    arrange(desc(Value_Score)) %>% 
    select(name, roaster, Region, roast, Rating, Cost_Per_100g, Value_Score) %>% 
    head(Top_N)
}