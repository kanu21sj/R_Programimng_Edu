data <- read_csv("C:/Users/CJ/Desktop/coding/r_project/data/descriptive.csv")
data

# MASS 패키기 설치 및 메모리 로딩
library(MASS)
data(Animals)
head(Animals)

# brain 칼럼을 대상으로 다음 기술 통계량 구하기
summary(Animals$brain)
var(Animals$brain)  # 분산 구하기
sd(Animals$brain)  # 표준편차 구하기
mean(Animals$brain)  # 평균값 구하기
max(Animals$brain)
min(Animals$brain)
median(Animals$brain)

# describe(), freq()함수 이용하여 
# Animals 데이터 셋 전체를 대상으로 기술 통계량 구하기
install.packages("psych")
library(psych)
describe(Animals)

install.packages("descr")
library(descr)
freq(Animals)

# 명목척도 변수인 학교유형(type), 합격여부(pass) 변수에 대해
# 빈도 분석을 수행하고 결과를 막대그래프와 파이차트로 시각화
type <- data$type
x <- table(type)
barplot(x)
pie(x)

# 비율척도 변수인 나이 변수에 대해 요약치(평균, 표준편차)와 비대칭도(왜도,첨도)
# 통계량을 구하고, 히스토그램 작성하여 비대칭도 통계량 설명
age <- data$age
summary(age)
skewness(age)  # 왜도
kurtosis(age)  # 첨도
par(mfrow = c(1,1))
hist(age, freq = F)
lines(density(age), col='blue')
x <- seq(35, 80, 0.1)  # x축 시작점, 끝점, 순서값의 크기
curve(dnorm(x, mean(age), sd(age)), col='red', add=T)  # dnorm 표준정규분포
