library(ggplot2)
library(xkcd)
library(patchwork)
library(png)

data = data.frame(year=c(2007:2011), number=c(56470, 56998, 59686, 61783, 64251))
data$xmin = data$year - 0.1
data$xmax = data$year + 0.1
data$ymin = 50000
data$ymax = data$number
xrange = range(min(data$xmin)-0.1, max(data$xmax) + 0.1)
yrange = range(min(data$ymin)+500, max(data$ymax) + 1000)
mapping = aes(xmin=xmin,ymin=ymin,xmax=xmax,ymax=ymax)
p = ggplot() + xkcdrect(mapping,data) +
    xkcdaxis(xrange,yrange) +
    xlab("Year") + ylab("Volunteers at Caritas Spain")
gg = p + theme(panel.background = element_rect(fill = "Brown"),
               plot.background = element_rect(fill = "orange"))
image = readPNG("E:/darsi/r/internacional.png", native = TRUE)
gg_image = gg +
  inset_element(p = image,
                left = 0.1,
                bottom = 0.7,
                right = 0.45,
                top = 0.97)
gg_image
ggsave("gg_image.png")
