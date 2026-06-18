# Plots default rates by home ownership and employment length category,
# for 36-month loans, to visualise the pattern found by Test_Belief_1.

Plot_Belief_1 <- function(Loan_Credit){
  dfp <- Test_Belief_1(Loan_Credit) %>% filter(home_ownership != "ANY")
  
  dfp %>% 
    ggplot() +
    geom_bar(aes(home_ownership, Default_Rate, fill = Emp_10_Plus), 
             stat = "identity", position = "dodge") +
    theme_bw() +
    scale_y_continuous(labels = scales::percent_format()) +
    scale_fill_manual(values = c("10+ years" = "darkgreen", "Less than 10 years" = "grey60")) +
    labs(title = "Default Rate by Home Ownership and Employment Length",
         subtitle = "36-month loans only",
         x = "", y = "Default Rate", fill = "")
}