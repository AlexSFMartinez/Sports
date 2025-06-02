pit24 <- read.csv("C:/Users/alexs/OneDrive/Desktop/Sports/MLB/data/Pitchers24.csv")
library("dplyr")
library("stringr")

pit24 <- pit24[,c(-1, -(3:5), -(37:44),-62,-63)]

pit24$HR. <- as.numeric(sub("%", "", pit24$HR.,fixed=TRUE))/100
pit24$K. <- as.numeric(sub("%", "", pit24$K.,fixed=TRUE))/100
pit24$BB. <- as.numeric(sub("%", "", pit24$BB.,fixed=TRUE))/100
pit24$HardH. <- as.numeric(sub("%", "", pit24$HardH.,fixed=TRUE))/100
pit24$LD. <- as.numeric(sub("%", "", pit24$LD.,fixed=TRUE))/100
pit24$GB. <- as.numeric(sub("%", "", pit24$GB.,fixed=TRUE))/100
pit24$FB. <- as.numeric(sub("%", "", pit24$FB.,fixed=TRUE))/100
pit24$cWPA <- as.numeric(sub("%", "", pit24$cWPA,fixed=TRUE))/100

pit24 <- pit24 %>%
  distinct(Player, .keep_all = TRUE) %>%
  mutate(across(is.numeric, round, digits = 3))%>%
  filter(IP >= 27)

summary(pit24$ERA)
summary(pit24$WHIP)

lm <- lm(data = pit24, ERA ~ OPS)
summary(lm)
#Testing Github