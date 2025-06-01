NBA24 <- read.csv("NBA.csv")
NBA23 <- read.csv("NBA23.csv")
NBA22 <- read.csv("NBA22.csv")
NBA21 <- read.csv("NBA21.csv")
NBA20 <- read.csv("NBA20.csv")
NBA19 <- read.csv("NBA19.csv")

library(tidymodels)
library(ggplot2)
library(naivebayes)




NBA5 <- rbind.data.frame(NBA19, NBA20, NBA21, NBA22, NBA23)

NBA5 <- NBA5[,c(-1,-2)]


NBA_Split <- NBA5 %>% 
  initial_split(0.8)
NBA_train <- training(NBA_Split)
NBA_test <- testing(NBA_Split)

model <- linear_reg()

fittedmod <- model %>%
  fit(PTS ~ FG + X3P + FT, data = NBA_train)

print(tidy(fittedmod), n = 44)

NBA_results <- augment(fittedmod, NBA_test)

rsq_trad(NBA_results, truth = PTS, estimate = .pred)

sum(NBA_results$.resid^2)

fittedmod




NBA_Split <- NBA5 %>% 
  initial_split(0.8)
NBA_train <- training(NBA_Split)
NBA_test <- testing(NBA_Split)

model <- linear_reg()

fittedmod <- model %>%
  fit(oPTS ~ oFG + o3P + oFT, data = NBA_train)

print(tidy(fittedmod), n = 44)

NBA_results <- augment(fittedmod, NBA_test)

rsq_trad(NBA_results, truth = oPTS, estimate = .pred)

sum(NBA_results$.resid^2)

fittedmod

###
actual points <- offensive measure + defensive measure

offensive measure <- fg + x3p + ft
defensive measure <- ofg + o3p + oft

machine learning model 




  

