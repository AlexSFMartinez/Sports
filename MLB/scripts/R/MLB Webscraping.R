library(rvest)
library(tidyverse)
library(purrr)

urls <- tibble(
  year = 2000:2024,
  url = paste0("https://www.baseball-reference.com/leagues/majors/", year, ".shtml")
)

scrape_first_table <- function(url, year) {
  message("Scraping year: ", year)
  Sys.sleep(2)  # INTERVALS SCRAPING REQUESTS BY 2 SECONDS
  
  tryCatch({
    tables <- read_html(url) %>%
      html_elements("table") %>%
      html_table(trim = TRUE)
    
    if (length(tables) >= 1) {
      df <- tables[[1]]
      df$year <- year
      return(df)
    } else {
      return(NULL)
    }
  }, error = function(e) {
    message("Failed for year ", year, ": ", e$message)
    return(NULL)
  })
}

batting <- map2(
  urls$url, urls$year,
  ~ scrape_first_table(.x, .y)
)

names(batting) <- urls$year  #Name list elements by year

#CREATES YEARLY DATAFRAME AND REMOVES LEAGUE AVERAGE AND ROW OF CHARACTERS
mlb24 <- batting[["2024"]]
mlb24 <- mlb24[-c(31:33),]

