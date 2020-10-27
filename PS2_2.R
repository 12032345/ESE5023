library(tidyr)
library(dplyr)
library(ggplot2)

My_data <- read.csv("C:/Users/lenovo/Documents/2281305.csv", header = T)

My_data_t <- as_tibble(My_data)
My_data_t %>%
  select(DATE,WND) %>%
  filter(as.numeric(substr(WND,1,3))<=360,substr(WND,5,7)=="1,N",as.numeric(substr(WND,9,12))<=900,substr(WND,14,14)=="1") %>%
  separate(DATE,c("year","month","dayhour")) %>%
  unite("year_month",c("year","month"),sep="-",remove=FALSE) %>%
  group_by(year_month) %>%
  summarise(meanspeed = mean(as.numeric(substr(WND,1,3)))) %>%
  # MingYANG 
  # the wind speed is substr(WND,9,12), instead of  substr(WND,1,3)
  separate(year_month,c("year","month"),remove=FALSE) %>%
  ggplot(aes(x=year_month,y=meanspeed,group=1,color=month)) + #group=1:https://cloud.tencent.com/developer/ask/88025
  geom_line() 

# well done for denote difference months with different color! 
