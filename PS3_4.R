Mydata <- read.csv("Elevation.csv",head = T)
plot(Temperature~Elevation,data = Mydata,main = "Atmospheric Lapse Rate")
x <- Mydata$Elevation
y <- Mydata$Temperature
fit <- lm(y~x)
summary(fit)
abline(fit, lwd = 3, col = "#ee3f4d")
summary(fit)$coefficients

# good work
