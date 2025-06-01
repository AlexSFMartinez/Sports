library(rvest)
library(tidyverse)


# Create the ID
ID <- sapply(strsplit(as.character(pit24$Player), " "), function(x) {
  first <- substr(x[1], 1, 2) # first two of first name
  last <- substr(x[length(x)], 1, 5) # first five of last name (handles middle names too)
  paste0(tolower(last), tolower(first))
})

urls <- list()
for (i in 1:length(ID)) {
  url <- paste0("https://www.baseball-reference.com/players/gl.fcgi?id=", ID, "01&t=p&year=2024")
  urls[[i]] <- url
}
urls <- lapply(urls, paste0, collapse = "")

urls <- urls %>%
  unlist(use.names = FALSE) %>%
  as.data.frame() %>%
  dplyr::rename(url = 1)

scrape_data_funcion <- function(url, ID){
  df <- url %>%
    xml2:: read_html() %>%
    rvest::html_elements("table") %>%
    rvest::html_table(trim = TRUE)
  
  df
}

str(urls)
mlb23 <- scrape_data_funcion(urls$url[1], 2023)
mlb23 <- as.data.frame(mlb23)

mlb23 <- mlb23[-c(31,32,33),]

length(ID)
view(url)
