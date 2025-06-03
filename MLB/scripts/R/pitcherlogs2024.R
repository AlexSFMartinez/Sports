library(baseballr)
library(tidyverse)
ls("package:baseballr")

players<- fg_pitch_leaders(startseason = 2024, endseason = 2024)
players <- players %>%
  filter(IP >= 27)
#I feel 27 IP gets rid of outliers but this number is up for debate

pitcher_logs_2024 <- list()  #bucket for pitcher logs

for (i in 1:nrow(players)) {
  name <- players$PlayerName[i]
  id <- players$playerid[i]
  
  message("Fetching data for: ", name)
  
  logs <- tryCatch({
    Sys.sleep(2)  # Sleep interval to not overload servers
    pitcher_game_logs_fg(playerid = id, year = 2024)
  }, error = function(e) {
    message("Failed for: ", name)
    return(NULL)
  })
  
  # Save the logs under the player's name
  pitcher_logs_2024[[name]] <- logs
}

all_pitcher_logs <- bind_rows(pitcher_logs_2024, .id = "PlayerName")

team_hitting <- fg_team_batter(season = 2024)
head(team_hitting)
