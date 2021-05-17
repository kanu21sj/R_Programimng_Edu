name <- 'hong'

age  <- 100

# comments
age

# install.packages("ggplot2")
install.packages("corrplot")
install.packages("lattice")

# console clear: ctrl + L
# case sensitivity

library(corrplot)  # ctrl + shift + 1 : RScript Joom +-
library(lattice)

a = mtcars
a

mcors = cor(mtcars$gear, mtcars$carb)
mcors

# 변수 2개 넣고 싶을 때 ~ 사용
xyplot(gear~carb, data = mtcars)

# 선형회귀(Linear regression)
lm = plot(mtcars$gear, mtcars$carb)

# abline: 라인 넣어주는 함수
abline(lm(mtcars$gear~mtcars$carb))

mcor = cor(mtcars)  # 전체 상관도
mcor

corrplot(mcor)  # heatmap

plot(mtcars)  # pairplot

# 무게와 마일간의 관계
mcors2 = cor(mtcars$wt, mtcars$mpg)
mcors2

xyplot(wt~mpg, data = mtcars)
lm2 = plot(mtcars$wt, mtcars$mpg)
abline(lm2(mtcars$wt~mtcars$mpg))


