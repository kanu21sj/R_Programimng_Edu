install.packages("ggmap")
library(ggplot2)
library(ggmap)

seoul <- c(left=126.77, bottom=37.40, right=127.17, top=37.70)

map <- get_stamenmap(seoul, zoom=12, maptype = 'terrain')

ggmap(map)

#############ass find modify!####################

pop <- read.csv(file.choose("population201902.csv"), header = T)
pop

library(stringr)
pop_all <- pop$총인구수
pop_all

region <- pop$지역명
region

lon <- pop$LON
lat <- pop$LAT

tot_top <- as.numeric(str_replace_all(pop$총인구수, ',', ''))

df <- data.frame(region, lon, lat, tot_top)
df

df[1]  # 컬럼을 가지고 온다.(인덱스 1부터 시작함)

df[2]  

df[1:5,]  # 1~5까지의 row 값을 가져옴

daegu <- c(left=123.44, bottom=32.85, right=1313.60, top=38.85)

map <- get_stamenmap(daegu, zoom=7, maptype = 'watercolor')

ggmap(map)

layer1 <- ggmap(map)

layer1 <- geom_point(
                    data = df,
                    aes(x = lon, y = lat, color = factor(tot_top), size = 3)
                    )
