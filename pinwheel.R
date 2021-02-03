install.packages("imager")
library(imager)

img_path <- "./img/pinwheel.png"
img <- load.image(img_path)
plot(img)

img <- resize(img, size_x = 400L, size_y = 400L)
plot(img, xlim=c(0, 400), ylim=c(0, 400))

angle <- 0
while(TRUE) {
  angle <- angle + 10
  imrotate(img, angle, cx=200,cy=200) %>%  
    plot(axes=FALSE)
  Sys.sleep(0.4) 
}