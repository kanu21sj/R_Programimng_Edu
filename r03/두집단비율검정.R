library(readr)
data <- read_csv("C:/Users/CJ/Desktop/coding/r_project/data/two_sample.csv")
View(data)
head(data)  # tibble = 데이터프레임

x <- data$method  # 1번: pt교육, 2번: 코딩교육 => 명목척도
y <- data$survey  # 0번: 불만족, 1번: 만족
x; y

# 빈도 분석표
table(x)
table(y)

# 교차 분석표
table(x, y, useNA = "ifany")  # useNA(결측치 표현 여부) = "ifany"(있으면 표출)

# 두 집단 이상의 명목척도의 비율 검정
help("prop.test")

#     벡터(값의 묶음으로 넣어주어야 함)
#     c(x1, x2 만족도), c(시도횟수, 시도횟수) 
prop.test(c(110, 135), c(150, 150), alternative = "greater", conf.level = 0.95)
# 질문, x1(pt)보다 x2(코딩) 교육 만족도가 높은가?
# 결과, 답이 x2가 더 높았으므로 0가설 채택(반대되는 가설)

# ---------------- 실습문제 ------------------
a <- data$gender
b <- data$survey

table(a)
table(b)

table(a, b, useNA = "ifany")

# alternative 안써줘도 무방(default 값이 two.sided로 설정)
prop.test(c(138, 107), c(174, 126), alternative = "two.sided", conf.level = 0.95)
# 질문, a1(남자)보다 a2(여자) 대학에 대한 만족도의 차이가 있는가?
# 결과, 차이가 거의 없음.