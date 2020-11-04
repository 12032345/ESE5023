#t-test
library(MASS)
Mydata1 <- UScrime
t.test(Prob ~ So, data = Mydata)

#ANOVA
library(multcomp)
Mydata2 <- cholesterol
fit1 <- aov(response ~ trt, data = Mydata2)
summary(fit1)

#linear regression
Mydata3 <- women
plot(weight ~ height, data = Mydata3)
fit2 <- lm(weight ~ height, data = Mydata3)
summary(fit2)
abline(fit2)