# Calculates default rate and sample size by state, for resolved 36-month 
# loans only. Requires a minimum number of loans per state to avoid small, 
# unreliable samples skewing the comparison.

State_Default_Rates <- function(Loan_Credit, Min_Loans = 100){
  Loan_Credit %>% 
    filter(!is.na(Is_Default), term == "36 months") %>% 
    group_by(addr_state) %>% 
    summarise(Default_Rate = mean(Is_Default), N = n()) %>% 
    ungroup() %>% 
    filter(N >= Min_Loans) %>% 
    arrange(desc(Default_Rate))
}