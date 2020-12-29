#2.1
#载入库和数据
library(tidyr)
library(dplyr)
library(astsa)
library(forecast)

Mydata <- read.csv("2281305.csv",header=T)
Mydata_tbl <- as_tibble(Mydata)

#将数据转换成年月-温度的形式
Mydata1 <- Mydata_tbl %>%
  filter(substr(TMP,1,5)!="+9999") %>%
  select(DATE,TMP) %>%
  separate(DATE,c("year","month","time")) %>%
  unite("year_month",c("year","month"),sep = "_") %>%
  separate(TMP,c("v","tmp")) %>%
  mutate(tmp1 = as.numeric(tmp)) %>%
  group_by(year_month)%>%
  summarise(mean_tmp = mean(tmp1))

#进行时间序列分析
tmp2 <- ts(Mydata1$mean_tmp,start = c(2010,1),frequency = 12)
plot(tmp2)

#2.2
tmp2_components <- decompose(tmp2)
plot(tmp2_components)
hist(tmp2_components$random,prob = TRUE)
curve(dnorm(x, mean=mean(tmp2_components$random,na.rm=T),
            sd=sd(tmp2_components$random,na.rm=T)),
      add=TRUE, col="red")
#2.3建立arima模型
acf(tmp2)
pacf(tmp2)
model <- auto.arima(tmp2)
summary(model)

#2.4进行预测，真实值和预测值比较
predict <- forecast(model,2)
plot(predict)

Mydata_9 <- Mydata1 %>%
  filter(year_month == "2020_09")
realtmp <- Mydata_9$mean_tmp
bias <- (realtmp-predict$mean[1])/realtmp
bias

# MingYANG noticed:
# plot should be added to report 
# good work
