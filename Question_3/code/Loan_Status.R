# Creates a clean outcome variable for default analysis. 
# Fully Paid and Charged Off/Default loans have a resolved outcome and are 
# used for default rate calculations. Current loans are excluded from this 
# calculation since their outcome is not yet known. Late/Grace Period loans 
# are kept as a separate flag, representing partial default (missed 
# payments but not yet charged off).

Loan_Status <- function(Loan_Credit){
  Loan_Credit %>% 
    mutate(Resolved_Status = case_when(
      loan_status == "Fully Paid" ~ "Fully Paid",
      loan_status %in% c("Charged Off", "Default") ~ "Charged Off",
      TRUE ~ NA_character_
    )) %>% 
    mutate(Is_Default = ifelse(Resolved_Status == "Charged Off", 1, 
                               ifelse(Resolved_Status == "Fully Paid", 0, NA))) %>% 
    mutate(Is_Late_or_Collections = ifelse(grepl("Late|Grace", loan_status), 1, 0))
}