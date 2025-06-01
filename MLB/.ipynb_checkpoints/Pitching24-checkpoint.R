getwd()
pit24 <- read.csv("pitching24.csv")
library("dplyr")
library("stringr")


pit24$FB. <- as.numeric(sub("%", "", pit24$FB.,fixed=TRUE))/100
pit24$HR. <- as.numeric(sub("%", "", pit24$HR.,fixed=TRUE))/100
pit24$SO. <- as.numeric(sub("%", "", pit24$SO.,fixed=TRUE))/100
pit24$BB. <- as.numeric(sub("%", "", pit24$BB.,fixed=TRUE))/100
pit24$HardH. <- as.numeric(sub("%", "", pit24$HardH.,fixed=TRUE))/100
pit24$LD. <- as.numeric(sub("%", "", pit24$LD.,fixed=TRUE))/100
pit24$GB. <- as.numeric(sub("%", "", pit24$GB.,fixed=TRUE))/100
pit24$cWPA <- as.numeric(sub("%", "", pit24$cWPA,fixed=TRUE))/100

pit24 <- pit24 %>%
  group_by(Name) %>%
  summarise(
    across(1:2, sum, na.rm = TRUE),
    across(3:4, mean, na.rm = TRUE),
    across(5:23, sum, na.rm = TRUE),
    across(24:47, mean, na.rm = TRUE)) %>%
  mutate(across(is.numeric, round, digits=3)) %>%
  filter(IP >= 9)

pit24 <- pit24[-487,]

pit24$Name <- str_remove(pit24$Name, "<a0>")

p4 <- pit24 %>%
  select(Name, ERA, IP, WHIP, H9, HR9, BB9, SO9, BA, OBP, SLG, OPS, HR., SO.) %>%
  filter(WHIP <= 1.99) %>%
  filter(ERA <= 8) %>%
  filter(IP > 20)

hist(p4$ERA)
hist(p4$WHIP)
mean(p4$ERA)

Best <- lm(data = p4, OPS ~ ERA)
plot(data = p4, OPS ~ ERA)
abline(Best)
summary(Best)

trial <- lm(data = p4, ERA ~ OPS)
summary(trial)
