# Classifies emp_title into a small set of broad occupation categories, 
# based on keyword matching against the most common job title patterns 
# found in the data. Titles not matching any category are grouped as 
# "Other/Unclassified".

Classify_Occupation <- function(Loan_Credit){
  Loan_Credit %>% 
    mutate(emp_title_clean = str_to_lower(str_trim(emp_title))) %>% 
    mutate(Occupation_Group = case_when(
      is.na(emp_title_clean) ~ "Not Provided",
      grepl("manager|supervisor|director|president|vp|vice president", emp_title_clean) ~ "Management",
      grepl("nurse|rn\\b|physician|doctor|medical|dental|pharmac", emp_title_clean) ~ "Healthcare",
      grepl("teacher|professor|instructor|principal", emp_title_clean) ~ "Education",
      grepl("driver|truck|delivery", emp_title_clean) ~ "Driver/Transport",
      grepl("engineer", emp_title_clean) ~ "Engineering",
      grepl("sales|account executive|account manager", emp_title_clean) ~ "Sales",
      grepl("owner|self employed|self-employed", emp_title_clean) ~ "Business Owner",
      grepl("officer|police|firefighter|military|army|navy", emp_title_clean) ~ "Public Service/Security",
      TRUE ~ "Other/Unclassified"
    ))
}