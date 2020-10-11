data <- read.csv('2005西双版纳降雨量.csv')

data2  <- data %>%
  group_by(月)%>%
  summarize(month_max = max(总降水量.mm.))

time <- data2$月
max_jsl <- data2$month_max
plot(time,max_jsl, type="l", col="blue")

总降水量.mm.[which(总降水量 = -9999)] <- NA

data %>%
  group_by(月)%>%
  summarize(month_max = max(总降水量.mm.),month_min = min(总降水量.mm.),month_mean = mean(总降水量.mm.,na.rm=T),month_median = median(总降水量.mm.),month_var = var(总降水量.mm.))
