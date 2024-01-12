#STARTUP
MLB22 <- read.csv("MLB22.csv")
library(dplyr)

#How to change column name
colnames(MLB22)[colnames(MLB22) == "X2B"] <- "2B"

#OPS
Best <- lm(data = MLB22, RA.G ~ BB9 + HR9 + H9)
summary(Best)

plot(data = MLB22, R.G ~ OPS)
abline(OPS)

hist(MLB22$ERA)
summary(MLB22$ERA)


