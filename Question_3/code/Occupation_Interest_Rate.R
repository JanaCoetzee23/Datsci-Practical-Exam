# Calculates average interest rate by occupation group, to test whether 
# occupation appears to influence the interest rate charged.

Occupation_Interest_Rate <- function(Loan_Credit){
  Loan_Credit %>% 
    filter(Occupation_Group != "Not Provided") %>% 
    group_by(Occupation_Group) %>% 
    summarise(Avg_Int_Rate = mean(int_rate, na.rm = TRUE), N = n()) %>% 
    ungroup() %>% 
    arrange(Avg_Int_Rate)
}