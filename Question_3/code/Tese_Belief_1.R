# Tests the Director's first belief: home owners and people employed 
# 10+ years have lower default rates on short-term (36 month) loans. 
# Creates a simplified employment length flag (10+ years vs less) and 
# compares default rates across home ownership and employment categories, 
# restricted to resolved 36-month loans only.

Test_Belief_1 <- function(Loan_Credit){
  Loan_Credit %>% 
    filter(!is.na(Is_Default), term == "36 months") %>% 
    mutate(Emp_10_Plus = ifelse(emp_length == "10+ years", "10+ years", "Less than 10 years")) %>% 
    group_by(home_ownership, Emp_10_Plus) %>% 
    summarise(Default_Rate = mean(Is_Default), N = n()) %>% 
    ungroup() %>% 
    arrange(Default_Rate)
}