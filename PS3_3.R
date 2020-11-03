library("dplyr")
library(tidyr)

# data
Pregnant_nonvegetarians<-c(185,189,187,181,150,176,NA,NA,NA,NA,NA,NA)
Pregnant_vegetarians<-c(171,174,202,171,207,125,189,179,163,174,184,186)
Nonpregnant_vegetarians<-c(210,139,172,198,177,NA,NA,NA,NA,NA,NA,NA)

# do a one-way anova to prove that pregnant vegetarians tend to have lower zinc levels than pregnant nonvegetarians
zinc <- aov(Pregnant_nonvegetarians ~ Pregnant_vegetarians)
summary(zinc)