install.packages('readr')
library(readr)
data <- read_csv("C:/Users/CJ/Desktop/coding/r_project/data/one_sample.csv")
view(data)
head(data)

surv <- data$survey

summary(surv)
length(surv)
table(surv)

install.packages('prettyR')
library(prettyR)
freq(surv)

# 단일집단 비율검정
#          c(만족 136명, 불만족 14명), p=0.8 기준(만족도 80프로), 
#          alternative = 'greater'(p=0.8 / 만족도 80 이상), conf.level(신뢰구간)
binom.test(c(136, 14), p=0.8, alternative = 'greater', conf.level = 0.95)   

hdtv <- read_csv("C:/Users/CJ/Desktop/coding/r_project/data/hdtv.csv")
head(hdtv)

summary(hdtv)
length(hdtv)
table(hdtv)
freq(hdtv)
binom.test(c(10, 40), p=0.1, alternative = 'greater', conf.level = 0.95)
