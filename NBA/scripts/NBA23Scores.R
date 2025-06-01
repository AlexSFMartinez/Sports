NBA23 <- read.csv("NBA23.csv")
NBA23Scores <- read.csv("NBA23Scores.csv")

library(tidymodels)
library(ggplot2)
library(naivebayes)

NBA_Split <- NBA23 %>% 
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

###
actual points ~ (fg + x3p + ft) + (ofg + o3p + oft)

actualmod <- model %>%
  fit(PTSaway ~ 

offensive measure <- fg + x3p + ft
defensive measure <- ofg + o3p + oft

funkction <- function(x, ...) {

}

machine learning model 
for(i in ) {
  NBA23$RK1 <- NBA23$Rk + 1
}

for(i in NBA23$Rk) {
  NBA23$RK1 <- NBA23$Rk + 1
}

i
