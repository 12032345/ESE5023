library(tidyr)
library(dplyr)
library(ggplot2)

My_data <- read.csv("C:/Users/lenovo/Documents/2005西双版纳降雨量.csv")
My_data_t <- as_tibble(My_data)
My_data_t %>%
  group_by(月)%>%
  summarize(month_max = max(总降水量.mm.))%>%
  ggplot(aes(x=月,y=month_max))+
  geom_line()+
  scale_x_continuous(breaks = c(2,4,6,8,10,12))
  
