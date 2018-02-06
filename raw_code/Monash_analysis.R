library(tidyverse)

scores_5242 <- read_csv("data/deidentified_scores_5242.csv")
scores_2420 <- read_csv("data/deidentified_scores_2420.csv")

summary(scores_5242$`7b (8)`)
summary(scores_2420$`7b (8)`)

scores_5242$`Exam Tot` <- apply(scores_5242[,4:29],1,sum, na.rm=T)
scores_2420$`Exam Tot` <- apply(scores_2420[,4:29],1,sum, na.rm=T)

scores_5242 <- scores_5242 %>% mutate(perf = `7b (8)`/`Exam Tot`)
scores_2420 <- scores_2420 %>% mutate(perf = `7b (8)`/`Exam Tot`)
scores_5242 <- scores_5242 %>% mutate(class="5242")
scores_2420 <- scores_2420 %>% mutate(class="2420")

summary(scores_5242$perf)
summary(scores_2420$perf)
scores <- bind_rows(scores_5242, scores_2420)
ggplot(scores, aes(x=class, y=perf)) + geom_boxplot()
