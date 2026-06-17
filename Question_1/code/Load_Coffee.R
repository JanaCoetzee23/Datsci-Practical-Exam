
# Reads csv silently (suppresses read_csv's column-type messages) 
# and with UTF-8 encoding, which is required for this file due to 
# special characters in descriptions.

Load_Coffee <- function(path){
  hushread <- purrr::quietly(read_csv)
  df <- hushread(path, locale = locale(encoding = "UTF-8"))
  df$result
}