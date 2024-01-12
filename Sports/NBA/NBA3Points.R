NBA <- read.csv("NBA.csv")
hist(NBA$o3P)
abline(v = mean(NBA$o3P), col = "Red")
sd(NBA$o3P)
mean(NBA$o3P)


hist(NBA$o3P.)
abline(v = mean(NBA$o3P.), col = "Red")
sd(NBA$o3P.)
mean(NBA$o3P.)

NBA$o3PA.z <- (NBA$o3PA - mean(NBA$o3PA)) / sd(NBA$o3PA)
NBA$o3PP.z <- (NBA$o3P. - mean(NBA$o3P.)) / sd(NBA$o3P.)

NBA$average.z <- (NBA$o3PA.z + NBA$o3PP.z)/2

hist(NBA$average.z)
sd(NBA$average.z)

summary(NBA$average.z)
