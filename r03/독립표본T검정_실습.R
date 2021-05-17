library(readr)
# CSV 데이터 읽어와서 data 변수에 저장
data <- read_csv("C:/Users/CJ/Desktop/coding/r_project/data/twomethod.csv")
View(data)

# 데이터 확인
head(data)
summary(data)

class(data)  # 데이터 타입 확인

# subset 함수 사용하여 데이터 분류
#         subset(데이터선택, 조건(na 없이), 가져올 컬럼)
result <- subset(data, !is.na(score), c(method, score))
result

# 교육 방법 분리
a <- subset(result, method == 1)
a  # pt교육(method, score)

b <- subset(result, method == 2)
b  # 코딩교육(method, score)

# 교육 방법에 따른 점수를 추출해보자.(백터값 or 열값)
a1 <- a$score
a1

b1 <- b$score
b1

# 교육 방법에 따른 점수를 추출(백터값 or 열값)
length(a1)
length(b1)
# > length(a1)
# [1] 22
# > length(b1)
# [1] 35

# 두 그룹의 동질성 비교: 동일하게 분포되어 있는 정도(정규분포)
var.test(a1, b1)

# F test to compare two variances
# data:  a1 and b1
# F = 1.0648, num df = 21, denom df = 34, 
# p-value = 0.8494 => 유의수준 0.05이상이므로, 정규분포를 따른다.(정규성/등분산성)
# alternative hypothesis: true ratio of variances is not equal to 1
# 95 percent confidence interval: 0.502791 2.427170
# sample estimates: ratio of variances 1.06479

# 동질성이 확보되었음으로(정규분포를 따름), t.test()를 사용한다.
t.test(a1, b1, alternative = "greater", conf.level = 0.95)

# Welch Two Sample t-test
# data:  a1 and b1
# t = -5.6056, df = 43.705, p-value = 1 => 귀무가설 채택, a1 < b1
# alternative hypothesis: true difference in means is greater than 0
# 95 percent confidence interval: -16.66255       Inf
# sample estimates:
#   mean of x mean of y 
# 16.40909  29.22857 

