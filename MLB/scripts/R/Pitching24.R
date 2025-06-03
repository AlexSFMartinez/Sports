pit24 <- read.csv("C:/Users/alexs/OneDrive/Desktop/Sports/MLB/data/Pitchers24.csv")
#SOME PITCHERS HAVE MULTIPLE ROWS IF THEY WERE TRADED
library("dplyr")
library("stringr")

pit24 <- pit24[,c(-1, -(3:5), -(37:44),-62,-63)] #DONT NEED THESE COLUMNS

#CONVERTS ALL PERCENTAGES INTO DECIMALS AND CHANGES FACTORS TO NUMERIC
pit24$HR. <- as.numeric(sub("%", "", pit24$HR.,fixed=TRUE))/100
pit24$K. <- as.numeric(sub("%", "", pit24$K.,fixed=TRUE))/100
pit24$BB. <- as.numeric(sub("%", "", pit24$BB.,fixed=TRUE))/100
pit24$HardH. <- as.numeric(sub("%", "", pit24$HardH.,fixed=TRUE))/100
pit24$LD. <- as.numeric(sub("%", "", pit24$LD.,fixed=TRUE))/100
pit24$GB. <- as.numeric(sub("%", "", pit24$GB.,fixed=TRUE))/100
pit24$FB. <- as.numeric(sub("%", "", pit24$FB.,fixed=TRUE))/100
pit24$cWPA <- as.numeric(sub("%", "", pit24$cWPA,fixed=TRUE))/100

logan_rows <- which(pit24$Player == "Logan Allen*") #ONLY DUPLICATE NAME OF 2024. HAD TO CREATE UNIQUE IDENTIFIER BEFORE DISTINCT FUNCTION
pit24$Player[logan_rows[2]] <- "Logan Allen2*"

pit24 <- pit24 %>%
  distinct(Player, .keep_all = TRUE) %>% #DISTINCT KEEPS THE TOP ITERATION, WHICH IN THIS CASE IS THE TOTAL STATS FOR THE DUPLICATED PLAYER
  mutate(across(is.numeric, round, digits = 3))%>%
  filter(IP >= 27)

summary(pit24$ERA)
summary(pit24$WHIP)

lm <- lm(data = pit24, ERA ~ OPS)
summary(lm)
#OPS HAS CONSISTENTLY BEEN THE BEST BATTING METRIC TO PIT AGAINST ERA

rm(pit24)

