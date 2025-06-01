mlb21 <- read.csv("MLB21.csv")

mlb21$RGZ <- (mlb21$R.G - mean(mlb21$R.G))/ sd(mlb21$R.G)
mlb21$RAGZ <- (mlb21$RA.G - mean(mlb21$RA.G))/ sd(mlb21$RA.G)
mlb21$ODZ <- mlb21$RGZ + mlb21$RAGZ

Best <- lm(data = MLB21, RA.G ~ BB9 + HR9 + H9)
summary(Best)


trial <- lm(data = mlb21, W.L. ~ OPS + RA.G)
summary(trial)

ggplot(MLB21) +
  aes(x = H9, y = RA.G, colour = HR9, size = BB9) +
  geom_point() +
  scale_color_gradient() +
  labs(
    y = "Runs Allowed Per Game",
    x = "Hits Per 9",
    color = "Homeruns Per 9",
    size = "Walks Per 9"
  ) +
  theme_minimal()

##
erawhip <- lm(data = MLB21, RA.G ~ ERA)
summary(erawhip)

MLB21$ERA.Z <- (MLB21$ERA - mean(MLB21$ERA)) / sd(MLB21$ERA)
MLB21$WHIP.Z <- (MLB21$WHIP - mean(MLB21$WHIP)) / sd(MLB21$WHIP)

erawhip.z <- lm(data = MLB21, RA.G ~ ERA.Z + WHIP.Z)
summary(erawhip.z)
