# 4.1 X-Y 플로팅 차트로 보는 지역별 미세먼지 현황

# 지역별 초미세먼지 농도 출력
city <- c("서울", "부산", "대구", "인천", "광주", "대전", "울산") 
pm25 <- c(18, 21, 21, 17, 8, 11, 25)
lat  <- c(37.567933, 35.180002,
          35.877052, 37.457730,
          35.160331, 36.350573,
          35.539865)
lon  <- c(126.978054, 129.074974,
          128.600680, 126.702194,
          126.851433, 127.384793,
          129.311469)
plot(x=lon, y=lat, 
     pch=19, cex=pm25 * 0.3, 
     col=rgb(1,0,0,0.3),
     xlim=c(126, 130), ylim=c(35, 38),
     xlab="경도", ylab="위도")
text(x=lon, y=lat, labels=city)

# 4.2 워드 클라우드로 보는 지역별 미세먼지 현황

# 지진 발생 지역 출력
install.packages("wordcloud")
library(wordcloud)

city <- c("서울", "부산", "대구", "인천", "광주", "대전", "울산") 
pm25 <- c(18, 21, 21, 17, 8, 11, 25)
wordcloud(city, freq=pm25, colors=rainbow(3), random.color=T)

# 4.3 애니메니션: 바람개비 돌리기
# 바람개비 돌리기
install.packages("imager")
library(imager)

img_path <- "C://data/pinwheel.png"
img <- load.image(img_path)
plot(img)

img <- resize(img, size_x = 400L, size_y = 400L)
plot(img, xlim=c(0, 400), ylim=c(0, 400))

angle <- 0
while(TRUE) {
  angle <- angle + 10
  imrotate(img, angle, cx=200,cy=200) %>%  
    plot(axes=FALSE)
  Sys.sleep(0.2) 
}

# 4.4 웹스크래핑: 공공데이터 포털의 API 목록 출력
install.packages("rvest")
library(rvest)

url <- "https://www.data.go.kr/tcs/dss/selectDataSetList.do"
html <- read_html(url)
html

# 4.5 동전 던지기 시뮬레이션 
# 동전 앞면이 나오는 확률
plot(NA,
     xlab="동전을 던진 회수", ylab="앞면이 나오는 비율",
     xlim=c(0, 100), ylim=c(0, 1),
     main="동전 던지는 횟수에 따른 앞면이 나올 확률 변화")
abline(h=0.5, col="red", lty=2)
count <- 0
for(n in 1:100) {
  coin <- sample(c("앞면", "뒷면"), 1)
  if (coin == "앞면")
    count = count + 1
  prob <- count / n
  points(n, prob)
  Sys.sleep(1)
}
