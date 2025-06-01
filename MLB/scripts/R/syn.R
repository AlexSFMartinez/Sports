#startup
syn22 <- read.csv("syn.csv")
syn21 <- read.csv("syn21.csv")
syn20 <- read.csv("syn20.csv")
syn19 <- read.csv("syn19.csv")
syn18 <- read.csv("syn18.csv")

library("dplyr")

#Data cleaning and Manipulation
syn22 <- select(syn22, -c(W, L, HR., SO., BB.))
  
#predicting era by ops
ops22 <- lm(data = syn22, ERA ~ OPS)
plot(data = syn22, ERA ~ OPS)
syn22$lab <- 1:32
text(syn22$OPS, syn22$ERA, labels = syn22$lab, pos = 4)
abline(ops22)
summary(ops22)

ops21 <- lm(data = syn21, ERA ~ OPS)
plot(data = syn21, ERA ~ OPS)
syn21$lab <- 1:32
text(syn21$OPS, syn21$ERA, labels = syn21$lab, pos = 4)
abline(ops21)
summary(ops21)

#Linear Models 2020
ops20 <- lm(data = syn20, ERA ~ OPS)
plot(data = syn20, ERA ~ OPS)
syn20$lab <- 1:32
text(syn20$OPS, syn20$ERA, labels = syn20$lab, pos = 4)
abline(ops20)
summary(ops20)

#Linear Models 2019
ops19 <- lm(data = syn19, ERA ~ OPS)
plot(data = syn19, ERA ~ OPS)
syn19$lab <- 1:32
text(syn19$OPS, syn19$ERA, labels = syn19$lab, pos = 4)
abline(ops19)
summary(ops19)

#Linear Models 2018
ops18 <- lm(data = syn18, ERA ~ OPS)
plot(data = syn18, ERA ~ OPS)
syn18$lab <- 1:32
text(syn18$OPS, syn18$ERA, labels = syn18$lab, pos = 4)
abline(ops18)
summary(ops18)

#Mean y = mx + b


11.96 + 12.28 + 11.73 + 12.98 + 12.15

61.1/5

-4.55 + -4.80 + -4.21 + -5.18 + -4.61

-23.35/5

#y = 12.22x -4.67

#RUNS PER GAME#
mlb22 <- read.csv("MLB22.csv")
rpg22 <- lm(data = mlb22, R.G ~ OPS)
plot(data = mlb22, R.G ~ OPS)
abline(rpg22)
summary(rpg22)

mlb21 <- read.csv("MLB21.csv")
rpg21 <- lm(data = mlb21, R.G ~ OPS)
plot(data = mlb21, R.G ~ OPS)
abline(rpg21)
summary(rpg21)


#RUNS ALLOWED PER GAME#
rapg22 <- lm(data = mlb22, ERA ~ RA.G)
plot(data = mlb22, ERA ~ RA.G)
abline(rapg22)
summary(rapg22)


rapg21 <- lm(data = mlb21, ERA ~ RA.G)
plot(data = mlb21, ERA ~ RA.G)
abline(rapg21)
summary(rapg21)

y = 1.03x -0.41

syn22$c <- syn22$W.L. - syn21$W.L.

plot(y = 12.22x -4.67)





