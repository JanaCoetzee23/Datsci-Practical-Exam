# Returns a curated table comparing average DTI and default rate for a 
# handful of states, to illustrate that similar DTI levels can carry very 
# different default risk depending on the state.

DTI_State_Comparison_Table <- function(Loan_Credit, StatesSelected){
  Loan_Credit %>% 
    filter(!is.na(Is_Default), !is.na(dti), dti >= 0, dti <= 50, 
           addr_state %in% StatesSelected) %>% 
    group_by(addr_state) %>% 
    summarise(Avg_DTI = mean(dti), Default_Rate = mean(Is_Default), N = n()) %>% 
    ungroup() %>% 
    arrange(desc(Default_Rate))
}