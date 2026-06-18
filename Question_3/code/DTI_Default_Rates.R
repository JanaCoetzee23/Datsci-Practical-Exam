# Groups loans into DTI bands and calculates default rate per band,
# to assess whether higher debt-to-income ratios are associated with
# higher default risk, and to help identify a sensible hard-cap level.

DTI_Default_Rates <- function(Loan_Credit){
  Loan_Credit %>% 
    filter(!is.na(Is_Default), !is.na(dti), dti >= 0, dti <= 50) %>% 
    mutate(DTI_Band = cut(dti, breaks = seq(0, 50, by = 5))) %>% 
    group_by(DTI_Band) %>% 
    summarise(Default_Rate = mean(Is_Default), N = n()) %>% 
    ungroup()
}