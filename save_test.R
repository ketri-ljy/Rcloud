# X-Y 플로팅 차트 그리기
city<-c("서울","부산","대구","인천","광주","대전","울산")
pm25<-c(18,48,23,14,25,15,34)
lat<-c(37.567933,35.180002,35.877052,37.457730,35.160331,36.350573,35.539865)
lon<-c(126.978054,129.074974,128.600680,126.702194,126.851433,127.384793,129.311469)
plot(x=lon, y=lat, pch=19, cex=pm25*0.2, col=rgb(1,0,0,0.3), xlim=c(123,133), ylim=c(34.5,38), xlab="경도", ylab="위도")
text(x=lon,y=lat,labels=city)


# 논리 연산자
# 무조건 & -> |
(TRUE | TRUE) & FALSE # FALSE
TRUE | (TRUE & FALSE) # TRUE
TRUE | TRUE & FALSE # TRUE

(FALSE & TRUE) | TRUE # TRUE
FALSE & (TRUE | TRUE) # FALSE
FALSE & TRUE | TRUE   # TRUE

(TRUE | FALSE) & FALSE #FALSE
TRUE | (FALSE & FALSE) #TRUE
TRUE | FALSE & FALSE #TRUE


# 리스트 인덱싱 기능 확인
a <- c(1,2,3,4,5,6)
a[3]
