# This list was built by manually scanning all unique values in origin_1 
# (614 entries) and identifying standalone country names, including common 
# misspellings found in the data (e.g. "Columbia", "Ethopia"). 
# Continents/multi-country entries (e.g. "Africa", "South America") were 
# excluded as they are too broad to use as a specific region.

Coffee_Origin_List <- function(){
  c("Ethiopia", "Ethopia",
    "Colombia", "Columbia",
    "Brazil", "Kenya", "Guatemala", "Costa Rica", "Panama", "Mexico",
    "Honduras", "Nicaragua", "El Salvador", "Peru", "Bolivia", 
    "Indonesia", "India", "Yemen", "Rwanda", "Burundi", "Tanzania",
    "Papua New Guinea", "Taiwan", "Thailand", "Jamaica", 
    "Dominican Republic", "Haiti", "Congo", "Madagascar", "Zambia")
}