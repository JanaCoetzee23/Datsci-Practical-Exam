# Plots default rate by Lending Club credit grade (A-G), showing the 
# clear, increasing relationship between worse grades and higher default 
# rates.

Plot_Grade_Defaults <- function(Loan_Credit){
  dfp <- Grade_Default_Rates(Loan_Credit)
  
  dfp %>% 
    ggplot() +
    geom_bar(aes(grade, Default_Rate, fill = grade), stat = "identity") +
    theme_bw() +
    scale_y_continuous(labels = scales::percent_format()) +
    scale_fill_brewer(palette = "RdYlGn", direction = -1) +
    labs(title = "Default Rate by Credit Grade",
         subtitle = "Grade A is the strongest, Grade G is the weakest",
         x = "Credit Grade", y = "Default Rate") +
    guides(fill = "none")
}