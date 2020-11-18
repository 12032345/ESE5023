# Libraries
library(ggplot2)
library(dplyr)
library(hrbrthemes)

# data
data <- data.frame(
  day = as.Date("2020-06-14") - 0:364,
  value1 = runif(365) + seq(-140, 224)^2 / 10000,
  value2 = runif(365) + seq(-140, 224)^2 / 10000
)

p <- ggplot(data) +
  geom_line( aes(x=day, y=value1),color="#93d5dc") + 
  geom_line( aes(x=day, y=value2),color="steelblue") + 
  geom_point(aes(x=day, y=value1),size = 1) +
  geom_point(aes(x=day, y=value2),color="#ed4845",size = 1)
  xlab("") +
  theme_ipsum() +
  theme(axis.text.x=element_text(angle=60, hjust=1)) +
  scale_x_date(limit=c(as.Date("2020-01-01"),as.Date("2020-02-11"))) +
  ylim(0,1.5)

p