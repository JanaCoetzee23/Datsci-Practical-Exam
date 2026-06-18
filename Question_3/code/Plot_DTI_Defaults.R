# Plots default rate by DTI band as a clear, increasing trend, to help
# identify an appropriate DTI cap based on a chosen default tolerance level.

Plot_DTI_Defaults <- function(Loan_Credit){
  DTI_Default_Rates(Loan_Credit) %>% 
    filter(!is.na(DTI_Band)) %>% 
    ggplot() +
    geom_bar(aes(DTI_Band, Default_Rate), stat = "identity", fill = "steelblue") +
    geom_hline(yintercept = 0.225, linetype = "dashed", color = "darkred") +
    theme_bw() +
    scale_y_continuous(labels = scales::percent_format()) +
    labs(title = "Default Rate by Debt-to-Income Band",
         subtitle = "Dashed line shows the overall baseline default rate (22.5%)",
         x = "DTI Band (%)", y = "Default Rate") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}