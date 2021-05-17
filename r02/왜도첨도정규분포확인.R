# 1. 데이터셋 가져오기
data <- read_csv("C:/Users/CJ/Desktop/coding/r_project/data/descriptive.csv")
data

# 2. 데이터셋의 특성 보기
dim(data)  # 데이터 차원 확인
length(data)  # 컬럼 개수 확인
length(data$survey)  # survey 개수 확인
head(data)
str(data)  # 데이터 구조 확인

# 3. 데이터 특성(최소값, 최대값, 평균, 분위수, 결측치(NA) 등 제공)
summary(data)

# 실습: 성별 변수의 기술 통계량과 빈도수 구하기
data <- subset(data, gender == 1 | gender == 2)  # 이상치 제거
# data 테이블을 대상으로 성별이 1 또는 2인 데이터 대상의 subset 만듦
summary(data)  # 최대/최소값

x <- table(data$gender)  # 빈도를 구해줌

barplot(x)

# 비율을 구하고 싶은 경우에는
prop.table(x)

# 실습: 학력 수준(level) 변수를 대상으로 구성 비율 구하기
# 학력수준으로 요약/빈도/비율/그래프
x1 <- table(data$level)
x1
barplot(x1)
summary(x1)
prop.table(x1)
hist(x1)
pie(x1)

# 실습: 만족도(survey) 변수를 대상으로 요약/빈도/비율/그래프
x2 <- table(data$survey)
x2
barplot(x2)
summary(x2)
prop.table(x2)
hist(x2)
pie(x2)

summary(data$cost)

# cost가 2이상, 10이하를 추출
data <- subset(data, data$cost >=2 & data$cost <=10)
data 

x <- data$cost
mean(x)
median(x)

sort(x)  # 오름차순으로 정리
sort(x, decreasing = T)  # 내림차순으로 정리

# 파생변수 생성
data$cost2[data$cost >= 1 & data$cost <= 3] <- 1 
data$cost2[data$cost >= 4 & data$cost <= 6] <- 2
data$cost2[data$cost >= 7] <- 3

data <- subset(data, data$cost2 == 1 | data$cost2 == 2 | data$cost2 == 3)
data

cost.tot = table(data$cost2)
barplot(cost.tot)
pie(cost.tot)
prop.table(cost.tot)

# 왜도(정규분포표), 첨도 구하는 라이브러리 설치
install.packages('moments')  
library(moments)
cost <- data$cost

skewness(cost)  # 왜도는 0이 나와야 함(정규성 벗어나지 않음)
kurtosis(cost)  # 첨도 0보다 큰 양수가 나올 수록 정규형에 가깝지 않음
par(mfrow = c(1,1))
hist(cost, freq = F)
lines(density(cost), col='blue')
x <- seq(0, 8, 0.1)
curve(dnorm(x, mean(cost), sd(cost)), col='red', add=T)


## QQPLOT: normal
qqnorm(x)
qqline(x, col="red", lwd=2)
