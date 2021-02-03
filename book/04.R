# 4.1 X-Y �÷��� ��Ʈ�� ���� ������ �̼����� ��Ȳ

# ������ �ʹ̼����� �� ���
city <- c("����", "�λ�", "�뱸", "��õ", "����", "����", "���") 
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
     xlab="�浵", ylab="����")
text(x=lon, y=lat, labels=city)

# 4.2 ���� Ŭ����� ���� ������ �̼����� ��Ȳ

# ���� �߻� ���� ���
install.packages("wordcloud")
library(wordcloud)

city <- c("����", "�λ�", "�뱸", "��õ", "����", "����", "���") 
pm25 <- c(18, 21, 21, 17, 8, 11, 25)
wordcloud(city, freq=pm25, colors=rainbow(3), random.color=T)

# 4.3 �ִϸ޴ϼ�: �ٶ����� ������
# �ٶ����� ������
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

# 4.4 ����ũ����: ���������� ������ API ��� ���
install.packages("rvest")
library(rvest)

url <- "https://www.data.go.kr/tcs/dss/selectDataSetList.do"
html <- read_html(url)
html

# 4.5 ���� ������ �ùķ��̼� 
# ���� �ո��� ������ Ȯ��
plot(NA,
     xlab="������ ���� ȸ��", ylab="�ո��� ������ ����",
     xlim=c(0, 100), ylim=c(0, 1),
     main="���� ������ Ƚ���� ���� �ո��� ���� Ȯ�� ��ȭ")
abline(h=0.5, col="red", lty=2)
count <- 0
for(n in 1:100) {
  coin <- sample(c("�ո�", "�޸�"), 1)
  if (coin == "�ո�")
    count = count + 1
  prob <- count / n
  points(n, prob)
  Sys.sleep(1)
}