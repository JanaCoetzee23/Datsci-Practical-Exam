# Plots average interest rate by credit grade and by occupation group,
# side by side, to visually contrast how strongly each factor relates 
# to interest rate.

Plot_Interest_Rate_Drivers <- function(Loan_Credit){
  
  p1 <- Loan_Credit %>% 
    group_by(grade) %>% 
    summarise(Avg_Int_Rate = mean(int_rate, na.rm = TRUE)) %>% 
    ungroup() %>% 
    ggplot() +
    geom_bar(aes(grade, Avg_Int_Rate, fill = grade), stat = "identity") +
    scale_fill_brewer(palette = "RdYlGn", direction = -1) +
    theme_bw() +
    guides(fill = "none") +
    labs(title = "By Credit Grade", x = "", y = "Avg Interest Rate (%)")
  
  p2 <- Occupation_Interest_Rate(Loan_Credit) %>% 
    plot_orderset(., Column = "Occupation_Group", Order = (Occupation_Interest_Rate(Loan_Credit) %>% arrange(Avg_Int_Rate) %>% pull(Occupation_Group))) %>% 
    ggplot() +
    geom_bar(aes(Occupation_Group, Avg_Int_Rate), stat = "identity", fill = "steelblue") +
    coord_flip() +
    theme_bw() +
    labs(title = "By Occupation Group", x = "", y = "Avg Interest Rate (%)")
  
  cowplot::plot_grid(p1, p2, ncol = 1)
}