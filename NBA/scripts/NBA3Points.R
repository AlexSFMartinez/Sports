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

mean(NBA$o3PA.z)

NBA$average.z <- (NBA$o3PA.z + NBA$o3PP.z)/2

sd(NBA$average.z)

summary(NBA$average.z)

NBA %>%
  ggplot(aes(x = FG., y = PTS)) + 
  geom_point() +
  geom_smooth(method = "lm",se = T)

NBA_Split <- NBA %>%
  initial_split(prop = 0.8)

NBA_train <- training(NBA_Split)
NBA_test <- testing(NBA_Split)

model <- linear_reg()

fittednbamod <- model %>% 
  fit(oPTS ~ ORB + DRB + STL + BLK, data = NBA_train)

fittednbamod

nba_results <- predict(fittednbamod, new_data = NBA_test) %>% 
  bind_cols(NBA_test %>% select(oPTS))
nba_results

nba_results %>%
  ggplot(aes(x = oPTS, y = .pred)) +
  geom_abline(lty = 2) + 
  geom_point(alpha = 0.7) +
  labs(x = "Opponent Points", y = "Predicted Values")

rsq_trad(nba_results, truth = oPTS, estimate = .pred)

tidy(fittednbamod)
