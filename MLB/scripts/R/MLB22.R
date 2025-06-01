#STARTUP
mlb22 <- read.csv("MLB22.csv")
library(dplyr)

mlb22$RGZ <- (mlb22$R.G - mean(mlb22$R.G))/ sd(mlb22$R.G)
mlb22$RAGZ <- (mlb22$RA.G - mean(mlb22$RA.G))/ sd(mlb22$RA.G)
mlb22$ODZ <- mlb22$RGZ + mlb22$RAGZ

Best <- lm(data = MLB22, RA.G ~ BB9 + HR9 + H9)
summary(Best)


trial <- lm(data = mlb22, W.L. ~ R.G + ERA)
summary(trial)

#How to change column name
colnames(MLB22)[colnames(MLB22) == "X2B"] <- "2B"

#OPS
Best <- lm(data = MLB22, RA.G ~ BB9 + HR9 + H9)
summary(Best)

plot(data = MLB22, R.G ~ OPS)
abline(OPS)

hist(MLB22$ERA)
summary(MLB22$ERA)


