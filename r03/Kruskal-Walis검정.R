
df <- read.csv('C:/Users/CJ/Documents/open2/train2.csv')

df

bartlett.test(credit~begin_month, data = df)

kruskal.test(credit~begin_month, data = df)
