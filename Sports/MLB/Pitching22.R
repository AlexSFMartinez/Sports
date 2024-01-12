###FULL PITCHING LIST###
pit22 <- read.csv("Pitchers22.csv")
library("dplyr")
library("stringr")

#Cleaning and Manipulating Data
pit22 <- select(pit22,-c(Name.1, Name.2, Rk, Rk.1))

pit22$FB. <- as.numeric(sub("%", "", pit22$FB.,fixed=TRUE))/100
pit22$HR. <- as.numeric(sub("%", "", pit22$HR.,fixed=TRUE))/100
pit22$SO. <- as.numeric(sub("%", "", pit22$SO.,fixed=TRUE))/100
pit22$BB. <- as.numeric(sub("%", "", pit22$BB.,fixed=TRUE))/100
pit22$HardH. <- as.numeric(sub("%", "", pit22$HardH.,fixed=TRUE))/100
pit22$LD. <- as.numeric(sub("%", "", pit22$LD.,fixed=TRUE))/100
pit22$GB. <- as.numeric(sub("%", "", pit22$GB.,fixed=TRUE))/100
pit22$cWPA <- as.numeric(sub("%", "", pit22$cWPA,fixed=TRUE))/100
pit22$XBH. <- as.numeric(sub("%", "", pit22$XBH.,fixed=TRUE))/100

pit22 <- pit22 %>%
  group_by(Name) %>%
  summarise(
    across(1:2, sum, na.rm = TRUE),
    across(3:4, mean, na.rm = TRUE),
    across(5:23, sum, na.rm = TRUE),
    across(24:48, mean, na.rm = TRUE)) %>%
  mutate(across(is.numeric, round, digits=3)) %>%
  filter(IP >= 9)


pit22$Name <- str_remove(pit22$Name, "<a0>")

#DATA ANALYSIS
p2 <- pit22 %>%
  select(Name, ERA, IP, WHIP, H9, HR9, BB9, SO9, BA, OBP, SLG, OPS, HR., SO., XBH.) %>%
  filter(IP >= 60) %>%
  filter(ERA <= 9)
 
#PULL UP BATTING OPS 2022 for teams#
Best <- lm(data = p2, OPS ~ ERA)
plot(data = p2, OPS ~ ERA)
abline(Best)
summary(Best)

hist(p2$OPS)

trial <- lm(data = p2, ERA ~ OBP)
summary(trial)

plot(data = p2, ERA ~ OPS)
abline(trial)
summary(ops18)


test <- lm(data = p2, OBP ~ XBH.)
summary(test)
  
p2$era.z <- (p2$ERA - mean(p2$ERA)) / sd(p2$ERA)
p2$whip.z <- (p2$WHIP - mean(p2$WHIP)) / sd(p2$WHIP)
p2$average.z <- (p2$era.z + (p2$whip.z)) / 2

hist(p2$ERA)
mean(p2$ERA)
