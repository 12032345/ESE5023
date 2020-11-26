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

# MingYANG noticed：
# you sould make the intercept to be zero and recount the slop
# you should make full use of these data, not just to make a translation 
# and the revised slop should be 0.001921806
# the end
