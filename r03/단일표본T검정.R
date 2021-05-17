library(readr)
data <- read_csv("C:/Users/CJ/Desktop/coding/r_project/data/one_sample.csv")
data
x <- data$time
head(x)
summary(x)

# 결측치 제거
mean(x, na.rm = T)  # NA제외 평균

# 데이터 정제
x1 <- na.omit(x)  # NA제외 평균
x1

# 정규분포(모수) 검정  *모수: 모집단의 통계적인 특성치
shapiro.test(x1)  # 정규분포(0.05보다 크면 정규분포)

hist(x1)  # 정규분포 형태

# 단일표본 T검정
# 양측검정
t.test(x1, mu=5.2)  # x1: 표본집단 평균, mu=5.2 모집단의 평균값

# 정제 데이터와 5.2시간 비교
t.test(x1, mu=5.2, alter="two.sided", conf.level = 0.95)
# 유의수준 0.05에서 귀무가설 기각되었다.
# A회사의 노트북 사용량은5.56이므로 국내 평균 사용시간 5.2보다 길다. 
