library(rvest)
library(tidyverse)

years <- c(2000:2024)
urls <- list()
for (i in 1:length(years)) {
  url <- paste0("https://www.baseball-reference.com/leagues/majors/", years[i], ".shtml")
  urls[[i]] <- url
}

urls <- urls %>%
  unlist() %>%
  as.data.frame() %>%
  dplyr::mutate(year = years) %>%
  dplyr::rename(url = ".")

scrape_data_funcion <- function(url, year){
  df <- url %>%
    xml2:: read_html() %>%
    rvest::html_elements("table") %>%
    rvest::html_table(trim = TRUE)
  
  df
}


mlb23 <- scrape_data_funcion(urls$url[24], 2023)
mlb23 <- as.data.frame(mlb23)

mlb23 <- mlb23[-c(31,32,33),]

