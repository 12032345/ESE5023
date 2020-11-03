#5.1
Mydata <- read.csv("big bang.csv",head = T)
plot(Distance~Velocity,data = Mydata)

#5.2
x <- Mydata$Velocity
y <- Mydata$Distance
fit <-lm(y~x)
summary(fit)
abline(fit, lwd = 3, col = "#ee3f4d")

#5.4
summary(fit)$coefficients