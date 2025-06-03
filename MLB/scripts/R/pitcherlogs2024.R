library(baseballr)
library(tidyverse)
ls("package:baseballr") #So I can review all functions in baseballr

pitchers<- fg_pitch_leaders(startseason = 2024, endseason = 2024)
pitchers <- pitchers %>%
  filter(IP >= 27)
#I feel 27 IP gets rid of outliers, particularly non-pitchers but this number is up for debate

hist(pitchers$ERA)
summary(pitchers$ERA) 
#league average ERA for 2024 is 4.01 and this outputs 4.07.
#I can possibly be more selective to lower the ERA to match? 
#Should I aim for a normal distribution?

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
  
  # Save logs under the player's name
  pitcher_logs_2024[[name]] <- logs
}

all_pitcher_logs <- bind_rows(pitcher_logs_2024, .id = "PlayerName")

team_hitting <- fg_team_batter(season = 2024)
head(team_hitting)
