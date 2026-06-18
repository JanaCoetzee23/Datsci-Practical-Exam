# Plots default rate by state, ordered from lowest to highest, with Texas 
# specifically highlighted in a different colour since the Director asked 
# whether Texas differs from other states.

Plot_State_Defaults <- function(Loan_Credit, Min_Loans = 100){
  dfp <- State_Default_Rates(Loan_Credit, Min_Loans = Min_Loans)
  
  order <- dfp %>% arrange(Default_Rate) %>% pull(addr_state)
  dfp <- dfp %>% plot_orderset(., Column = "addr_state", Order = order)
  
  dfp <- dfp %>% mutate(Is_Texas = ifelse(addr_state == "TX", "Texas", "Other States"))
  
  dfp %>% 
    ggplot() +
    geom_bar(aes(addr_state, Default_Rate, fill = Is_Texas), stat = "identity") +
    coord_flip() +
    theme_bw() +
    scale_y_continuous(labels = scales::percent_format()) +
    scale_fill_manual(values = c("Texas" = "darkorange", "Other States" = "steelblue")) +
    labs(title = "Default Rate by State",
         subtitle = "36-month loans, minimum 100 loans per state",
         x = "", y = "Default Rate", fill = "") +
    theme(axis.text.y = element_text(size = 7))
}