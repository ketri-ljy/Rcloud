install.packages("magick")
library(magick)

lion_bg <- image_read("./img/lion_bg.png")
lion_1 <- image_read("./img/lion_1.png")
lion_2 <- image_read("./img/lion_2.png")

lion_bg <- image_scale(lion_bg,"600x300!")
lion_1 <- image_scale(lion_1,"100x50!")
lion_2 <- image_scale(lion_2,"100x50!")

print(lion_bg)

print(lion_1)

print(lion_2)

# ?̹??? ?ռ? ?׽?Ʈ
img <- image_composite(lion_bg, lion_1, offset = "+100+200")
print(img)

# ?̹??? ?̵?
moving <- 0
x <- -100
y <- 150
while(TRUE) {
  if (x < 0)
    position <- paste(x, "+", y, sep="")
  else
    position <- paste("+", x, "+", y, sep="")
  if (moving %% 2 == 0) {
    img <- image_composite(lion_bg, lion_1, offset = position)
  } else {
    img <- image_composite(lion_bg, lion_2, offset = position)
  }
  print(img)
  Sys.sleep(0.3)
  if (x > 600)
    break
  moving <- moving + 1
  x <- x + 20
}
