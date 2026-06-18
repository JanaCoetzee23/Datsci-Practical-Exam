# Calculates default rate by Lending Club credit grade, to test whether
# grade is a strong indicator of default risk.

Grade_Default_Rates <- function(Loan_Credit){
  Loan_Credit %>% 
    filter(!is.na(Is_Default)) %>% 
    group_by(grade) %>% 
    summarise(Default_Rate = mean(Is_Default), N = n()) %>% 
    ungroup() %>% 
    arrange(grade)
}